-- L?y mã nhân viên
create or replace FUNCTION func_getManv (tendangnhap TAIKHOAN.TENDN%TYPE, mk TAIKHOAN.MATKHAU%TYPE)
                        RETURN CHAR
AS
    tai_khoan TAIKHOAN%ROWTYPE;
BEGIN
    SELECT * INTO tai_khoan
    FROM TAIKHOAN
    WHERE TENDN = tendangnhap AND MATKHAU = mk;
    RETURN tai_khoan.MANV;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN NULL;
END;

-- L?y vai trò (role) c?a nhân viên
create or replace FUNCTION func_ktDangNhap (tendangnhap TAIKHOAN.TENDN%TYPE, mk TAIKHOAN.MATKHAU%TYPE)
                        RETURN INT
AS
    tai_khoan TAIKHOAN%ROWTYPE;
BEGIN
    SELECT * INTO tai_khoan
    FROM TAIKHOAN
    WHERE TENDN = tendangnhap AND MATKHAU = mk;
    RETURN tai_khoan.VAITRO;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN -1;
END;

-- Cursor DS Nhap kho
create or replace function func_ds_nhapkho return sys_refcursor is
    rc sys_refcursor;
begin
    open rc for 
    select sp.MASP, TENSP, DONGIA, 20 - SL_KHO AS SL_NHAP
    FROM SANPHAM sp JOIN CTTON ON sp.MASP = CTTON.MASP
    WHERE MA_CH = 'CH01' AND SL_KHO <10;
    return rc;
end;
-- Cursor DS Xuat kho
create or replace function func_ktsl_xuatkho (ma_sp CTTON.MASP%TYPE)
                                        RETURN INT
AS
    dem INT;
    slkho INT;
BEGIN
    SELECT DISTINCT SL_KHO INTO slkho
    FROM CTTON
    WHERE MASP = ma_sp;
    SELECT SUM(10 - SL_CH) INTO dem
    FROM CTTON
    WHERE MASP = ma_sp AND SL_CH < 5;
    IF(slkho >= dem) THEN
        RETURN 1;
    ELSE 
        RETURN 0;
    END IF;
END;

create or replace function func_ds_xuatkho return sys_refcursor is
    rc sys_refcursor;
begin
    open rc for 
    select ch.MACH, DIACHI, sp.MASP, TENSP, 15 - SL_CH AS SL_XUAT
    FROM (SANPHAM sp JOIN CTTON ON sp.MASP = CTTON.MASP) JOIN CUAHANG ch ON CTTON.MA_CH = ch.MACH
    WHERE SL_CH <5 AND func_ktsl_xuatkho(sp.MASP) = 1;
    return rc;
end;

create or replace PROCEDURE sp_ins_hd (ma_hd HOADON.MAHD%TYPE,
                                        ngayhd HOADON.NGHD%TYPE,
                                        ma_kh KHACHHANG.MAKH%TYPE,
                                        ma_nv NHANVIEN.MANV%TYPE)
AS
BEGIN
    INSERT INTO HOADON VALUES (ma_hd, ngayhd, ma_kh, ma_nv, 0, 'KM00');
END;

create or replace PROCEDURE sp_ins_kh(ma_kh KHACHHANG.MAKH%TYPE,
                                    ten KHACHHANG.HOTEN%TYPE,
                                    gt KHACHHANG.GIOITINH%TYPE,
                                    dt KHACHHANG.SDT%TYPE,
                                    ns KHACHHANG.NGSINH%TYPE,
                                    dc KHACHHANG.DIACHI%TYPE)
AS   
BEGIN
    INSERT INTO KHACHHANG VALUES(ma_kh,ten,gt,dt,ns,dc);
END;

create or replace PROCEDURE sp_ins_nv(ma_nv NHANVIEN.MANV%TYPE,
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
    INSERT INTO NHANVIEN VALUES(ma_nv,ten,gt,dienthoai,ns,dc,cm,nvl,maql,hs,dv);
END;