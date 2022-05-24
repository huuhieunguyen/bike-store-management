--1. Thêm 1 nhân viên
CREATE OR REPLACE PROCEDURE sp_ins_nv(
                                    ten NHANVIEN.HOTEN%TYPE,
                                    gt NHANVIEN.GIOITINH%TYPE,
                                    dienthoai NHANVIEN.SDT%TYPE,
                                    ns NHANVIEN.NGSINH%TYPE,
                                    dc NHANVIEN.DIACHI%TYPE,
                                    cm NHANVIEN.CMND%TYPE,
                                    nvl NHANVIEN.NGVL%TYPE,
                                    maql NHANVIEN.MA_NGQL%TYPE,
                                    hs NHANVIEN.HESO%TYPE,
                                    dv NHANVIEN.MADV%TYPE)
AS   
    ma_nv char(4);
BEGIN
    ma_nv := func_taomanv;
    INSERT INTO NHANVIEN VALUES(ma_nv,ten,gt,dienthoai,ns,dc,cm,nvl,maql,hs,dv);
END;

--2. S?a 1 nhân viên
CREATE OR REPLACE PROCEDURE sp_upd_nv(ma_nv NHANVIEN.MANV%TYPE,
                                    ten NHANVIEN.HOTEN%TYPE,
                                    gt NHANVIEN.GIOITINH%TYPE,
                                    dienthoai NHANVIEN.SDT%TYPE,
                                    ns NHANVIEN.NGSINH%TYPE,
                                    dc NHANVIEN.DIACHI%TYPE,
                                    cm NHANVIEN.CMND%TYPE,
                                    nvl NHANVIEN.NGVL%TYPE,
                                    maql NHANVIEN.MA_NGQL%TYPE,
                                    hs NHANVIEN.HESO%TYPE,
                                    dv NHANVIEN.MADV%TYPE)
AS   
BEGIN
    UPDATE NHANVIEN
    SET MANV=ma_nv, HOTEN=ten, GIOITINH=gt, SDT =dienthoai, NGSINH=ns, DIACHI=dc, CMND=cm, NGVL = nvl, MA_NGQL=maql, HESO=hs, MADV=dv
    WHERE MANV=ma_nv;
END;

--3. Xóa 1 nhân viên
CREATE OR REPLACE PROCEDURE sp_del_nv(ma_nv NHANVIEN.MANV%TYPE)
AS   
BEGIN
    DELETE FROM NHANVIEN WHERE MANV=ma_nv;
END;

--4. Thêm 1 khách hàng
CREATE OR REPLACE PROCEDURE sp_ins_kh(
                                    ten KHACHHANG.HOTEN%TYPE,
                                    gt KHACHHANG.GIOITINH%TYPE,
                                    dt KHACHHANG.SDT%TYPE,
                                    ns KHACHHANG.NGSINH%TYPE,
                                    dc KHACHHANG.DIACHI%TYPE)
AS   
    ma_kh char(4);
BEGIN
    ma_kh := func_taomakh;
    INSERT INTO KHACHHANG VALUES(ma_kh,ten,gt,dt,ns,dc);
END;

--5. S?a 1 khách hàng
CREATE OR REPLACE PROCEDURE sp_upd_kh(ma_kh KHACHHANG.MAKH%TYPE,
                                    ten KHACHHANG.HOTEN%TYPE,
                                    gt KHACHHANG.GIOITINH%TYPE,
                                    dt KHACHHANG.SDT%TYPE,
                                    ns KHACHHANG.NGSINH%TYPE,
                                    dc KHACHHANG.DIACHI%TYPE)
AS   
BEGIN
    UPDATE KHACHHANG
    SET MAKH=ma_kh, HOTEN=ten, GIOITINH=gt, SDT =dt, NGSINH=ns, DIACHI=dc
    WHERE MAKH=ma_kh;
END;

--6. Xóa 1 khách hàng
CREATE OR REPLACE PROCEDURE sp_del_kh(ma_kh KHACHHANG.MAKH%TYPE)
AS   
BEGIN
    DELETE FROM KHACHHANG WHERE MAKH=ma_kh;
END;

--7. Thêm 1 s?n ph?m 
CREATE OR REPLACE PROCEDURE sp_ins_sp(kihieu VARCHAR,
                                    ten_sp SANPHAM.TENSP%TYPE, 
                                    don_vi SANPHAM.DVT%TYPE,
                                    nuoc_sx SANPHAM.NUOCSX%TYPE, 
                                    gia SANPHAM.DONGIA%TYPE)
