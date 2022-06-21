CREATE TABLE TAIKHOAN (
    MANV CHAR(4) NOT NULL ,
    TENDN VARCHAR(30) NOT NULL,
    MATKHAU VARCHAR(20) NOT NULL,
    CONSTRAINT pk_tk PRIMARY KEY (MANV)
); 
CREATE TABLE CUAHANG (
    MACH CHAR(4) NOT NULL,
    DIACHI VARCHAR(50) NOT NULL,
    MA_NGQL CHAR(4) NOT NULL,
    SDT INT NOT NULL,
    CONSTRAINT pk_ch PRIMARY KEY (MACH)
);
CREATE TABLE PHONGBAN (
    MAPB CHAR(4) NOT NULL,
    TENPB VARCHAR(50) NOT NULL,
    MA_TRGPB CHAR(4) NOT NULL,
    SDT INT NOT NULL,
    EMAIL VARCHAR(50) NOT NULL,
    CONSTRAINT pk_pb PRIMARY KEY (MAPB)
);
CREATE TABLE KHO (
    MAKHO CHAR(4) NOT NULL,
    DIACHI VARCHAR(50) NOT NULL,
    MA_NGQL CHAR(4) NOT NULL,
    SDT INT NOT NULL,
    CONSTRAINT pk_kho PRIMARY KEY (MAKHO)
);
CREATE TABLE NHANVIEN (
    MANV CHAR(4) NOT NULL,
    HOTEN VARCHAR(50) NOT NULL,
    GIOITINH VARCHAR(3) NOT NULL,
    SDT INT NOT NULL,
    NGSINH DATE NOT NULL,
    DIACHI VARCHAR(50) NOT NULL,
    CMND INT NOT NULL,
    NGVL DATE NOT NULL,
    MA_NGQL CHAR(4) NOT NULL,
    HESO FLOAT NOT NULL,
    MADV CHAR(4) NOT NULL,
    CONSTRAINT pk_nv PRIMARY KEY (MANV)
);
CREATE TABLE KHACHHANG (
    MAKH CHAR(4) NOT NULL,
    HOTEN VARCHAR(50) NOT NULL,
    GIOITINH VARCHAR(3) NOT NULL,
    SDT INT NOT NULL,
    NGSINH DATE,
    DIACHI VARCHAR(50),
    CONSTRAINT pk_kh PRIMARY KEY (MAKH)
);
CREATE TABLE SANPHAM (
    MASP CHAR(4) NOT NULL,
    TENSP VARCHAR(50) NOT NULL,
    DVT VARCHAR(10) NOT NULL,
    NUOCSX VARCHAR(50) NOT NULL,
    DONGIA NUMBER NOT NULL,
    TONGSL INT,
    CONSTRAINT pk_sp PRIMARY KEY (MASP)
);
CREATE TABLE CTTON (
    MASP CHAR(4) NOT NULL,
    MA_CH CHAR(4) NOT NULL,
    SL_CH INT,
    MA_KHO CHAR(4) NOT NULL,
    SL_KHO INT,
    CONSTRAINT pk_ton PRIMARY KEY (MASP, MA_CH, MA_KHO)
);
CREATE TABLE HOADON (
    MAHD CHAR(4) NOT NULL,
    NGHD DATE NOT NULL,
    MAKH CHAR(4) NOT NULL,
    MANV CHAR(4) NOT NULL,
    TRIGIA NUMBER,
    MAKM CHAR(4),
    CONSTRAINT pk_hd PRIMARY KEY (MAHD)
);
CREATE TABLE CTHD (
    MAHD CHAR(4) NOT NULL, 
    MASP CHAR(4),
    SL INT,
    CONSTRAINT pk_cthd PRIMARY KEY (MAHD, MASP)
);
CREATE TABLE KHUYENMAI (
    MAKM CHAR(4) NOT NULL,
    NOIDUNG VARCHAR(50),
    DINHMUC NUMBER NOT NULL,
    PHANTRAM FLOAT,
    CONSTRAINT pk_km PRIMARY KEY (MAKM)
);

--Du lieu
--TAIKHOAN
INSERT INTO TAIKHOAN VALUES ('NV01', 'nv01htxedap', 'nv01@123');
INSERT INTO TAIKHOAN VALUES ('NV02', 'nv02htxedap', 'nv02@123');
INSERT INTO TAIKHOAN VALUES ('NV03', 'nv03htxedap', 'nv03@123');
INSERT INTO TAIKHOAN VALUES ('NV04', 'nv04htxedap', 'nv04@123');
INSERT INTO TAIKHOAN VALUES ('NV05', 'nv05htxedap', 'nv05@123');
INSERT INTO TAIKHOAN VALUES ('NV06', 'nv06htxedap', 'nv06@123');
INSERT INTO TAIKHOAN VALUES ('NV07', 'nv07htxedap', 'nv07@123');
INSERT INTO TAIKHOAN VALUES ('NV08', 'nv08htxedap', 'nv08@123');
INSERT INTO TAIKHOAN VALUES ('NV09', 'nv09htxedap', 'nv09@123');
INSERT INTO TAIKHOAN VALUES ('NV10', 'nv10htxedap', 'nv10@123');
INSERT INTO TAIKHOAN VALUES ('NV11', 'nv11htxedap', 'nv11@123');
INSERT INTO TAIKHOAN VALUES ('NV12', 'nv12htxedap', 'nv12@123');
INSERT INTO TAIKHOAN VALUES ('NV13', 'nv13htxedap', 'nv13@123');
INSERT INTO TAIKHOAN VALUES ('NV14', 'nv14htxedap', 'nv14@123');
INSERT INTO TAIKHOAN VALUES ('NV15', 'nv15htxedap', 'nv15@123');
INSERT INTO TAIKHOAN VALUES ('NV16', 'nv16htxedap', 'nv16@123');
INSERT INTO TAIKHOAN VALUES ('NV17', 'nv17htxedap', 'nv17@123');
INSERT INTO TAIKHOAN VALUES ('NV18', 'nv18htxedap', 'nv18@123');
INSERT INTO TAIKHOAN VALUES ('NV19', 'nv19htxedap', 'nv19@123');
INSERT INTO TAIKHOAN VALUES ('NV20', 'nv20htxedap', 'nv20@123');
INSERT INTO TAIKHOAN VALUES ('NV21', 'nv21htxedap', 'nv21@123');
INSERT INTO TAIKHOAN VALUES ('NV22' , 'nv22htxedap', 'nv22@123');
INSERT INTO TAIKHOAN VALUES ('NV23' , 'nv23htxedap', 'nv23@123');
INSERT INTO TAIKHOAN VALUES ('NV24' , 'nv24htxedap', 'nv24@123');
INSERT INTO TAIKHOAN VALUES ('NV25' , 'nv25htxedap', 'nv25@123');
INSERT INTO TAIKHOAN VALUES ('NV26' , 'nv26htxedap', 'nv26@123');
INSERT INTO TAIKHOAN VALUES ('NV27' , 'nv27htxedap', 'nv27@123');
INSERT INTO TAIKHOAN VALUES ('NV28' , 'nv28htxedap', 'nv28@123');
INSERT INTO TAIKHOAN VALUES ('NV29' , 'nv29htxedap', 'nv29@123');
INSERT INTO TAIKHOAN VALUES ('NV30' , 'nv30htxedap', 'nv30@123');
INSERT INTO TAIKHOAN VALUES ('NV31' , 'nv31htxedap', 'nv31@123');
INSERT INTO TAIKHOAN VALUES ('NV32' , 'nv32htxedap', 'nv32@123');
INSERT INTO TAIKHOAN VALUES ('NV33' , 'nv33htxedap', 'nv33@123');
INSERT INTO TAIKHOAN VALUES ('NV34' , 'nv34htxedap', 'nv34@123');
INSERT INTO TAIKHOAN VALUES ('NV35' , 'nv35htxedap', 'nv35@123');
INSERT INTO TAIKHOAN VALUES ('NV36' , 'nv36htxedap', 'nv36@123');
INSERT INTO TAIKHOAN VALUES ('NV37' , 'nv37htxedap', 'nv37@123');
INSERT INTO TAIKHOAN VALUES ('NV38' , 'nv38htxedap', 'nv38@123');
INSERT INTO TAIKHOAN VALUES ('NV39' , 'nv39htxedap', 'nv39@123');
INSERT INTO TAIKHOAN VALUES ('NV40' , 'nv40htxedap', 'nv40@123');
INSERT INTO TAIKHOAN VALUES ('NV41' , 'nv41htxedap', 'nv41@123');
INSERT INTO TAIKHOAN VALUES ('NV42' , 'nv42htxedap', 'nv42@123');

