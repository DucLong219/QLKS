using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace CaChepFinal2.Data.DataModel
{
    public interface IChuongTrinh
    {
        IQueryable<ChuongTrinh> GetAll();
        ChuongTrinh GetOneById(int? id);
        void New(ChuongTrinh obj);
        void Edit(ChuongTrinh obj);
        void Delete(int id);
    }
    public  class ChuongTrinh
    {
        public ChuongTrinh()
        {
            Phongs = new HashSet<Phong>();
        }

        public int Id { get; set; }
        [Display(Name = "Name")]
        public string TenChuongTrinh { get; set; }
        [Display(Name = "Increate or Decreate Price")]
        public int TiLeThayDoiGia { get; set; }

        [Display(Name = "isInCreaet ")]

        public bool IsTang { get; set; }

        public virtual ICollection<Phong> Phongs { get; set; }
    }
}
