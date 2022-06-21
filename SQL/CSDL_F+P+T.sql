--Function tính tr? giá hóa ??n
create or replace FUNCTION func_tinh_trigia_hd (ma_hd HOADON.MAHD%TYPE)
                                RETURN NUMBER
AS
    tgia NUMBER;
BEGIN
    SELECT SUM (SL*DONGIA) INTO tgia
    FROM CTHD JOIN SANPHAM sp ON CTHD.MASP = sp.MASP
    WHERE MAHD= ma_hd;
    RETURN tgia;
END;

--Function t́m mă khuy?n măi c?a hóa ??n
create or replace FUNCTION func_makm_hd (tgia HOADON.TRIGIA%TYPE)  RETURN HOADON.MAKM%TYPE
AS
    ma_km HOADON.MAKM%TYPE;
BEGIN
    SELECT MAKM INTO ma_km
    FROM KHUYENMAI
    WHERE PHANTRAM = (SELECT MAX(PHANTRAM)
                        FROM KHUYENMAI
                        WHERE DINHMUC <= tgia);
    RETURN ma_km;
END;

--Function tính ph?n tr?m khuy?n măi c?a hóa ??n
create or replace FUNCTION func_pTramKM_hd (tgia HOADON.TRIGIA%TYPE)  RETURN FLOAT
AS
    pTram FLOAT;
BEGIN
    SELECT MAX(PHANTRAM) INTO pTram
    FROM KHUYENMAI
    WHERE DINHMUC <= tgia;
    RETURN pTram;
END;

--Function tính t?ng s? l??ng c?a 1 s?n ph?m
create or replace FUNCTION func_tongsl (ma_sp SANPHAM.MASP%TYPE) RETURN INT
AS
    tongch INT;
    tongkho INT;
    tong INT;
BEGIN
    SELECT SUM(SL_CH) INTO tongch
    FROM CTTON
    WHERE MASP = ma_sp;

    SELECT SL_KHO INTO tongkho
    FROM CTTON
    WHERE MASP = ma_sp AND MA_CH = 'CH01';
    tong:= tongch + tongkho;
    RETURN tong;
END;

--Procedure c?p nh?p t?ng s? l??ng s?n ph?m
create or replace PROCEDURE sp_tongsl
IS 
    msp SANPHAM.MASP%TYPE;
    tong SANPHAM.TONGSL%TYPE;
    CURSOR ma_sp  IS
        SELECT MASP
        FROM SANPHAM;
BEGIN
    OPEN ma_sp;
    LOOP 
        FETCH ma_sp INTO msp;
        EXIT WHEN ma_sp%NOTFOUND;
        tong:=func_tongsl(msp);
        UPDATE SANPHAM
        SET TONGSL = tong
        WHERE MASP = msp;
    END LOOP;
END;

--Procedure c?p nh?p tr? giá hóa ??n
create or replace PROCEDURE sp_trigia
IS 
    mhd HOADON.MAHD%TYPE;
    tgia HOADON.TRIGIA%TYPE;
    pTram KHUYENMAI.PHANTRAM%TYPE;
    ma_km HOADON.MAKM%TYPE;
    CURSOR ma_hd  IS
        SELECT MAHD
        FROM HOADON;
BEGIN
    OPEN ma_hd;
    LOOP 
        FETCH ma_hd INTO mhd;
        EXIT WHEN ma_hd%NOTFOUND;
        tgia:= func_tinh_trigia_hd(mhd);
        ma_km:=func_makm_hd(tgia);
        pTram:=func_ptramkm_hd(tgia);
        tgia:=tgia*(1-pTram);
        UPDATE HOADON
        SET TRIGIA = tgia, MAKM =ma_km
        WHERE MAHD = mhd;
    END LOOP;
END;

--PL/SQL c?p nh?p t?ng s? l??ng và tr? giá 
BEGIN
    sp_tongsl;
    sp_trigia;
END;

--Function tính doanh thu c?a 1 c?a hàng theo tháng n?m
create or replace function func_doanhthu_ch (ma_ch CUAHANG.MACH%TYPE, 
                                                thang int, nam int)
                            return number
as
    dt number;
begin
    select SUM(hd.trigia) into dt
    from HOADON hd join NHANVIEN nv on hd.MANV = nv.MANV
    where thang = extract (month from hd.NGHD)
        and nam = extract (year from hd.NGHD) and MADV=ma_ch;
    return dt;