--CUAHANG
insert into CUAHANG values('CH01', '18 Nguyen Hue, p.1, quan 1, TP.HCM', 'NV01', '0145123456');
insert into CUAHANG values('CH02', '27 Hoang Van Thu, p.2, quan 2, TP.HCM', 'NV06', '0245546421');
insert into CUAHANG values('CH03', '36 Tan Son Nhat, p.3, quan 3, TP.HCM', 'NV11', '0348759308');
insert into CUAHANG values('CH04', '48 Dien Bien Phu, p.4, quan 4, TP.HCM', 'NV16', '0448486484');

--PHONG BAN
insert into PHONGBAN values('PB01','Phong To chuc - Hanh chinh','NV27','0941872433','trgkd.pb1@gmail.com');
insert into PHONGBAN values('PB02','Phong Ke toan - Tai chinh','NV31','0833814231','trgkt.pb02@gmail.com');
insert into PHONGBAN values('PB03','Phong Kinh doanh','NV35','0912748121','trgns.pb03@gmail.com');
insert into PHONGBAN values('PB04','Phong Ky thuat','NV39','0936412643','trgkt.pb04@gmail.com');

--KHO
insert into KHO values('K001', '55 Nguyen Chi Phuong, p.5, quan 5, TP.HCM', 'NV21', '0998877665');

