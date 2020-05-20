﻿using Models.Framework;
using Models.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Models.Dao
{
	public class HocVuDao
	{
		DoAnDbContext db = null;
		public HocVuDao()
		{
			db = new DoAnDbContext();
		}
		public int Insert(HocVu entity)
		{
			db.HocVus.Add(entity);
			db.SaveChanges();
			return entity.HocVuID;
		}
		public int Insert2(HocVu entity, User a)
		{
			db.HocVus.Add(entity);
			entity.TinhTrang = false;
			entity.UserID = a.UserID;
			entity.NgayTao = DateTime.Now;
			db.SaveChanges();
			return entity.HocVuID;
		}
		public bool Update(HocVu entity)
		{

			try
			{
				var hocvu = db.HocVus.Find(entity.HocVuID);
				hocvu.NgayTao = entity.NgayTao;
				hocvu.YeuCauThem = entity.YeuCauThem;
				hocvu.TinhTrang = entity.TinhTrang;
				hocvu.ParentID = entity.ParentID;
				hocvu.ChuyenVienID = entity.ChuyenVienID;
				hocvu.NgayHen = entity.NgayHen;
				hocvu.DanhMucID = entity.DanhMucID;
				hocvu.UserID = entity.UserID;
				hocvu.DonViID = entity.DonViID;
				db.SaveChanges();
				return true;
			}
			catch (Exception ex)
			{
				return false;
			}
		}
		public IEnumerable<HocVuViewModel> ListHocVu(string searchString, int page, int pageSize)
		{
			IQueryable<HocVuViewModel> model;
			model = from a in db.HocVus
					join b in db.DonVis on a.DonViID equals b.DonViID
					join c in db.Users on a.UserID equals c.UserID
					join d in db.DanhMucs on a.DanhMucID equals d.DanhMucID
					join e in db.VaiTroes on c.VaiTroID equals e.VaiTroID
					select new HocVuViewModel()
					{
						HocVuID = a.HocVuID,
						NgayTao = a.NgayTao,
						YeuCauThem = a.YeuCauThem,
						TinhTrang = a.TinhTrang,
						UserName = c.UserName,
						ParentID = a.ParentID,
						NgayHen = a.NgayHen,
						TenDanhMuc = d.TenDanhMuc,
						TenDonVi = b.TenDonVi,
						TenVaiTro = e.TenVaiTro
					};
			if (!string.IsNullOrEmpty(searchString))
			{
				model = model.Where(x => x.TenDonVi.Contains(searchString) || x.UserName.Contains(searchString) || x.TenDanhMuc.Contains(searchString));
			}
			return model.OrderBy(x => x.NgayTao).ToPagedList(page, pageSize);
		}
		public HocVu ViewDetail(int id)
		{
			return db.HocVus.Find(id);
		}
		public bool Delete(int id)
		{

			try
			{
				var hocvu = db.HocVus.Find(id);
				db.HocVus.Remove(hocvu);
				db.SaveChanges();
				return true;
			}
			catch (Exception ex)
			{
				return false;
			}
		}
	}
}