end;

--Function tính doanh thu toàn h? th?ng theo tháng n?m
create or replace function func_doanhthu_ht (thang int, nam int)
                            return number
as
    dt number;
begin
    select SUM(hd.trigia) into dt
    from HOADON hd 
    where thang = extract (month from hd.NGHD)
        and nam = extract (year from hd.NGHD);
    return dt;
end;

--Function t?o DS nh?p kho
create or replace function func_ds_nhapkho return sys_refcursor is
    rc sys_refcursor;
begin
    open rc for 
    select sp.MASP, TENSP, DONGIA, 40 - SL_KHO AS SL_NHAP
    FROM SANPHAM sp JOIN CTTON ON sp.MASP = CTTON.MASP
    WHERE MA_CH = 'CH01' AND SL_KHO <10;
    return rc;
end;

--Function ktra s? l??ng xu?t kho
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

--Function t?o DS xu?t kho
create or replace function func_ds_xuatkho return sys_refcursor is
    rc sys_refcursor;
begin
    open rc for 
    select ch.MACH, DIACHI, sp.MASP, TENSP, 15 - SL_CH AS SL_XUAT
    FROM (SANPHAM sp JOIN CTTON ON sp.MASP = CTTON.MASP) JOIN CUAHANG ch ON CTTON.MA_CH = ch.MACH
    WHERE SL_CH <5 AND func_ktsl_xuatkho(sp.MASP) = 1;
    return rc;
end;

--Function ktra 2 ngày 
create or replace FUNCTION func_du18tuoi ( x DATE, y DATE ) RETURN INT
AS
BEGIN
    if (extract (year from y) - extract (year from x) >= 18) then
            if(extract (year from y) - extract (year from x) = 18) then
                if (extract (month from y) >= extract (month from x))then
                BEGIN
                    if (extract (month from y) = extract (month from x)) then
                        if (extract (day from y) >= extract (day from x)) then
                            RETURN 1;
                        else 
                            RETURN 0;
                        end if;
                    else 
                        RETURN 1;
                    end if;
                END;
                else 
                    RETURN 0;
                end if;
            else 
                return 1;
            end if;
    else 
        return 0;
    end if;
END;

--Function l?y MANV
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

--Function ktra ??ng nh?p
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

--Function ktra s? l??ng s?n ph?m
create or replace FUNCTION func_ktsl_sp (ma_sp SANPHAM.MASP%TYPE,
                                                ma_nv NHANVIEN.MANV%TYPE,
                                                sl_yeucau INT)
                            RETURN INT
AS
    mach CUAHANG.MACH%TYPE;
    tongslton INT;
    sl_yc INT := sl_yeucau;
BEGIN
    SELECT MADV INTO mach
    FROM NHANVIEN
    WHERE MANV = ma_nv;
    SELECT SL_CH + SL_KHO INTO tongslton
    FROM CTTON
    WHERE MASP = ma_sp AND MA_CH = mach;

    IF(tongslton < sl_yc) THEN
        RETURN 0;
    ELSE
        RETURN 1;
    END IF;
END;

--Function t?o mă hóa ??n
create or replace FUNCTION func_taomahd RETURN HOADON.MAHD%TYPE
AS 
    ma_hd HOADON.MAHD%TYPE;
    dem int;
    sl int;
BEGIN
    SELECT COUNT(MAHD) INTO dem
    FROM HOADON;
    dem := dem+1;
    IF(dem>9) THEN
        ma_hd :='HD' || dem;
    ELSE
        ma_hd := 'HD' || 0 || dem;
    END IF;
    SELECT COUNT(MAHD) into sl FROM HOADON WHERE MAHD=ma_hd;
    WHILE  sl!=0
    LOOP
        dem:=dem+1;
        IF(dem>9) THEN
            ma_hd :='HD' || dem;
        ELSE
            ma_hd :='HD' || 0 || dem;
        END IF;
        SELECT COUNT(MAHD) into sl FROM HOADON WHERE MAHD=ma_hd;
    END LOOP;
    RETURN ma_hd;
END;

--Function t?o mă khách hàng
create or replace FUNCTION func_taomakh RETURN KHACHHANG.MAKH%TYPE
AS 
    ma_kh KHACHHANG.MAKH%TYPE;
    dem int;
    sl int;
