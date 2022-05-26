--PHONGBAN
CREATE TABLE PHONGBAN (
    MAPB CHAR(4) NOT NULL   ,
    TENPB VARCHAR(50),
    MATRGPB CHAR(4) NOT NULL,
    SDT VARCHAR(10),
    EMAIL VARCHAR(40),
    CONSTRAINT pk_pb PRIMARY KEY (MAPB)
);
ALTER TABLE PHONGBAN ADD CONSTRAINT fk_pb_nv FOREIGN KEY (MATRGPB) REFERENCES NHANVIEN(MANV);

--INSERT INTO PHONGBAN
insert into PHONGBAN values('PB01','Phong kinh doanh','NV06','0941872433','trgkd.pb1@gmail.com')
insert into PHONGBAN values('PB02','Phong ke toan tai chinh','NV07','0833814231','trgkt.pb02@gmail.com')
insert into PHONGBAN values('PB03','Phong nhan su','NV08','0912748121','trgns.pb03@gmail.com')
insert into PHONGBAN values('PB04','Ph?ng ky thuat','NV09','0936412643','trgkt.pb04@gmail.com')



