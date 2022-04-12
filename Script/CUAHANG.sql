--CUAHANG

CREATE TABLE CUAHANG (
    MACH CHAR(4) NOT NULL,
    DIACHI VARCHAR(50),
    MAQL CHAR(4) NOT NULL,
    SDT VARCHAR(10),
    CONSTRAINT pk_ch PRIMARY KEY (MACH)
);
-----------------------------------------------
--Khoa ngoai
ALTER TABLE CUAHANG ADD CONSTRAINT fk_ch FOREIGN KEY (MAQL) REFERENCES NHANVIEN(MAQL);
------------------------------------------------

insert into CUAHANG values('CH01', '18 Nguyen Hue, p.1, quan 1, TP.HCM', 'NV01', '0145123456');
insert into CUAHANG values('CH02', '27 Hoang Van Thu, p.2, quan 2, TP.HCM', 'NV02', '0245546421');
insert into CUAHANG values('CH03', '36 Tan Son Nhat, p.3, quan 3, TP.HCM', 'NV03', '0348759308');
insert into CUAHANG values('CH04', '48 Dien Bien Phu, p.4, quan 4, TP.HCM', 'NV04', '0448486484');
insert into CUAHANG values('CH05', '52 Nguyen Tri Phuong, p.5, quan 5, TP.HCM', 'NV05', '0589424705');