BEGIN
    SELECT COUNT(MAKH) INTO dem
    FROM KHACHHANG;
    dem := dem+1;
    IF(dem>9) THEN
        ma_kh :='KH' || dem;
    ELSE
        ma_kh := 'KH' || 0 || dem;
    END IF;
    SELECT COUNT(MAKH) into sl FROM KHACHHANG WHERE MAKH=ma_kh;
    WHILE  sl!=0
    LOOP
        dem:=dem+1;
        IF(dem>9) THEN
            ma_kh :='KH' || dem;
        ELSE
            ma_kh :='KH' || 0 || dem;
        END IF;
        SELECT COUNT(MAKH) into sl FROM KHACHHANG WHERE MAKH=ma_kh;
    END LOOP;
    RETURN ma_kh;
END;

--Function t?o mă khuy?n măi
create or replace FUNCTION func_taomakm RETURN KHUYENMAI.MAKM%TYPE
AS 
    ma_km KHUYENMAI.MAKM%TYPE;
    dem int;
    sl int;
BEGIN
    SELECT COUNT(MAKM) INTO dem
    FROM KHUYENMAI;
    dem := dem;
    IF(dem>9) THEN
        ma_km :='KM' || dem;
    ELSE
        ma_km := 'KM' || 0 || dem;
    END IF;
    SELECT COUNT(MAKM) into sl FROM KHUYENMAI WHERE MAKM=ma_km;
    WHILE  sl!=0
    LOOP
        dem:=dem+1;
        IF(dem>9) THEN
            ma_km :='KM' || dem;
        ELSE
            ma_km :='KM' || 0 || dem;
        END IF;
        SELECT COUNT(MAKM) into sl FROM KHUYENMAI WHERE MAKM=ma_km;
    END LOOP;
    RETURN ma_km;
END;   

--Function t?o mă nhân viên
create or replace FUNCTION func_taomanv RETURN NHANVIEN.MANV%TYPE
AS 
    ma_nv NHANVIEN.MANV%TYPE;
    dem int;
    sl int;
BEGIN
    SELECT COUNT(MANV) INTO dem
    FROM NHANVIEN;
    dem := dem+1;
    IF(dem>9) THEN
        ma_nv :='NV' || dem;
    ELSE
        ma_nv := 'NV' || 0 || dem;
    END IF;
    SELECT COUNT(MANV) into sl FROM NHANVIEN WHERE MANV=ma_nv;
    WHILE  sl!=0
    LOOP
        dem:=dem+1;
        IF(dem>9) THEN
            ma_nv :='NV' || dem;
        ELSE
            ma_nv :='NV' || 0 || dem;
        END IF;
        SELECT COUNT(MANV) into sl FROM NHANVIEN WHERE MANV=ma_nv;
    END LOOP;
    RETURN ma_nv;
END;   

--Function t?o mă s?n ph?m
create or replace FUNCTION func_taomasp (kihieu VARCHAR) RETURN SANPHAM.MASP%TYPE
AS 
    ma_sp SANPHAM.MASP%TYPE;
    dem int;
    sl int;
BEGIN
    SELECT COUNT(MASP) INTO dem
    FROM SANPHAM
    WHERE MASP LIKE kihieu||'%';
    dem := dem+1;
    IF(dem>9) THEN
        ma_sp :=kihieu || dem;
    ELSE
        ma_sp := kihieu || 0 || dem;
    END IF;
    SELECT COUNT(MASP) into sl FROM SANPHAM WHERE MASP=ma_sp;
    WHILE  sl!=0
    LOOP
        dem:=dem+1;
        IF(dem>9) THEN
            ma_sp :=kihieu || dem;
        ELSE
            ma_sp :=kihieu || 0 || dem;
        END IF;
        SELECT COUNT(MASP) into sl FROM SANPHAM WHERE MASP=ma_sp;
    END LOOP;
    RETURN ma_sp;
END;

--Procedure xóa khách hàng
create or replace PROCEDURE sp_del_kh(ma_kh KHACHHANG.MAKH%TYPE)
AS   
BEGIN
    DELETE FROM KHACHHANG WHERE MAKH=ma_kh;
END;

--Procedure xóa nhân viên
create or replace PROCEDURE sp_del_nv(ma_nv NHANVIEN.MANV%TYPE)
AS   
BEGIN
    DELETE FROM NHANVIEN WHERE MANV=ma_nv;
