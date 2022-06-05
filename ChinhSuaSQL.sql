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

create or replace PROCEDURE sp_upd_ctton_ch (ma_sp SANPHAM.MASP%TYPE,
                                            mach CUAHANG.MACH%TYPE,    
                                            sl CTTON.SL_CH%TYPE)
AS
BEGIN
    UPDATE CTTON SET SL_CH = sl WHERE MASP= ma_sp AND MA_CH = mach;
END;

create or replace PROCEDURE sp_upd_ctton_kho (ma_sp SANPHAM.MASP%TYPE,
                                            makho KHO.MAKHO%TYPE,    
                                            sl CTTON.SL_KHO%TYPE)
AS
BEGIN
    UPDATE CTTON SET SL_KHO = sl WHERE MASP= ma_sp AND MA_KHO = makho;
END;

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
    SELECT MANV, TRIGIA INTO ma_nv, tgia
    FROM HOADON 
    WHERE MAHD = :new.MAHD;

    SELECT MADV INTO mach
    FROM NHANVIEN 
    WHERE MANV = ma_nv;

    SELECT SL_CH INTO slch
    FROM CTTON
    WHERE MA_CH = mach AND MASP = :new.MASP;
    sp_upd_ctton_ch(:new.MASP, mach,  slch - :new.SL);

    ptram:= func_ptramkm_hd(tgia);

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

create or replace TRIGGER trg_upd_ctton_slch
AFTER UPDATE OF SL_CH ON CTTON
FOR EACH ROW
BEGIN
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) + :NEW.SL_CH
    WHERE MASP = :NEW.MASP;
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) - :OLD.SL_CH
    WHERE MASP = :OLD.MASP;
END;

create or replace TRIGGER trg_upd_ctton_slkho
AFTER UPDATE OF SL_KHO ON CTTON
FOR EACH ROW
BEGIN
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) + :NEW.SL_KHO
    WHERE MASP = :NEW.MASP AND :new.MA_CH = 'CH01';
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) - :OLD.SL_KHO
    WHERE MASP = :OLD.MASP AND :old.MA_CH = 'CH01';
END;