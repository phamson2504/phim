package com.project.khoaluan.dao;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.project.khoaluan.entity.ChiTietSuat;
import com.project.khoaluan.model.Phim;
import com.project.khoaluan.model.SuatChieu;

public interface SuatChieuRepository extends CrudRepository<SuatChieu, Integer>{
	
	SuatChieu findById(int id);
	
	@Query(value="select new com.project.khoaluan.entity.ChiTietSuat(s.id,s.gioBatDau,s.ngayChieu,s.giaVe,r.id,r.tenRap,p.id,ph.id,ph.tenPhim,tl.ten) "
			+ " FROM KhuVuc kv INNER JOIN kv.raps r INNER JOIN r.phongs p"
			+ " INNER JOIN p.suats s INNER JOIN s.phim ph INNER JOIN s.theloai tl where ph.id=?1 ORDER BY r.tenRap")
	List<ChiTietSuat> findChiTiet(int idPhim);
	
	@Query(value="select new com.project.khoaluan.entity.ChiTietSuat(s.id,s.gioBatDau,s.ngayChieu,s.giaVe,r.id,r.tenRap,p.id,ph.id,ph.tenPhim,tl.ten) "
			+ " FROM KhuVuc kv INNER JOIN kv.raps r INNER JOIN r.phongs p"
			+ " INNER JOIN p.suats s INNER JOIN s.phim ph INNER JOIN s.theloai tl where ph.id=:idPhim and"
			+ "  s.ngayChieu =:startDate and kv.id =:idKV and tl.id =:idTL ORDER BY s.gioBatDau ASC")
	List<ChiTietSuat> suatChieuCuaPhim(@Param("idPhim") int idPhim,
			@Param("startDate") LocalDate startDate,@Param("idKV") int idKV, @Param("idTL") int idTL);
	
	@Query(value="select min(g.ngayChieu) from SuatChieu g INNER JOIN g.phim ph where ph.id=:idPhim and g.ngayChieu >= :startDate")
	LocalDate ngayChieuGannhat(@Param("startDate") LocalDate startDate ,@Param("idPhim") int idPhim);
	
	@Query(value="select new com.project.khoaluan.entity.ChiTietSuat(s.id,s.gioBatDau,s.ngayChieu,s.giaVe,r.id,r.tenRap,p.id,ph.id,ph.tenPhim,tl.ten) "
			+ " FROM KhuVuc kv INNER JOIN kv.raps r INNER JOIN r.phongs p"
			+ " INNER JOIN p.suats s INNER JOIN s.phim ph INNER JOIN s.theloai tl where r.id=:idRap and"
			+ "  s.ngayChieu =:startDate and tl.id =:idTL ORDER BY s.gioBatDau ASC")
	List<ChiTietSuat> suatChieuCuaRap(@Param("idRap") int idRap,
			@Param("startDate") LocalDate startDate, @Param("idTL") int idTL);
	@Query(value="select new com.project.khoaluan.entity.ChiTietSuat(s.id,s.gioBatDau,s.ngayChieu,s.giaVe,r.id,r.tenRap,p.id,ph.id,ph.tenPhim,tl.ten) "
			+ " FROM KhuVuc kv INNER JOIN kv.raps r INNER JOIN r.phongs p"
			+ " INNER JOIN p.suats s INNER JOIN s.phim ph INNER JOIN s.theloai tl where s.id =:id")
	ChiTietSuat ChiTietSuatChieu(@Param("id") int id);
	
}