AS
    ma_sp SANPHAM.MASP%TYPE;
    mch CUAHANG.MACH%TYPE;
    CURSOR ma_ch  IS
        SELECT MACH
        FROM CUAHANG;
BEGIN
    ma_sp := func_taomasp(kihieu);
    insert into SANPHAM values (ma_sp, ten_sp, don_vi, nuoc_sx, gia, 0);
    OPEN ma_ch;
    LOOP 
        FETCH ma_ch INTO mch;
        EXIT WHEN ma_ch%NOTFOUND;
        INSERT INTO CTTON VALUES (ma_sp, mch, 0, 'KOO1', 0);
    END LOOP;
END;

--8. S?a 1 s?n ph?m
CREATE OR REPLACE PROCEDURE sp_upd_sp (ma_sp SANPHAM.MASP%TYPE, 
                                    ten_sp SANPHAM.TENSP%TYPE, 
                                    don_vi SANPHAM.DVT%TYPE,
                                    nuoc_sx SANPHAM.NUOCSX%TYPE, 
                                    gia SANPHAM.DONGIA%TYPE)
AS
BEGIN
      UPDATE SANPHAM
      SET MASP = ma_sp, TENSP = ten_sp, DVT = don_vi, NUOCSX = nuoc_sx, DONGIA = gia
      WHERE MASP = ma_sp;
END;

--9. Xóa 1 s?n ph?m
CREATE OR REPLACE PROCEDURE sp_del_sp (ma_sp SANPHAM.MASP%TYPE)
AS
BEGIN
    DELETE FROM CTTON WHERE MASP = ma_sp;
    DELETE FROM SANPHAM WHERE MASP = ma_sp;
END;

--10. S?a s? l??ng s?n ph?m ? c?a hàng
CREATE OR REPLACE PROCEDURE sp_upd_ctton_ch (ma_sp SANPHAM.MASP%TYPE,
                                            mach CUAHANG.MACH%TYPE,    
                                            sl CTTON.SL_CH%TYPE)
AS
BEGIN
    UPDATE CTTON SET SL_CH = sl WHERE MASP= ma_sp AND MA_CH = mach;
END;

--11. S?a s? l??ng s?n ph?m ? kho
CREATE OR REPLACE PROCEDURE sp_upd_ctton_kho (ma_sp SANPHAM.MASP%TYPE,
                                            makho KHO.MAKHO%TYPE,    
                                            sl CTTON.SL_KHO%TYPE)
AS
BEGIN
    UPDATE CTTON SET SL_KHO = sl WHERE MASP= ma_sp AND MA_KHO = makho;
END;

--12. Thêm CTHD 
CREATE OR REPLACE PROCEDURE sp_ins_cthd (ma_hd HOADON.MAHD%TYPE,
                                        ma_sp SANPHAM.MASP%TYPE,
                                        ma_nv NHANVIEN.MANV%TYPE,
                                        soluong CTHD.SL%TYPE)
AS
    sl_yeucau INT;
    kq INT;
BEGIN
    kq:= func_trungchuyen_sp(ma_sp, ma_nv, soluong);
    IF (kq = 1) THEN 
        INSERT INTO CTHD VALUES (ma_hd, ma_sp, soluong);
    ELSE
        DBMS_OUTPUT.PUT_LINE('San pham khong du so luong');
    END IF;
END;

--13. Thêm hóa ??n (kh?i t?o)
CREATE OR REPLACE PROCEDURE sp_ins_hd (ngayhd HOADON.NGHD%TYPE,
                                        ma_kh KHACHHANG.MAKH%TYPE,
                                        ma_nv NHANVIEN.MANV%TYPE)
AS
    ma_hd HOADON.MAHD%TYPE;
BEGIN
    ma_hd:=func_taomahd;
    INSERT INTO HOADON VALUES (ma_hd, ngayhd, ma_kh, ma_nv, 0, NULL);
END;

--14. Thêm hóa ??n (c?p nh?p ??y ?? các giá tr? còn thi?u)
CREATE OR REPLACE PROCEDURE sp_upd_hd (ma_hd HOADON.MAHD%TYPE)
AS
    tgia HOADON.TRIGIA%TYPE;
    pTram KHUYENMAI.PHANTRAM%TYPE;
    ma_km KHUYENMAI.MAKM%TYPE;
BEGIN
    tgia:= func_tinh_trigia_hd(ma_hd);
    ma_km:=func_makm_hd(tgia);
    pTram:=func_ptramkm_hd(tgia);
    tgia:=tgia*(1-pTram);
    UPDATE HOADON 
    SET TRIGIA = tgia, MAKM = ma_km
    WHERE MAHD = ma_hd;
END;