--NHANVIEN
--Nhan vien cua hang CH01
insert into NHANVIEN values('NV01','Do Chi Cong', 'Nam', '0335696451', TO_DATE('15/10/2000','DD/MM/YYYY'),'Quan Go Vap','272709371',TO_DATE('08/12/2019','DD/MM/YYYY'),'NV01',1.5, 'CH01');
insert into NHANVIEN values('NV02','Nguyen Hoai Nam', 'Nam', '0973412987',TO_DATE('01/03/1994','DD/MM/YYYY'),'Quan 9','241672598',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV01',1, 'CH01');
insert into NHANVIEN values('NV03','Truong Tan Vinh', 'Nam', '0863141657',TO_DATE('12/07/1996','DD/MM/YYYY'),'Quan Tan Binh','341879213',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV01',1, 'CH01');
insert into NHANVIEN values('NV04','Nguyen Dai Nam', 'Nam', '0869784651',TO_DATE('23/03/1995','DD/MM/YYYY'),'Quan Binh Thanh','341917491',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV01',1, 'CH01');
insert into NHANVIEN values('NV05','Nguyen Nhu Quynh', 'Nu', '0967981274',TO_DATE('18/04/1995','DD/MM/YYYY'),'Quan Thu ?uc','251897467',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV01',1, 'CH01');

--Nhan vien cua hang CH02
insert into NHANVIEN values('NV06','Nguyen Van An', 'Nam', '0941872433',TO_DATE('30/04/1975','DD/MM/YYYY'),'Quan Thu ?uc','879123467',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV06', 1.5, 'CH02');
insert into NHANVIEN values('NV07','Tran Nguyen Thuy Tien', 'Nu', '0833814231',TO_DATE('26/06/1978','DD/MM/YYYY'),'Quan Tan Binh','192381415',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV06',1, 'CH02');
insert into NHANVIEN values('NV08','Tran Quang Phuc', 'Nam', '0987465312',TO_DATE('28/04/1980','DD/MM/YYYY'),'Quan Tan Binh','478128528',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV06',1, 'CH02');
insert into NHANVIEN values('NV09','Nguyen Thanh Tra', 'Nu', '0947182842',TO_DATE('31/05/1981','DD/MM/YYYY'),'Quan 3','371832741',TO_DATE('12/01/2018','DD/MM/YYYY'),'NV06', 1, 'CH02');
insert into NHANVIEN values('NV10','Nguyen Thao Nhi', 'Nu', '0987632164',TO_DATE('18/03/1998','DD/MM/YYYY'),'Quan Binh Thanh','412893758',TO_DATE('12/02/2018','DD/MM/YYYY'),'NV06',1, 'CH02');

--Nhan vien cua hang CH03
insert into NHANVIEN values('NV11','Nguyen Viet Phat', 'Nam', '0833786142',TO_DATE('21/09/1997','DD/MM/YYYY'),'Quan Binh Thanh','261478180',TO_DATE('19/02/2018','DD/MM/YYYY'),'NV11',1.5, 'CH03');
insert into NHANVIEN values('NV12','Nguyen Hong An', 'Nu', '0933140284',TO_DATE('18/03/2000','DD/MM/YYYY'),'Quan Binh Thanh','281972184',TO_DATE('12/02/2018','DD/MM/YYYY'),'NV11',1, 'CH03');
insert into NHANVIEN values('NV13','Nguyen Thi Viet Anh', 'Nu', '0979115345',TO_DATE('18/09/2000','DD/MM/YYYY'),'Quan Binh Thanh','412893758',TO_DATE('26/02/2018','DD/MM/YYYY'),'NV11',1, 'CH03');
insert into NHANVIEN values('NV14','Cao Thi Anh', 'Nu', '0986306331',TO_DATE('23/01/2002','DD/MM/YYYY'),'Quan Binh Thanh','412893758',TO_DATE('26/02/2020','DD/MM/YYYY'),'NV11',1, 'CH03');
insert into NHANVIEN values('NV15','Tran Hai Binh', 'Nam', '0918289858',TO_DATE('28/02/2001','DD/MM/YYYY'),'Quan Tan Binh','217841274',TO_DATE('26/02/2020','DD/MM/YYYY'),'NV11',1, 'CH03');

--Nhan vien cua hang CH04
insert into NHANVIEN values('NV16','Nguyen Duy Binh', 'Nam', '0933737485',TO_DATE('05/02/2001','DD/MM/YYYY'),'Quan Tan Binh','241789125',TO_DATE('12/02/2020','DD/MM/YYYY'),'NV16',1.5, 'CH04');
insert into NHANVIEN values('NV17','Nguyen Ngoc Hoang', 'Nam', '0982913919',TO_DATE('08/07/2000','DD/MM/YYYY'),'Quan Tan Binh','241981047',TO_DATE('12/02/2019','DD/MM/YYYY'),'NV16',1, 'CH04');
insert into NHANVIEN values('NV18','Nguyen Thi Cam Chau', 'Nu', '0909714623',TO_DATE('15/12/2000','DD/MM/YYYY'),'Quan Tan Binh','350192712',TO_DATE('19/02/2020','DD/MM/YYYY'),'NV16',1, 'CH04');
insert into NHANVIEN values('NV19','Le Thi Thao', 'Nu', '090836195',TO_DATE('16/10/2002','DD/MM/YYYY'),'Quan Tan Binh','981274012',TO_DATE('19/02/2018','DD/MM/YYYY'),'NV16',1, 'CH04');
insert into NHANVIEN values('NV20','Vo Hoang Do', 'Nam', '0903122556',TO_DATE('04/06/1999','DD/MM/YYYY'),'Quan Thu Duc','893147198',TO_DATE('12/02/2018','DD/MM/YYYY'),'NV16',1, 'CH04');

--Nhan vien kho K001
insert into NHANVIEN values('NV21','Phan Thanh Dong', 'Nam', '098311883',TO_DATE('08/01/2000','DD/MM/YYYY'),'Quan Thu Duc','518741876',TO_DATE('12/02/2018','DD/MM/YYYY'),'NV21',1.5, 'K001');
insert into NHANVIEN values('NV22','Le Van Giang', 'Nam', '0933484618',TO_DATE('24/10/2002','DD/MM/YYYY'),'Quan Thu Duc','361798126',TO_DATE('19/02/2019','DD/MM/YYYY'),'NV21',1, 'K001');
insert into NHANVIEN values('NV23','Nguyen Xuan Dong', 'Nam', '0918129188',TO_DATE('30/08/2000','DD/MM/YYYY'),'Quan Thu Duc','461862108',TO_DATE('19/02/2020','DD/MM/YYYY'),'NV21',1, 'K001');
insert into NHANVIEN values('NV24','Tran Thanh Hai', 'Nam', '0908356130',TO_DATE('23/04/1999','DD/MM/YYYY'),'Quan Thu Duc','981274012',TO_DATE('19/02/2020','DD/MM/YYYY'),'NV21',1, 'K001');
insert into NHANVIEN values('NV25','Vu Thi Hong Hanh', 'Nu', '0988805526',TO_DATE('17/06/1998','DD/MM/YYYY'),'Quan 1','141923617',TO_DATE('23/02/2019','DD/MM/YYYY'),'NV21',1, 'K001');
insert into NHANVIEN values('NV26','?Huynh Minh Huu', 'Nam', '0918740540',TO_DATE('25/06/1999','DD/MM/YYYY'),'Quan 1','671461846',TO_DATE('23/02/2019','DD/MM/YYYY'),'NV21',1, 'K001');

--Nhan vien phong to chuc hanh chinh
insert into NHANVIEN values('NV27','Pham Van Hien', 'Nam', '0908248238',TO_DATE('01/10/2000','DD/MM/YYYY'),'Quan 1','271847194',TO_DATE('23/02/2019','DD/MM/YYYY'),'NV27',2, 'PB01');
insert into NHANVIEN values('NV28','Tran Minh Kha', 'Nam', '0903112536',TO_DATE('16/05/1999','DD/MM/YYYY'),'Quan 1','174917375',TO_DATE('01/03/2019','DD/MM/YYYY'),'NV27',1.5, 'PB01');
insert into NHANVIEN values('NV29','Nguyen Minh Khoi', 'Nam', '0909151486',TO_DATE('23/04/1999','DD/MM/YYYY'),'Quan 1','658193723',TO_DATE('08/03/2020','DD/MM/YYYY'),'NV27',1.5, 'PB01');
insert into NHANVIEN values('NV30','Bui Van Khoa', 'Nam', '0919413401', TO_DATE('18/08/2000','DD/MM/YYYY'),'Quan Phu Nhuan','213481475',TO_DATE('08/04/2019','DD/MM/YYYY'),'NV27',1.5, 'PB01');

--Nhan vien phong ke toan tai chinh
insert into NHANVIEN values('NV31','Tran Thi Kim Lan', 'Nu', '090533240',TO_DATE('31/03/1998','DD/MM/YYYY'),'Quan Phu Nhuan','417264974',TO_DATE('08/04/2019','DD/MM/YYYY'),'NV31',2, 'PB02');
insert into NHANVIEN values('NV32','Vo Thanh Long', 'Nam', '0918806566', TO_DATE('12/01/1999','DD/MM/YYYY'),'Quan Phu Nhuan','217461923',TO_DATE('08/04/2019','DD/MM/YYYY'),'NV31',1.5, 'PB02');
insert into NHANVIEN values('NV33','Nguyen Hoang Mai', 'Nam', '0918201102',TO_DATE('09/08/1999','DD/MM/YYYY'),'Quan Phu Nhuan','247591833',TO_DATE('08/03/2020','DD/MM/YYYY'),'NV31',1.5, 'PB02');
insert into NHANVIEN values('NV34','Lam Gia Huy', 'Nam', '0332709365', TO_DATE('06/05/2000','DD/MM/YYYY'),'Quan 10','271801637',TO_DATE('15/01/2019','DD/MM/YYYY'),'NV31',1.5, 'PB02');

--Nhan vien phong Kinh doanh
insert into NHANVIEN values('NV35','Bui Thao Ly', 'Nu', '0912033625', TO_DATE('18/08/2000','DD/MM/YYYY'),'Quan 6','213471485',TO_DATE('05/03/2019','DD/MM/YYYY'),'NV35',2, 'PB03');
insert into NHANVIEN values('NV36','Ngo Gia Ky', 'Nam', '0919101202', TO_DATE('01/01/2000','DD/MM/YYYY'),'Quan 11','272901237',TO_DATE('18/04/2019','DD/MM/YYYY'),'NV35',1.5, 'PB03');
insert into NHANVIEN values('NV37','Le Van Thanh', 'Nam', '0333513501', TO_DATE('13/02/2000','DD/MM/YYYY'),'Quan 4','212883473',TO_DATE('28/03/2019','DD/MM/YYYY'),'NV35',1.5, 'PB03');
insert into NHANVIEN values('NV38','Hoang Thi Cam Van', 'Nu', '0917423521', TO_DATE('17/04/2000','DD/MM/YYYY'),'Quan Tan Binh','29120956',TO_DATE('13/07/2019','DD/MM/YYYY'),'NV35',1.5, 'PB03');

--Nhan vien phong ky thuat
insert into NHANVIEN values('NV39','Le Gia Bao', 'Nam', '0125713901', TO_DATE('23/12/2000','DD/MM/YYYY'),'Quan 5','27193259',TO_DATE('14/04/2019','DD/MM/YYYY'),'NV39',2, 'PB04');
insert into NHANVIEN values('NV40','Nguyen Cao Phat', 'Nam', '0915618482', TO_DATE('31/05/2000','DD/MM/YYYY'),'Quan Binh Thach','211246098',TO_DATE('24/10/2019','DD/MM/YYYY'),'NV39',1.5, 'PB04');
insert into NHANVIEN values('NV41','Nguyen Bao Han', 'Nu', '0336768905', TO_DATE('22/09/2000','DD/MM/YYYY'),'Quan 8','272078012',TO_DATE('24/07/2019','DD/MM/YYYY'),'NV39',1.5, 'PB04');
insert into NHANVIEN values('NV42','Ly Kim Duyen', 'Nu', '0346319580', TO_DATE('18/08/2000','DD/MM/YYYY'),'Quan Phu Nhuan','273612047',TO_DATE('20/02/2019','DD/MM/YYYY'),'NV39',1.5, 'PB04');

--KHACHHANG
INSERT INTO KHACHHANG VALUES('KH01','Nguyen Thuy Anh', 'Nu', '0903456824',TO_DATE('07/04/1997','DD/MM/YYYY'),'45/2 An Duong Vuong, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH02','Tran Thao Anh', 'Nu', '0987023412',TO_DATE('11/11/1990','DD/MM/YYYY'),'45 Nguyen Canh Chan, Q1, TpHCM');
INSERT INTO KHACHHANG VALUES('KH03','Mai Thuy An', 'Nu', '0982527982',TO_DATE('09/03/1986','DD/MM/YYYY'),'731 Tran Hung Dao, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH04','Nguyen Hong Anh', 'Nu', '0973776072',TO_DATE('20/10/1975','DD/MM/YYYY'),'23/5 Nguyen Trai, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH05','Le Van Bach', 'Nam', '0917749254',TO_DATE('01/05/1996','DD/MM/YYYY'),'50/34 Le Dai Hanh, Q10, TpHCM');
INSERT INTO KHACHHANG VALUES('KH06','Nguyen Hoang Bao', 'Nam', '0986306331',TO_DATE('15/01/1985','DD/MM/YYYY'),'34/34B Nguyen Trai, Q1, TpHCM');
INSERT INTO KHACHHANG VALUES('KH07','Tran Xuan Bao', 'Nam', '0979115345',TO_DATE('09/06/1988','DD/MM/YYYY'),'873 Le Hong Phong, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH08','Nguyen Viet Chinh ', 'Nam', '0933140284',TO_DATE('01/04/1973','DD/MM/YYYY'),'32/3 Tran Binh Trong, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH09','Tran Cong Chien', 'Nam', '0914162689',TO_DATE('27/12/1989','DD/MM/YYYY'),'34 Truong Dinh, Q3, TpHCM');
INSERT INTO KHACHHANG VALUES('KH10','Dao Van Cuong', 'Nam', '0982725726',TO_DATE('19/08/1997','DD/MM/YYYY'),'227 Nguyen Van Cu, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH11','Vu Hoa Cuc', 'Nu', '0974131489',TO_DATE('08/04/1973','DD/MM/YYYY'),'10 Kenh Nuoc Den, Q.BT, TpHCM');
INSERT INTO KHACHHANG VALUES('KH12','Bui Nguyen Thi Dao', 'Nu', '0984084034',TO_DATE('12/11/1963','DD/MM/YYYY'),'120 Le Anh Xuan, Q.TP, TpHCM');
INSERT INTO KHACHHANG VALUES('KH13','Luong Van Duc', 'Nam', '0936053286',TO_DATE('24/05/2000','DD/MM/YYYY'),'20 Bau Cat, Q.TB, TpHCM');
INSERT INTO KHACHHANG VALUES('KH14','Hoang Nam Dung', 'Nam', '0986958908',TO_DATE('02/11/1964','DD/MM/YYYY'),'78 CMT8, Q.TB, TpHCM');
INSERT INTO KHACHHANG VALUES('KH15','Le Hoai Giang', 'Nam', '0904054732',TO_DATE('07/01/2001','DD/MM/YYYY'),'10 Bach Dang, Q.PN, TpHCM');
INSERT INTO KHACHHANG VALUES('KH16','Dao Ba Loc', 'Nam', '0983043195',TO_DATE('27/11/1994','DD/MM/YYYY'),'5 Truong Tho, Q.Thu Duc, TpHCM');
INSERT INTO KHACHHANG VALUES('KH17','Hoai Phuong', 'Nu', '0912992158',TO_DATE('12/03/1999','DD/MM/YYYY'),'53 Le Thi Hoa, Q.Thu Duc, TpHCM');
INSERT INTO KHACHHANG VALUES('KH18','Tran Ngoc Minh', 'Nam', '0975808375',TO_DATE('09/05/1998','DD/MM/YYYY'),'38/7A Nguyen Kiem, Q.PN, TpHCM');
INSERT INTO KHACHHANG VALUES('KH19','Do Van Ut', 'Nu', '0976054844',TO_DATE('30/01/1970','DD/MM/YYYY'),'106/3/5 Ban Co, Q3, TpHCM');
INSERT INTO KHACHHANG VALUES('KH20','Vo Hoang Yen', 'Nu', '0974808483',TO_DATE('18/10/2001','DD/MM/YYYY'),'84/20 Tran Phu, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH21','Dao Tien Manh', 'Nam', '0936053286',TO_DATE('11/06/1982','DD/MM/YYYY'),'96 Ly Tu Trong , Quan 1');
INSERT INTO KHACHHANG VALUES('KH22','Pham Thi Ngoc', 'Nu', '0974131489',TO_DATE('01/12/1985','DD/MM/YYYY'),'115 Bui Vien, Quan 1, TpHCM');
INSERT INTO KHACHHANG VALUES('KH23','Nguyen Thi Hong Nhung', 'Nu', '0169820395',TO_DATE('23/10/1976','DD/MM/YYYY'),'28 Huynh Thuc Khang , Quan 1, TpHCM');
INSERT INTO KHACHHANG VALUES('KH24','Phung Manh Ninh', 'Nam', '0905516826',TO_DATE('06/01/1976','DD/MM/YYYY'),'35 Ton Duc Thang, Quan 1, TpHCM');
INSERT INTO KHACHHANG VALUES('KH25','Do Thi Quyen', 'Nu', '0979006323',TO_DATE('09/07/1986','DD/MM/YYYY'),'255 Tran Hung Dao , Quan 1, TpHCM');
INSERT INTO KHACHHANG VALUES('KH26','Hoang Le Quyen', 'Nu', '0978140196',TO_DATE('28/11/1987','DD/MM/YYYY'),'48 Nguyen Huu Cau , Quan 1, TpHCM');
INSERT INTO KHACHHANG VALUES('KH27','Dang Vinh Tan', 'Nam', '0989352144',TO_DATE('28/04/2000','DD/MM/YYYY'),'Hem 195 Le Van Sy, Q3, TpHCM');
INSERT INTO KHACHHANG VALUES('KH28','Do Thi Thuy', 'Nu', '0986561497',TO_DATE('14/11/1988','DD/MM/YYYY'),'Hem 91 Nguyen Khoai, Q4, TpHCM');
INSERT INTO KHACHHANG VALUES('KH29','Vu Thi Thuan', 'Nam', '0975296509',TO_DATE('03/09/1999','DD/MM/YYYY'),'455 Nguyen ?inh Chieu, Q3, TpHCM');
INSERT INTO KHACHHANG VALUES('KH30','Do Thi Tiep', 'Nu', '0168697917',TO_DATE('26/06/1981','DD/MM/YYYY'),' 377 Vo Van Tan, Q3, TpHCM');
INSERT INTO KHACHHANG VALUES('KH31','Ta Thi Thanh Tu', 'Nu', '0904690835',TO_DATE('19/10/1985','DD/MM/YYYY'),'51 Nguyen Chi Thanh, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH32','Nguyen Thi Trang', 'Nu', '0979650651',TO_DATE('20/12/1987','DD/MM/YYYY'),'296 Tran Phu, Q5, TpHCM');
INSERT INTO KHACHHANG VALUES('KH33','Pham Hoang Ngoc Yen', 'Nu', '0973776072',TO_DATE('01/04/1980','DD/MM/YYYY'),'45/23 Cao Lo, Q8, TpHCM');
INSERT INTO KHACHHANG VALUES('KH34','Vu Tien Lap', 'Nam', '0917749254',TO_DATE('15/01/1982','DD/MM/YYYY'),'458 Ly Thai To, Q10, TpHCM');
INSERT INTO KHACHHANG VALUES('KH35','Nguyen Van Tham', 'Nam', '0904770053',TO_DATE('27/06/1993','DD/MM/YYYY'),'550 Le Hong Phong, Q10, TpHCM');
INSERT INTO KHACHHANG VALUES('KH36','Nguyen Dang Hoang', 'Nam', '0974880788',TO_DATE('07/07/1987','DD/MM/YYYY'),'594 Ly Thai To, Q10, TpHCM');
INSERT INTO KHACHHANG VALUES('KH37','Tran Trung Kien', 'Nam', '0983888611',TO_DATE('10/06/1982','DD/MM/YYYY'),'557/63 Huong lo 3 , QBT, TpHCM');
INSERT INTO KHACHHANG VALUES('KH38','Tran Thanh Tung', 'Nam', '0984603663',TO_DATE('12/01/1990','DD/MM/YYYY'),'72 duong so 10, QBT, TpHCM');
INSERT INTO KHACHHANG VALUES('KH39','Nguyen Thi Thu Hang', 'Nu', '0986375176',TO_DATE('07/06/1984','DD/MM/YYYY'),'47/24/3 Bui Dinh Tuy, Q.BThanh, TpHCM');
INSERT INTO KHACHHANG VALUES('KH40','Vu Hai Thuong', 'Nam', '0914770545',TO_DATE('03/12/1992','DD/MM/YYYY'),'285 Dinh Bo Linh, QBThanh, TpHCM');

--SANPHAM
insert into SANPHAM values('XD01','Xe dap duong pho Touring GIANT Escape 3','chiec','Dai Loan',5000000, 0);
insert into SANPHAM values('XD02','Xe dap duong pho Touring TRINX Free 2.0','chiec','Trung Quoc',5650000, 0);
insert into SANPHAM values('XD03','Xe dap dia hinh MTB GIANT Talon 4','chiec','Dai Loan',8000000, 0);
insert into SANPHAM values('XD04','Xe dap tre em Youth TRINX Junior 1.0','chiec','Trung Quoc',3590000, 0);
insert into SANPHAM values('XD05','Xe dap dua Road GIANT Contend 3','chiec','Dai Loan',17390000, 0);
insert into SANPHAM values('XD06','Xe dap dua Road GIANT TCR Advanced Pro 1','chiec','Dai Loan',20590000, 0);
insert into SANPHAM values('XD07','Xe dap gap Folding TRINX Life Flybird 1.0','chiec','Viet Nam',5990000, 0);
insert into SANPHAM values('XD08','Xe dap gap Folding GIANT FD-806','chiec','Viet Nam',8000000, 0);
insert into SANPHAM values('XD09','Xe dap tre em Youth VINBIKE Robo 16','chiec','Thai Lan',1990000, 0);
insert into SANPHAM values('XD10','Xe dap tre em STITCH JK 912','chiec','Singapore',17390000, 0);
insert into SANPHAM values('XD11','Xe dap mini MARUISHI WEA 2633','chiec','Nhat Ban',2580000, 0);
insert into SANPHAM values('XD12','Xe dap duong pho Touring MOMENTUM iNeed Street','chiec','Viet Nam',4300000, 0);
insert into SANPHAM values('XD13','Xe dap gap GIANT FD-806','chiec','Viet Nam',7000000, 0);
insert into SANPHAM values('XD14','Xe dap tre em Youth VINBIKE 16','chiec','Thai Lan',1990000, 0);
insert into SANPHAM values('XD15','Xe dap mini JK 912','chiec','Singapore',1739000, 0);
insert into SANPHAM values('XD16','Xe dap mini MARUISHI 2644','chiec','Nhat Ban',2585000, 0);
insert into SANPHAM values('XD17','Xe dap duong pho MOMENTUM Street','chiec','Viet Nam',4350000, 0);

insert into SANPHAM values('BH01','Non bao hiem ROYAL JC16 Helmet','cai','Viet Nam',390000, 0);
insert into SANPHAM values('BH02','Non bao hiem GIANT Rev Comp Mips','cai','Viet Nam',509000, 0);
insert into SANPHAM values('BH03','Non bao hiem GIANT Touring 2.0','cai','Viet Nam',250000, 0);

insert into SANPHAM values('GT01','Gang tay LIV Signature Short Finger Gloves','doi','Viet Nam',150000, 0);
insert into SANPHAM values('GT02','Gang tay GIANT Rival Short Finger Gloves','doi','Thai Lan',285000, 0);
insert into SANPHAM values('GT03','Gang tay LIV Zorya Long Finger Gloves','doi','Han Quoc',335000, 0);

insert into SANPHAM values('MK01','Mat kinh Sunglasses Apus-Kolor CAT.2','cap','Han2 Quoc',5650000, 0);
insert into SANPHAM values('MK02','Mat kinh Stratos Lite ? Kolor Up','cap','Dai Loan',150000, 0);

insert into SANPHAM values('BO01','Ong bom Floor Pump Control Tower 1','chiec','Trung Quoc',99000, 0);

insert into SANPHAM values('DE01','Den Pin CR2032 GIANT Numen Mini Light','chiec','Thai Lan',50000, 0);
insert into SANPHAM values('DE02','Den Pin Mobling Head Light','chiec','Viet Nam',105000, 0);
insert into SANPHAM values('DE03','Den truoc xe dap Explorer 350 Head Light','chiec','Dai Loan',75000, 0);
insert into SANPHAM values('DE04','Den truoc xe dap Nova Head Light','chiec','Trung Quoc',80000, 0);
insert into SANPHAM values('DE05','Den phanh xe dap Expander Head Light','chiec','Viet Nam',500000, 0);
insert into SANPHAM values('DE06','Den hau xe dap Cama Back 850 Head Light','chiec','Dai Loan',200000, 0);
insert into SANPHAM values('DE07','Den hau xe dap Kanva Back Light','chiec','Dai Loan',75000, 0);

insert into SANPHAM values('SE01','Sen xe dap dia hinh', 'bo', 'Viet Nam',300000, 0);
insert into SANPHAM values('SE02','Sen xe dap duong pho', 'bo', 'Viet Nam',250000, 0);
insert into SANPHAM values('SE03','Sen xe dap tre em', 'bo', 'Viet Nam',250000, 0);

insert into SANPHAM values('BR01','Gom thang dia Sport Disc Pad','cap','Malaysia',219000, 0);
insert into SANPHAM values('BR02','Gom thang cao su Rim Brake Pads','cap','Thai Lan',50000, 0);

insert into SANPHAM values('RU01','Ruot xe dap 700×35-45 SV 35mm','chiec','Singapore',159000, 0);
insert into SANPHAM values('RU02','Ruot xe dap 26×1.90/2.125 PV','chiec','Viet Nam',235000, 0);
insert into SANPHAM values('RU03','Ruot xe dap 700×32/47C 42mm CONTINENTAL','chiec','Viet Nam',159000, 0);
insert into SANPHAM values('RU04','Vo xe dap khong ruot GIANT Gavia AC 1','chiec','Thai Lan',300000, 0);
insert into SANPHAM values('RU05','Vo xe dap ruot GIANT AC 1','chiec','Viet Nam',350000, 0);

--CTTON
insert into CTTON values('XD01','CH01', 20, 'K001', 15);
insert into CTTON values('XD01','CH02', 15, 'K001', 15);
insert into CTTON values('XD01','CH03', 10, 'K001', 15);
insert into CTTON values('XD01','CH04', 25, 'K001', 15);

insert into CTTON values('XD02','CH01', 0, 'K001', 10);
insert into CTTON values('XD02','CH02', 5, 'K001', 10);
insert into CTTON values('XD02','CH03', 15, 'K001', 10);
insert into CTTON values('XD02','CH04', 20, 'K001', 10);

insert into CTTON values('XD03','CH01', 15,'K001', 7);
insert into CTTON values('XD03','CH02', 6,'K001', 7);
insert into CTTON values('XD03','CH03', 14,'K001', 7);
insert into CTTON values('XD03','CH04', 0, 'K001', 7);

insert into CTTON values('XD04','CH01', 1,'K001', 10);
insert into CTTON values('XD04','CH02', 18,'K001', 10);
insert into CTTON values('XD04','CH03', 11,'K001', 10);
insert into CTTON values('XD04','CH04', 9,'K001', 10);

insert into CTTON values('XD05','CH01', 2,'K001', 12);
insert into CTTON values('XD05','CH02', 5,'K001', 12);
insert into CTTON values('XD05','CH03', 17,'K001', 12);
insert into CTTON values('XD05','CH04', 13,'K001', 12);

insert into CTTON values('XD06','CH01', 22,'K001', 8);
insert into CTTON values('XD06','CH02', 0,'K001', 8);
insert into CTTON values('XD06','CH03', 14,'K001', 8);
insert into CTTON values('XD06','CH04', 0,'K001', 8);

insert into CTTON values('XD07','CH01', 16,'K001', 20);
insert into CTTON values('XD07','CH02', 20,'K001', 20);
insert into CTTON values('XD07','CH03', 10,'K001', 20);
insert into CTTON values('XD07','CH04', 17,'K001', 20);

insert into CTTON values('XD08','CH01', 0,'K001', 0);
insert into CTTON values('XD08','CH02', 21,'K001', 0);
insert into CTTON values('XD08','CH03', 2,'K001', 0);
insert into CTTON values('XD08','CH04', 6,'K001', 0);

insert into CTTON values('XD09','CH01', 7,'K001', 0);
insert into CTTON values('XD09','CH02', 3,'K001', 0);
insert into CTTON values('XD09','CH03', 0,'K001', 0);
insert into CTTON values('XD09','CH04', 0,'K001', 0);

insert into CTTON values('XD10','CH01', 10,'K001', 0);
insert into CTTON values('XD10','CH02', 12,'K001', 0);
insert into CTTON values('XD10','CH03', 20,'K001', 0);
insert into CTTON values('XD10','CH04', 19,'K001', 0);

insert into CTTON values('XD11','CH01', 26,'K001', 15);
insert into CTTON values('XD11','CH02', 0,'K001', 15);
insert into CTTON values('XD11','CH03', 9,'K001', 15);
insert into CTTON values('XD11','CH04', 5,'K001', 15);

insert into CTTON values('XD12','CH01', 15,'K001', 15);
insert into CTTON values('XD12','CH02', 25,'K001', 15);
insert into CTTON values('XD12','CH03', 27,'K001', 15);
insert into CTTON values('XD12','CH04', 5,'K001', 15);

insert into CTTON values('XD13','CH01', 0,'K001', 25);
insert into CTTON values('XD13','CH02', 3,'K001', 25);
insert into CTTON values('XD13','CH03', 14,'K001', 25);
insert into CTTON values('XD13','CH04', 15,'K001', 25);

insert into CTTON values('XD14','CH01', 6,'K001', 0);
insert into CTTON values('XD14','CH02', 0,'K001', 0);
insert into CTTON values('XD14','CH03', 0,'K001', 0);
insert into CTTON values('XD14','CH04', 15,'K001', 0);

insert into CTTON values('XD15','CH01', 4,'K001', 10);
insert into CTTON values('XD15','CH02', 5,'K001', 10);
insert into CTTON values('XD15','CH03', 19,'K001', 10);
insert into CTTON values('XD15','CH04', 23,'K001', 10);

insert into CTTON values('XD16','CH01', 17,'K001', 5);
insert into CTTON values('XD16','CH02', 19,'K001', 5);
insert into CTTON values('XD16','CH03', 8,'K001', 5);
insert into CTTON values('XD16','CH04', 21,'K001', 5);

insert into CTTON values('XD17','CH01', 3,'K001', 2);
insert into CTTON values('XD17','CH02', 6,'K001', 2);
insert into CTTON values('XD17','CH03', 0,'K001', 2);
insert into CTTON values('XD17','CH04', 0,'K001', 2);

insert into CTTON values('BH01','CH01', 40,'K001', 25);
insert into CTTON values('BH01','CH02', 35,'K001', 25);
insert into CTTON values('BH01','CH03', 24,'K001', 25);
insert into CTTON values('BH01','CH04', 36,'K001', 25);

insert into CTTON values('BH02','CH01', 33,'K001', 15);
insert into CTTON values('BH02','CH02', 28,'K001', 15);
insert into CTTON values('BH02','CH03', 20,'K001', 15);
insert into CTTON values('BH02','CH04', 30,'K001', 15);

insert into CTTON values('BH03','CH01', 28,'K001', 34);
insert into CTTON values('BH03','CH02', 39,'K001', 34);
insert into CTTON values('BH03','CH03', 10,'K001', 34);
insert into CTTON values('BH03','CH04', 25,'K001', 34);

insert into CTTON values('GT01','CH01', 30,'K001', 30);
insert into CTTON values('GT01','CH02', 35,'K001', 30);
insert into CTTON values('GT01','CH03', 40,'K001', 30);
insert into CTTON values('GT01','CH04', 36,'K001', 30);

insert into CTTON values('GT02','CH01', 20,'K001', 36);
insert into CTTON values('GT02','CH02', 45,'K001', 36);
insert into CTTON values('GT02','CH03', 30,'K001', 36);
insert into CTTON values('GT02','CH04', 37,'K001', 36);

insert into CTTON values('GT03','CH01', 25,'K001', 30);
insert into CTTON values('GT03','CH02', 45,'K001', 30);
insert into CTTON values('GT03','CH03', 35,'K001', 30);
insert into CTTON values('GT03','CH04', 40,'K001', 30);

insert into CTTON values('MK01','CH01', 20,'K001', 40);
insert into CTTON values('MK01','CH02', 15,'K001', 40);
insert into CTTON values('MK01','CH03', 35,'K001', 40);
insert into CTTON values('MK01','CH04', 38,'K001', 40);

insert into CTTON values('MK02','CH01', 26,'K001', 45);
insert into CTTON values('MK02','CH02', 45,'K001', 45);
insert into CTTON values('MK02','CH03', 32,'K001', 45);
insert into CTTON values('MK02','CH04', 25,'K001', 45);

insert into CTTON values('BO01','CH01', 16,'K001', 30);
insert into CTTON values('BO01','CH02', 15,'K001', 30);
insert into CTTON values('BO01','CH03', 22,'K001', 30);
insert into CTTON values('BO01','CH04', 15,'K001', 30);

insert into CTTON values('DE01','CH01', 16,'K001', 30);
insert into CTTON values('DE01','CH02', 15,'K001', 30);
insert into CTTON values('DE01','CH03', 22,'K001', 30);
insert into CTTON values('DE01','CH04', 15,'K001', 30);

insert into CTTON values('DE02','CH01', 10,'K001', 15);
insert into CTTON values('DE02','CH02', 10,'K001', 15);
insert into CTTON values('DE02','CH03', 25,'K001', 15);
insert into CTTON values('DE02','CH04', 0,'K001', 15);

insert into CTTON values('DE03','CH01', 20,'K001', 34);
insert into CTTON values('DE03','CH02', 23,'K001', 34);
insert into CTTON values('DE03','CH03', 27,'K001', 34);
insert into CTTON values('DE03','CH04', 14,'K001', 34);

insert into CTTON values('DE04','CH01', 16,'K001', 5);
insert into CTTON values('DE04','CH02', 15,'K001', 5);
insert into CTTON values('DE04','CH03', 20,'K001', 5);
insert into CTTON values('DE04','CH04', 5,'K001', 5);

insert into CTTON values('DE05','CH01', 6,'K001', 25);
insert into CTTON values('DE05','CH02', 9,'K001', 25);
insert into CTTON values('DE05','CH03', 11,'K001', 25);
insert into CTTON values('DE05','CH04', 0,'K001', 25);

insert into CTTON values('DE06','CH01', 20,'K001', 21);
insert into CTTON values('DE06','CH02', 30,'K001', 21);
insert into CTTON values('DE06','CH03', 35,'K001', 21);
insert into CTTON values('DE06','CH04', 4,'K001', 21);

insert into CTTON values('DE07','CH01', 6,'K001', 0);
insert into CTTON values('DE07','CH02', 9,'K001', 0);
insert into CTTON values('DE07','CH03', 0,'K001', 0);
insert into CTTON values('DE07','CH04', 0,'K001', 0);

insert into CTTON values('SE01','CH01', 45,'K001', 30);
insert into CTTON values('SE01','CH02', 35,'K001', 30);
insert into CTTON values('SE01','CH03', 50,'K001', 30);
insert into CTTON values('SE01','CH04', 25,'K001', 30);

insert into CTTON values('SE02','CH01', 35,'K001', 30);
insert into CTTON values('SE02','CH02', 40,'K001', 30);
insert into CTTON values('SE02','CH03', 30,'K001', 30);
insert into CTTON values('SE02','CH04', 45,'K001', 30);

insert into CTTON values('SE03','CH01', 15,'K001', 30);
insert into CTTON values('SE03','CH02', 20,'K001', 30);
insert into CTTON values('SE03','CH03', 20,'K001', 30);
insert into CTTON values('SE03','CH04', 35,'K001', 30);

insert into CTTON values('BR01','CH01', 55,'K001', 45);
insert into CTTON values('BR01','CH02', 50,'K001', 45);
insert into CTTON values('BR01','CH03', 65,'K001', 45);
insert into CTTON values('BR01','CH04', 54,'K001', 45);

insert into CTTON values('BR02','CH01', 45,'K001', 45);
insert into CTTON values('BR02','CH02', 60,'K001', 45);
insert into CTTON values('BR02','CH03', 55,'K001', 45);
insert into CTTON values('BR02','CH04', 56,'K001', 45);

insert into CTTON values('RU01','CH01', 60,'K001', 45);
insert into CTTON values('RU01','CH02', 30,'K001', 45);
insert into CTTON values('RU01','CH03', 55,'K001', 45);
insert into CTTON values('RU01','CH04', 46,'K001', 45);

insert into CTTON values('RU02','CH01', 55,'K001', 55);
insert into CTTON values('RU02','CH02', 40,'K001', 55);
insert into CTTON values('RU02','CH03', 50,'K001', 55);
insert into CTTON values('RU02','CH04', 48,'K001', 55);

insert into CTTON values('RU03','CH01', 35,'K001', 0);
insert into CTTON values('RU03','CH02', 40,'K001', 0);
insert into CTTON values('RU03','CH03', 45,'K001', 0);
insert into CTTON values('RU03','CH04', 36,'K001', 0);

insert into CTTON values('RU04','CH01', 25,'K001', 37);
insert into CTTON values('RU04','CH02', 30,'K001', 37);
insert into CTTON values('RU04','CH03', 15,'K001', 37);
insert into CTTON values('RU04','CH04', 40,'K001', 37);

insert into CTTON values('RU05','CH01', 15,'K001', 20);
insert into CTTON values('RU05','CH02', 23,'K001', 20);
insert into CTTON values('RU05','CH03', 10,'K001', 20);
insert into CTTON values('RU05','CH04', 35,'K001', 20);

--HOADON
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD01',TO_DATE('07/04/2022','DD/MM/YYYY'),'KH01','NV02',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD02',TO_DATE('10/05/2022','DD/MM/YYYY'),'KH02','NV07',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD03',TO_DATE('12/03/2022','DD/MM/YYYY'),'KH01','NV03',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD04',TO_DATE('25/12/2021','DD/MM/YYYY'),'KH03','NV04',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD05',TO_DATE('08/09/2021','DD/MM/YYYY'),'KH04','NV02',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD06',TO_DATE('05/01/2021','DD/MM/YYYY'),'KH05','NV11',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD07',TO_DATE('15/02/2022','DD/MM/YYYY'),'KH06','NV07',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD08',TO_DATE('09/02/2022','DD/MM/YYYY'),'KH08','NV15',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD09',TO_DATE('30/05/2022','DD/MM/YYYY'),'KH09','NV17',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD10',TO_DATE('02/01/2022','DD/MM/YYYY'),'KH10','NV18',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD11',TO_DATE('13/12/2021','DD/MM/YYYY'),'KH11','NV20',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD12',TO_DATE('12/11/2021','DD/MM/YYYY'),'KH12','NV01',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD13',TO_DATE('23/01/2022','DD/MM/YYYY'),'KH13','NV13',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD14',TO_DATE('05/01/2022','DD/MM/YYYY'),'KH05','NV17',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD15',TO_DATE('08/03/2022','DD/MM/YYYY'),'KH07','NV08',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD16',TO_DATE('01/01/2022','DD/MM/YYYY'),'KH14','NV02',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD17',TO_DATE('02/01/2022','DD/MM/YYYY'),'KH15','NV02',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD18',TO_DATE('03/01/2022','DD/MM/YYYY'),'KH16','NV02',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD19',TO_DATE('04/01/2022','DD/MM/YYYY'),'KH17','NV02',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD20',TO_DATE('05/01/2022','DD/MM/YYYY'),'KH18','NV02',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD21',TO_DATE('01/02/2022','DD/MM/YYYY'),'KH19','NV03',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD22',TO_DATE('02/02/2022','DD/MM/YYYY'),'KH20','NV03',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD23',TO_DATE('03/02/2022','DD/MM/YYYY'),'KH21','NV03',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD24',TO_DATE('04/02/2022','DD/MM/YYYY'),'KH22','NV04',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD25',TO_DATE('05/02/2022','DD/MM/YYYY'),'KH23','NV04',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD26',TO_DATE('01/03/2022','DD/MM/YYYY'),'KH24','NV05',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD27',TO_DATE('02/03/2022','DD/MM/YYYY'),'KH25','NV05',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD28',TO_DATE('03/03/2022','DD/MM/YYYY'),'KH25','NV07',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD29',TO_DATE('04/04/2022','DD/MM/YYYY'),'KH26','NV07',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD30',TO_DATE('05/04/2022','DD/MM/YYYY'),'KH26','NV08',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD31',TO_DATE('14/04/2022','DD/MM/YYYY'),'KH28','NV11',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD32',TO_DATE('15/04/2022','DD/MM/YYYY'),'KH27','NV15',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD33',TO_DATE('15/04/2022','DD/MM/YYYY'),'KH31','NV14',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD34',TO_DATE('17/04/2022','DD/MM/YYYY'),'KH27','NV13',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD35',TO_DATE('17/04/2022','DD/MM/YYYY'),'KH30','NV15',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD36',TO_DATE('17/04/2022','DD/MM/YYYY'),'KH32','NV15',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD37',TO_DATE('18/04/2022','DD/MM/YYYY'),'KH29','NV12',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD38',TO_DATE('19/04/2022','DD/MM/YYYY'),'KH33','NV12',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD39',TO_DATE('19/04/2022','DD/MM/YYYY'),'KH34','NV11',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD40',TO_DATE('20/04/2022','DD/MM/YYYY'),'KH36','NV16',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD41',TO_DATE('21/04/2022','DD/MM/YYYY'),'KH35','NV18',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD42',TO_DATE('23/04/2022','DD/MM/YYYY'),'KH30','NV15',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD43',TO_DATE('23/04/2022','DD/MM/YYYY'),'KH37','NV15',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD44',TO_DATE('25/04/2022','DD/MM/YYYY'),'KH38','NV11',0);
INSERT INTO HOADON (MAHD,NGHD, MAKH, MANV, TRIGIA) VALUES('HD45',TO_DATE('23/04/2022','DD/MM/YYYY'),'KH39','NV18',0);

--CTHD
INSERT INTO CTHD VALUES('HD01','XD02',1);
INSERT INTO CTHD VALUES('HD02','XD11',1);
INSERT INTO CTHD VALUES('HD03','XD10',1);
INSERT INTO CTHD VALUES('HD04','XD16',1);
INSERT INTO CTHD VALUES('HD05','BH01',1);
INSERT INTO CTHD VALUES('HD06','XD17',1);
INSERT INTO CTHD VALUES('HD07','XD14',1);
INSERT INTO CTHD VALUES('HD08','XD04',1);
INSERT INTO CTHD VALUES('HD09','XD05',1);
INSERT INTO CTHD VALUES('HD10','XD11',1);
INSERT INTO CTHD VALUES('HD11','XD13',1);
INSERT INTO CTHD VALUES('HD12','XD09',1);
INSERT INTO CTHD VALUES('HD13','XD05',1);
INSERT INTO CTHD VALUES('HD14','XD04',1);
INSERT INTO CTHD VALUES('HD15','XD08',1);
INSERT INTO CTHD VALUES('HD05','BH03',1);
INSERT INTO CTHD VALUES('HD06','GT01',2);
INSERT INTO CTHD VALUES('HD03','MK01',1);
INSERT INTO CTHD VALUES('HD12','DE01',3);
INSERT INTO CTHD VALUES('HD11','MK02',1);
INSERT INTO CTHD VALUES('HD08','SE02',4);
INSERT INTO CTHD VALUES('HD09','SE03',2);
INSERT INTO CTHD VALUES('HD04','BR02',2);
INSERT INTO CTHD VALUES('HD06','RU02',4);
INSERT INTO CTHD VALUES('HD02','BO01',1);
INSERT INTO CTHD VALUES('HD03','GT02',1);
INSERT INTO CTHD VALUES('HD14','GT03',2);
INSERT INTO CTHD VALUES('HD15','BH01',2);
INSERT INTO CTHD VALUES('HD10','BH02',1);
INSERT INTO CTHD VALUES('HD04','GT02',2);
INSERT INTO CTHD VALUES('HD16','XD01',1);
INSERT INTO CTHD VALUES('HD16','XD03',1);
INSERT INTO CTHD VALUES('HD16','GT01',2);

INSERT INTO CTHD VALUES('HD17','XD05',1);
INSERT INTO CTHD VALUES('HD17','GT02',1);
INSERT INTO CTHD VALUES('HD17','XD03',1);
INSERT INTO CTHD VALUES('HD17','MK02',1);

INSERT INTO CTHD VALUES('HD18','DE01',1);
INSERT INTO CTHD VALUES('HD18','SE01',2);
INSERT INTO CTHD VALUES('HD18','RU01',2);

INSERT INTO CTHD VALUES('HD19','XD07',1);

INSERT INTO CTHD VALUES('HD20','XD09',3);

INSERT INTO CTHD VALUES('HD21','XD05',2);
INSERT INTO CTHD VALUES('HD21','XD10',2);

INSERT INTO CTHD VALUES('HD22','XD16',1);
INSERT INTO CTHD VALUES('HD22','XD17',1);
INSERT INTO CTHD VALUES('HD22','DE01',1);
INSERT INTO CTHD VALUES('HD22','DE02',2);

INSERT INTO CTHD VALUES('HD23','XD03',4);
INSERT INTO CTHD VALUES('HD23','XD04',2);

INSERT INTO CTHD VALUES('HD24','XD05',1);

INSERT INTO CTHD VALUES('HD25','XD06',1);
INSERT INTO CTHD VALUES('HD25','BH03',3);

INSERT INTO CTHD VALUES('HD26','XD07',2);
INSERT INTO CTHD VALUES('HD26','BH02',2);

INSERT INTO CTHD VALUES('HD27','XD01',1);
INSERT INTO CTHD VALUES('HD27','XD08',2);
INSERT INTO CTHD VALUES('HD27','GT01',1);
INSERT INTO CTHD VALUES('HD27','GT02',1);
INSERT INTO CTHD VALUES('HD27','MK01',1);

INSERT INTO CTHD VALUES('HD28','XD09',1);
INSERT INTO CTHD VALUES('HD28','XD10',1);
INSERT INTO CTHD VALUES('HD28','XD11',1);
INSERT INTO CTHD VALUES('HD28','XD12',1);

INSERT INTO CTHD VALUES('HD29','XD13',1);
INSERT INTO CTHD VALUES('HD29','XD14',4);
INSERT INTO CTHD VALUES('HD29','DE07',4);
INSERT INTO CTHD VALUES('HD29','DE05',5);


INSERT INTO CTHD VALUES('HD30','XD15',1);
INSERT INTO CTHD VALUES('HD30','XD16',2);
INSERT INTO CTHD VALUES('HD30','XD17',2);
INSERT INTO CTHD VALUES('HD31','XD17',1);
INSERT INTO CTHD VALUES('HD31','BH03',1);
INSERT INTO CTHD VALUES('HD31','GT03',1);
INSERT INTO CTHD VALUES('HD31','MK01',1);

INSERT INTO CTHD VALUES('HD32','BO01',1);

INSERT INTO CTHD VALUES('HD33','DE01',1);
INSERT INTO CTHD VALUES('HD33','MK02',1);

INSERT INTO CTHD VALUES('HD34','BR01',2);
INSERT INTO CTHD VALUES('HD34','RU03',4);

INSERT INTO CTHD VALUES('HD35','DE01',1);
INSERT INTO CTHD VALUES('HD35','DE07',1);

INSERT INTO CTHD VALUES('HD36','XD02',2);
INSERT INTO CTHD VALUES('HD36','BH01',2);
INSERT INTO CTHD VALUES('HD36','GT03',2);
INSERT INTO CTHD VALUES('HD36','MK01',2);

INSERT INTO CTHD VALUES('HD37','MK02',1);
INSERT INTO CTHD VALUES('HD37','GT03',2);

INSERT INTO CTHD VALUES('HD38','XD09',1);
INSERT INTO CTHD VALUES('HD38','BH01',1);

INSERT INTO CTHD VALUES('HD39','DE02',3);

INSERT INTO CTHD VALUES('HD40','SE02',2);
INSERT INTO CTHD VALUES('HD40','BR01',2);

INSERT INTO CTHD VALUES('HD41','BR02',2);
INSERT INTO CTHD VALUES('HD41','SE01',1);

INSERT INTO CTHD VALUES('HD42','XD14',1);
INSERT INTO CTHD VALUES('HD42','MK02',1);

INSERT INTO CTHD VALUES('HD43','XD11',1);

INSERT INTO CTHD VALUES('HD44','DE03',2);
INSERT INTO CTHD VALUES('HD44','DE07',2);
INSERT INTO CTHD VALUES('HD44','RU05',2);

INSERT INTO CTHD VALUES('HD45','XD08',1);
INSERT INTO CTHD VALUES('HD45','BH02',1);
INSERT INTO CTHD VALUES('HD45','GT03',1);
INSERT INTO CTHD VALUES('HD45','MK01',1);

--KHUYENMAI
INSERT INTO KHUYENMAI VALUES ('KM01' , 'Giam 10% cho hoa don tren 3 trieu dong', 3000000, 0.1);
INSERT INTO KHUYENMAI VALUES ('KM02' , 'Giam 15% cho hoa don tren 6 trieu dong', 6000000, 0.15);
INSERT INTO KHUYENMAI VALUES ('KM03' , 'Giam 20% cho hoa don tren 10 trieu dong', 10000000, 0.2);
INSERT INTO KHUYENMAI VALUES ('KM04' , 'Giam 25% cho hoa don tren 18 trieu dong', 18000000, 0.25);
INSERT INTO KHUYENMAI VALUES ('KM05' , 'Giam 30% cho hoa don tren 25 trieu dong', 25000000, 0.3);
INSERT INTO KHUYENMAI VALUES ('KM00' , 'Mac dinh', 0, 0);

ALTER TABLE TAIKHOAN ADD VAITRO INT;
--0 QLCH
--1 NVCH
--2 NVHT
UPDATE TAIKHOAN 
SET VAITRO = 1
WHERE manv IN (SELECT MANV
                FROM NHANVIEN
                WHERE MADV LIKE 'CH%');

UPDATE TAIKHOAN 
SET VAITRO = 0
WHERE manv IN ('NV01', 'NV06', 'NV11', 'NV16');

UPDATE TAIKHOAN 
SET VAITRO = 2
WHERE manv IN (SELECT MANV
                FROM NHANVIEN
                WHERE MADV NOT LIKE 'CH%');

--Rang buoc mien gia tri
ALTER TABLE NHANVIEN ADD CONSTRAINT chk_gtinh_nv CHECK (GIOITINH IN ('Nam', 'Nu'));
ALTER TABLE KHACHHANG ADD CONSTRAINT chk_gtinh_kh CHECK (GIOITINH IN ('Nam', 'Nu'));
--ALTER TABLE SANPHAM ADD CONSTRAINT chk_dvt CHECK (DVT IN ('chiec', 'cai', 'bo', 'cap', 'doi'));

--Khoa ngoai
--TAIKHOAN
ALTER TABLE TAIKHOAN ADD CONSTRAINT fk_tk_nv FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
--CUAHANG
ALTER TABLE CUAHANG ADD CONSTRAINT fk_ch_nv FOREIGN KEY (MA_NGQL) REFERENCES NHANVIEN(MANV);

--PHONGBAN 
ALTER TABLE PHONGBAN ADD CONSTRAINT fk_pb_nv FOREIGN KEY (MA_TRGPB) REFERENCES NHANVIEN(MANV);

--KHO
ALTER TABLE KHO ADD CONSTRAINT fk_kho_nv FOREIGN KEY (MA_NGQL) REFERENCES NHANVIEN(MANV);

--CTTON
ALTER TABLE CTTON ADD CONSTRAINT fk_ctton_sp FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP);

--CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk_cthd_hd FOREIGN KEY (MAHD) REFERENCES HOADON(MAHD);

--HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk_hd_km FOREIGN KEY (MAKM) REFERENCES KHUYENMAI(MAKM);