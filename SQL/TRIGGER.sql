--TRIGGER
--1. Ch? có nhân viên c?a hàng ???c phép l?p hóa ??n
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

--2. Nhân viên ph?i ?? 18 tu?i thì m?i ???c nh?n vào làm 
--(Ngày vào làm c?a nhân viên tr? ngày sinh c?a nhân viên ?ó ph?i l?n h?n ho?c b?ng 18 n?m)
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

--3. Ngày l?p hóa ??n ph?i l?n h?n ngày sinh c?a khách hàng mua hóa ??n ?ó 
CREATE OR REPLACE TRIGGER trg_hd_kh
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

--4. Ngày l?p hóa ??n ph?i l?n h?n ho?c b?ng v?i ngày vào làm c?a nhân viên l?p hóa ??n ?ó 
CREATE OR REPLACE TRIGGER trg_hd_nv
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

--5. T?ng s? l??ng c?a m?t s?n ph?m ph?i b?ng t?ng s? l??ng c?a s?n ph?m ?ó t?i các c? s? ch?a nó
--UPDATE OF SL_CH ON CTTON
CREATE OR REPLACE TRIGGER trg_upd_ctton_slch
AFTER UPDATE OF SL_CH ON CTTON
FOR EACH ROW
BEGIN
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) + :NEW.SL_CH
    WHERE MASP = :NEW.MASP;
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) - :OLD.SL_CH
    WHERE MASP = :OLD.MASP;
END;
--UPDATE SL_KHO ON CTTON
CREATE OR REPLACE TRIGGER trg_upd_ctton_slkho
AFTER UPDATE OF SL_KHO ON CTTON
FOR EACH ROW
BEGIN
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) + :NEW.SL_KHO
    WHERE MASP = :NEW.MASP AND :new.MA_CH = 'CH01';
    UPDATE SANPHAM SET TONGSL = NVL(TONGSL,0) - :OLD.SL_KHO
    WHERE MASP = :OLD.MASP AND :old.MA_CH = 'CH01';
END;
--UPDATE OF TONGSL ON SANPHAM
CREATE OR REPLACE TRIGGER trg_upd_sp_tongsl
BEFORE UPDATE OF TONGSL ON SANPHAM
FOR EACH ROW
DECLARE 
    tong INT;
BEGIN
    tong:=func_tongsl(:new.MASP);
    IF (tong != :new.TONGSL) THEN 
    BEGIN
        RAISE_APPLICATION_ERROR(-20107, 'Tong so luog cua SANPHAM phai bang tong so luong sanpham do tai cac co so chua no');
    END;
    END IF;
END;

--6. Tr? giá hóa ??n ph?i b?ng (t?ng s? l??ng nhân ??n giá c?a t?ng s?n ph?m thu?c hóa ??n ?ó) * (1-ph?n tr?m khuy?n mãi) 
create or replace TRIGGER trg_ins_cthd_hd
AFTER INSERT ON CTHD
FOR EACH ROW
DECLARE 
    ptram KHUYENMAI.PHANTRAM%TYPE;
    tgia HOADON.TRIGIA%TYPE;
    ma_km KHUYENMAI.MAKM%TYPE;
    dgia SANPHAM.DONGIA%TYPE;
BEGIN
    SELECT TRIGIA INTO tgia
    FROM HOADON 
    WHERE MAHD = :new.MAHD;
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

--7. Ng??i qu?n lý c?a m?t nhân viên ph?i là nhân viên t?i ??n v? nhân nhiên ?ó ?ang làm vi?c
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

--8. Qu?n lý c?a m?t ??n v? ph?i là ng??i làm vi?c t?i ??n v? ?ó
--CUAHANG
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
--KHO
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
--PHONGBAN
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
--9. H? s? l??ng m?i c?a m?t nhân viên sau khi c?p nh?p ph?i l?n h?n ho?c b?ng h? s? l??ng c? c?a nhân viên ?ó 
create or replace trigger trg_upd_heso_nv
before update on NHANVIEN
for each row
begin
    if(:new.HESO < :old.HESO) then
        RAISE_APPLICATION_ERROR(-20112, 'He so luong moi cua NHANVIEN phai lon hon he so luong cu cua NHANVIEN do');
    end if;
end;