END;

--Procedure xóa s?n ph?m
create or replace PROCEDURE sp_del_sp (ma_sp SANPHAM.MASP%TYPE)
AS
BEGIN
    DELETE FROM CTTON WHERE MASP = ma_sp;
    DELETE FROM SANPHAM WHERE MASP = ma_sp;
END;

--Procedure c?p nh?p CTTON ? c?a hàng
create or replace PROCEDURE sp_upd_ctton_ch (ma_sp SANPHAM.MASP%TYPE,
                                            mach CUAHANG.MACH%TYPE,    
                                            sl CTTON.SL_CH%TYPE)
AS
BEGIN
    UPDATE CTTON SET SL_CH = sl WHERE MASP= ma_sp AND MA_CH = mach;
END;

--Procedure c?p nh?p CTTON ? kho
create or replace PROCEDURE sp_upd_ctton_kho (ma_sp SANPHAM.MASP%TYPE,
                                            makho KHO.MAKHO%TYPE,    
                                            sl CTTON.SL_KHO%TYPE)
AS
BEGIN
    UPDATE CTTON SET SL_KHO = sl WHERE MASP= ma_sp AND MA_KHO = makho;
END;

--Function trung chuy?n s?n ph?m
create or replace FUNCTION func_trungchuyen_sp (ma_sp SANPHAM.MASP%TYPE,
                                                ma_nv NHANVIEN.MANV%TYPE,
                                                sl_yeucau INT)
                            RETURN INT
AS
    mach CUAHANG.MACH%TYPE;
    makho KHO.MAKHO%TYPE;
    slch CTTON.SL_CH%TYPE;
    slkho CTTON.SL_KHO%TYPE;
    sl_yc INT := sl_yeucau;
BEGIN
    SELECT MADV INTO mach
    FROM NHANVIEN
    WHERE MANV = ma_nv;
    SELECT MA_KHO, SL_CH, SL_KHO INTO makho, slch, slkho
    FROM CTTON
    WHERE MASP = ma_sp AND MA_CH = mach;

    IF(slch + slkho < sl_yc) THEN
        RETURN 0;
    ELSE
    BEGIN
        IF (sl_yc > slch) THEN
        BEGIN
            sl_yc:= sl_yc - slch;
            sp_upd_ctton_ch (ma_sp, mach, slch + sl_yc);
            sp_upd_ctton_kho (ma_sp, makho, slkho - sl_yc);
        END; 
        END IF;
        RETURN 1;
    END;
    END IF;
END;

