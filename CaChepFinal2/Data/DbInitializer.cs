using CaChepFinal2.Utility;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CaChepFinal2.Data.DataModel;
namespace CaChepFinal2.Data
{
    public class DbInitializer : IDbInitializer
    {
        private readonly ApplicationDbContext _db;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;

        public DbInitializer(ApplicationDbContext db, UserManager<IdentityUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            _db = db;
            _roleManager = roleManager;
            _userManager = userManager;
        }

        public async void Initialize()
        {
            if (_db.Database.GetPendingMigrations().Count() > 0)
            {
                _db.Database.Migrate();
            }

            if (_db.Roles.Any(r => r.Name == SD.SuperAdminEndUser)) return;

            _roleManager.CreateAsync(new IdentityRole(SD.AdminEndUser)).GetAwaiter().GetResult();
            _roleManager.CreateAsync(new IdentityRole(SD.SuperAdminEndUser)).GetAwaiter().GetResult();

            _userManager.CreateAsync(new AccountSys
            {
                UserName = "phuocnglt@gmail.com",
                Email = "phuocnglt@gmail.com",
                Name = "Nguyen Duy Phuoc",
                EmailConfirmed = true
            }, "Abc123//").GetAwaiter().GetResult();

            IdentityUser user = await _db.Users.Where(u => u.Email == "phuocnglt@gmail.com").FirstOrDefaultAsync();

            await _userManager.AddToRoleAsync(user, SD.SuperAdminEndUser);
        }


    }

    public interface IDbInitializer
    {
        void Initialize();
    }
}