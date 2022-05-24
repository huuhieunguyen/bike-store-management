--1. Tính doanh thu 1 c?a hàng 
create or replace function func_doanhthu_ch (ma_ch CUAHANG.MACH%TYPE, thang int, nam int)
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

--2. Tính doanh thu toàn h? th?ng
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

--3. Tính l??ng t?ng nhân viên
create or replace function func_luong_nv (ma_nv NHANVIEN.MANV%TYPE) 
                                return number
as
    hs NHANVIEN.HESO%TYPE;
    sal number;
    basSal number := 4000;
begin 
    select HESO into hs
    from NHANVIEN
    where MANV = ma_nv;
    sal := hs*basSal;
    return sal;
end;

--4. Tính tr? giá hóa ??n
CREATE OR REPLACE FUNCTION func_tinh_trigia_hd (ma_hd HOADON.MAHD%TYPE)
                                RETURN NUMBER
AS
    tgia NUMBER;
BEGIN
    SELECT SUM (SL*DONGIA) INTO tgia
    FROM CTHD JOIN SANPHAM sp ON CTHD.MASP = sp.MASP
    WHERE MAHD= ma_hd;
    RETURN tgia;
END;

--5. Tìm mã khuy?n mãi c?a 1 hóa ??n
CREATE OR REPLACE FUNCTION func_makm_hd (tgia HOADON.TRIGIA%TYPE)  RETURN HOADON.MAKM%TYPE
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

--6. Tr? v? ph?n tr?m khuy?n mãi
CREATE OR REPLACE FUNCTION func_pTramKM_hd (tgia HOADON.TRIGIA%TYPE)  RETURN FLOAT
AS
    pTram FLOAT;
BEGIN
    SELECT MAX(PHANTRAM) INTO pTram
    FROM KHUYENMAI
    WHERE DINHMUC <= tgia;
    RETURN pTram;
END;

--7. T?o 1 MANV m?i
CREATE OR REPLACE FUNCTION func_taomanv RETURN NHANVIEN.MANV%TYPE
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

--8. T?o 1 MAKH m?i
CREATE OR REPLACE FUNCTION func_taomakh RETURN KHACHHANG.MAKH%TYPE
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

--9. T?o MASP m?i
CREATE OR REPLACE FUNCTION func_taomasp (kihieu VARCHAR) RETURN SANPHAM.MASP%TYPE
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

--10. T?o 1 MAHD m?i
CREATE OR REPLACE FUNCTION func_taomahd RETURN HOADON.MAHD%TYPE
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

--11. Trung chuy?n s?n ph?m
CREATE OR REPLACE FUNCTION func_trungchuyen_sp (ma_sp SANPHAM.MASP%TYPE,
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
    SELECT SL_CH, SL_KHO INTO slch, slkho
    FROM CTTON
    WHERE MASP = ma_sp AND MA_CH = mach;
    
    IF(slch + slkho < sl_yc) THEN
        RETURN -1;
    ELSE
    BEGIN
        IF (sl_yc >= slch) THEN
        BEGIN
            sl_yc:= sl_yc - slch;
            IF(sl_yeucau>0) THEN
            BEGIN
                sp_upd_ctton_ch (ma_sp, mach, slch + sl_yc);
                sp_upd_ctton_kho (ma_sp, makho, slkho - sl_yc);
            END;
            END IF;
        END; 
        END IF;
        RETURN 1;
    END;
    END IF;
END;