--Procedure thêm CTHD
create or replace PROCEDURE sp_ins_cthd (ma_hd HOADON.MAHD%TYPE,
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

--Procedure kh?i t?o hóa ??n
create or replace PROCEDURE sp_ins_hd (ma_hd HOADON.MAHD%TYPE,
                                        ngayhd HOADON.NGHD%TYPE,
                                        ma_kh KHACHHANG.MAKH%TYPE,
                                        ma_nv NHANVIEN.MANV%TYPE)
AS
BEGIN
    INSERT INTO HOADON VALUES (ma_hd, ngayhd, ma_kh, ma_nv, 0, 'KM00');
END;

--Procedure thêm khách hàng
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

--Procedure thêm nhân viên
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
    vtro INT;
BEGIN
    IF (dv LIKE 'CH%') THEN 
    BEGIN 
        IF (maql = ma_nv) THEN vtro := 0;
        ELSE
            vtro := 1;
        END IF;
    END;
        ELSE vtro := 2;
    END IF;
    INSERT INTO NHANVIEN VALUES(ma_nv,ten,gt,dienthoai,ns,dc,cm,nvl,maql,hs,dv);
    INSERT INTO TAIKHOAN VALUES(ma_nv,lower(ma_nv || 'htxedap'), lower(ma_nv||'@123'), vtro);
END;

--Procedure thêm s?n ph?m
create or replace PROCEDURE sp_ins_sp(kihieu VARCHAR,
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
    ma_sp := func_taomasp(upper(kihieu));
    insert into SANPHAM values (ma_sp, ten_sp, LOWER(don_vi), nuoc_sx, gia, 0);
    OPEN ma_ch;
    LOOP 
        FETCH ma_ch INTO mch;
        EXIT WHEN ma_ch%NOTFOUND;
        INSERT INTO CTTON VALUES (ma_sp, mch, 0, 'KOO1', 0);
    END LOOP;
END;

--Procedure c?p nh?p khách hàng
create or replace PROCEDURE sp_upd_kh(ma_kh KHACHHANG.MAKH%TYPE,
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

--Procedure c?p nh?p nhân viên
create or replace PROCEDURE sp_upd_nv(ma_nv NHANVIEN.MANV%TYPE,
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

--Procedure c?p nh?p s?n ph?m
create or replace PROCEDURE sp_upd_sp (ma_sp SANPHAM.MASP%TYPE, 
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

--TRIGGER
--Ngay lap HOADON phai lon hon ngay sinh cua KHACHHANG
create or replace TRIGGER trg_hd_kh
AFTER INSERT ON HOADON
FOR EACH ROW
DECLARE 
    ng_sinh KHACHHANG.NGSINH%TYPE;
BEGIN
    select KH.NGSINH into ng_sinh
    from KHACHHANG KH 
    WHERE KH.MAKH = :new.MAKH;    
    IF(ng_sinh >= :new.NGHD) THEN
        RAISE_APPLICATION_ERROR(-20105, 'Ngay lap HOADON phai lon hon ngay sinh cua KHACHHANG');
    END IF;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR (-20104, 'MAKH khong ton tai');
END;

--Ngay lap HOADON phai lon hon ngay vao lam cua NHANVIEN
create or replace TRIGGER trg_hd_nv
AFTER INSERT ON HOADON
FOR EACH ROW
DECLARE 
    ng_vl NHANVIEN.NGVL%TYPE;
BEGIN
    select nv.NGVL into ng_vl
    from NHANVIEN nv 
    WHERE nv.MANV = :new.MANV;    
    IF(ng_vl >= :new.NGHD) THEN
        RAISE_APPLICATION_ERROR(-20106, 'Ngay lap HOADON phai lon hon ngay vao lam cua NHANVIEN');
    END IF;
END;

--C?p nh?p hóa ??n khi thêm CTHD
create or replace TRIGGER trg_ins_cthd_hd
AFTER INSERT ON CTHD
FOR EACH ROW
DECLARE 
    ptram KHUYENMAI.PHANTRAM%TYPE;
    tgia HOADON.TRIGIA%TYPE;
    ma_km KHUYENMAI.MAKM%TYPE;
    dgia SANPHAM.DONGIA%TYPE;

    mach CUAHANG.MACH%TYPE;
    ma_nv NHANVIEN.MANV%TYPE; 
    slch INT;
BEGIN
    SELECT MANV, TRIGIA, MAKM INTO ma_nv, tgia, ma_km
    FROM HOADON 
    WHERE MAHD = :new.MAHD;

    SELECT MADV INTO mach
    FROM NHANVIEN 
    WHERE MANV = ma_nv;

    SELECT SL_CH INTO slch
    FROM CTTON
    WHERE MA_CH = mach AND MASP = :new.MASP;
    sp_upd_ctton_ch(:new.MASP, mach,  slch - :new.SL);

    SELECT PHANTRAM  INTO ptram
    FROM KHUYENMAI
    WHERE MAKM = ma_km;

    SELECT DONGIA INTO dgia
    FROM SANPHAM
    WHERE MASP = :new.MASP;

    tgia:=tgia/(1-ptram) + dgia * :new.SL;
    ma_km:=func_makm_hd(tgia);
    ptram:= func_ptramkm_hd(tgia);
    tgia:=tgia*(1-ptram);
    UPDATE HOADON 
    SET TRIGIA = tgia, MAKM = ma_km
    WHERE MAHD = :NEW.MAHD;
END;

--Quan ly cua cua hang phai la nhan vien lam viec tai cua hang do
create or replace TRIGGER trg_ngql_ch
BEFORE INSERT OR UPDATE OF MA_NGQL ON CUAHANG
FOR EACH ROW
DECLARE 
    ma_noilamviec NHANVIEN.MADV%TYPE;
BEGIN
    SELECT nv.MADV INTO ma_noilamviec
    FROM NHANVIEN nv
    WHERE nv.MANV = :new.MA_NGQL;

    IF(ma_noilamviec!=:new.MACH) THEN
        RAISE_APPLICATION_ERROR (-20109, 'Quan ly cua cua hang phai la nhan vien lam viec tai cua hang do');
    END IF;     
END;

--Quan ly cua kho phai la nhan vien lam viec tai kho do
create or replace TRIGGER trg_ngql_kho
BEFORE INSERT OR UPDATE OF MA_NGQL ON KHO
FOR EACH ROW
DECLARE 
    ma_noilamviec NHANVIEN.MADV%TYPE;
BEGIN
    SELECT nv.MADV INTO ma_noilamviec
    FROM NHANVIEN nv
    WHERE nv.MANV = :new.MA_NGQL;

    IF(ma_noilamviec!=:new.MAKHO) THEN
        RAISE_APPLICATION_ERROR (-20100, 'Quan ly cua kho phai la nhan vien lam viec tai kho do');
        END IF;
END;

--Nhan vien va nguoi quan ly cua nhan vien do phai cung noi lam viec (cung ma don vi)
create or replace TRIGGER trg_ngql_nv
BEFORE INSERT ON NHANVIEN
FOR EACH ROW
DECLARE 
    ma_noilamviec NHANVIEN.MADV%TYPE;
BEGIN
    SELECT nv.MADV INTO ma_noilamviec
    FROM NHANVIEN nv
    WHERE nv.MANV = :new.MA_NGQL;
    IF(ma_noilamviec!=:new.MADV) THEN
        RAISE_APPLICATION_ERROR (-20108, 'Nhan vien va nguoi quan ly cua nhan vien do phai cung noi lam viec (cung ma don vi)');
    END IF;   
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR (-20104, 'MA_NGQL khong ton tai');
END;

--Quan ly cua phong ban phai la nhan vien lam viec tai phong ban do
create or replace TRIGGER trg_ngql_pb
BEFORE INSERT OR UPDATE OF MA_TRGPB ON PHONGBAN
FOR EACH ROW
DECLARE 
    ma_noilamviec NHANVIEN.MADV%TYPE;
BEGIN
    SELECT nv.MADV INTO ma_noilamviec
    FROM NHANVIEN nv
    WHERE nv.MANV = :new.MA_TRGPB;

    IF(ma_noilamviec!=:new.MAPB) THEN
        RAISE_APPLICATION_ERROR (-20111, 'Quan ly cua phong ban phai la nhan vien lam viec tai phong ban do');
    END IF;     
END;

--NHANVIEN phai lon hon 18 tuoi thi moi duoc nhan vao lam
create or replace trigger trg_nv_du18tuoi
BEFORE insert or update on NHANVIEN
for each row
declare age float;
begin
    begin
        if(func_du18tuoi(:new.NGSINH, :new.NGVL)=0) then
            RAISE_APPLICATION_ERROR(-20103,'NHANVIEN phai lon hon 18 tuoi thi moi duoc nhan vao lam');
        end if;
    end;
end;

--NHANVIEN lap hoa don khong phai NHANVIEN cua hang
create or replace trigger trg_nvCH_hd
before insert on HOADON
for each row
DECLARE 
    noilamviec NHANVIEN.MADV%TYPE;
begin
    SELECT MADV INTO noilamviec
    FROM NHANVIEN nv
    WHERE nv.MANV = :new.MANV;
    IF(noilamviec NOT LIKE ('CH%')) THEN
        RAISE_APPLICATION_ERROR (-20102, 'NHANVIEN lap hoa don khong phai NHANVIEN cua hang');
    end if;
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR (-20101, 'MANV khong ton tai');
end;

--C?p nh?p t?ng s? l??ng SP khi update CTTON
create or replace TRIGGER trg_upd_ctton_slkho
AFTER UPDATE OF SL_KHO ON CTTON
FOR EACH ROW
BEGIN
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) + :NEW.SL_KHO
    WHERE MASP = :NEW.MASP AND :new.MA_CH = 'CH01';
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) - :OLD.SL_KHO
    WHERE MASP = :OLD.MASP AND :old.MA_CH = 'CH01';
END;

--He so luong moi cua NHANVIEN phai lon hon he so luong cu cua NHANVIEN do
create or replace trigger trg_upd_heso_nv
before update on NHANVIEN
for each row
begin
    if(:new.HESO < :old.HESO) then
        RAISE_APPLICATION_ERROR(-20112, 'He so luong moi cua NHANVIEN phai lon hon he so luong cu cua NHANVIEN do');
    end if;
end;
--