--TRIGGER
--1. Ch? c� nh�n vi�n c?a h�ng ???c ph�p l?p h�a ??n
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

--2. Nh�n vi�n ph?i ?? 18 tu?i th� m?i ???c nh?n v�o l�m 
--(Ng�y v�o l�m c?a nh�n vi�n tr? ng�y sinh c?a nh�n vi�n ?� ph?i l?n h?n ho?c b?ng 18 n?m)
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

--3. Ng�y l?p h�a ??n ph?i l?n h?n ng�y sinh c?a kh�ch h�ng mua h�a ??n ?� 
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

--4. Ng�y l?p h�a ??n ph?i l?n h?n ho?c b?ng v?i ng�y v�o l�m c?a nh�n vi�n l?p h�a ??n ?� 
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

--5. T?ng s? l??ng c?a m?t s?n ph?m ph?i b?ng t?ng s? l??ng c?a s?n ph?m ?� t?i c�c c? s? ch?a n�
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

--9. H? s? l??ng m?i c?a m?t nh�n vi�n sau khi c?p nh?p ph?i l?n h?n ho?c b?ng h? s? l??ng c? c?a nh�n vi�n ?� 
create or replace trigger trg_upd_heso_nv
before update on NHANVIEN
for each row
begin
    if(:new.HESO < :old.HESO) then
        RAISE_APPLICATION_ERROR(-20108, 'He so luong moi cua NHANVIEN phai lon hon he so luong cu cua NHANVIEN do');
    end if;
end;