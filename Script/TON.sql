--TON
CREATE TABLE TON (
    MASP CHAR(4) NOT NULL,
    MACH CHAR(4) NOT NULL,
    SOLUONG INT,
    CONSTRAINT pk_ton PRIMARY KEY (MASP, MACH)
);
--Khoa ngoai
--TON 
ALTER TABLE TON ADD CONSTRAINT fk_ton_sp FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP);
ALTER TABLE TON ADD CONSTRAINT fk_ton_ch FOREIGN KEY (MACH) REFERENCES CUAHANG(MACH);

--Du lieu
insert into TON values('XD01','CH01', 20);
insert into TON values('XD01','CH02', 15);
insert into TON values('XD01','CH03', 10);
insert into TON values('XD01','CH04', 25);
insert into TON values('XD01','CH05', 5);

insert into TON values('XD02','CH02', 5);
insert into TON values('XD02','CH03', 15);
insert into TON values('XD02','CH04', 20);
insert into TON values('XD02','CH05', 25);

insert into TON values('XD03','CH01', 15);
insert into TON values('XD03','CH02', 6);
insert into TON values('XD03','CH03', 14);
insert into TON values('XD03','CH05', 7);

insert into TON values('XD04','CH01', 1);
insert into TON values('XD04','CH02', 18);
insert into TON values('XD04','CH03', 11);
insert into TON values('XD04','CH04', 9);
insert into TON values('XD04','CH05', 10);

insert into TON values('XD05','CH01', 2);
insert into TON values('XD05','CH02', 5);
insert into TON values('XD05','CH03', 17);
insert into TON values('XD05','CH04', 13);
insert into TON values('XD05','CH05', 5);

insert into TON values('XD06','CH01', 22);
insert into TON values('XD06','CH03', 14);
insert into TON values('XD06','CH05', 16);

insert into TON values('XD07','CH01', 16);
insert into TON values('XD07','CH02', 20);
insert into TON values('XD07','CH03', 10);
insert into TON values('XD07','CH04', 17);
insert into TON values('XD07','CH05', 8);

insert into TON values('XD08','CH02', 21);
insert into TON values('XD08','CH03', 2);
insert into TON values('XD08','CH04', 6);
insert into TON values('XD08','CH05', 4);

insert into TON values('XD09','CH01', 7);
insert into TON values('XD09','CH02', 3);

insert into TON values('XD10','CH01', 10);
insert into TON values('XD10','CH02', 12);
insert into TON values('XD10','CH03', 20);
insert into TON values('XD10','CH04', 19);

insert into TON values('XD11','CH01', 26);
insert into TON values('XD11','CH03', 9);
insert into TON values('XD11','CH04', 5);
insert into TON values('XD11','CH05', 15);

insert into TON values('XD12','CH01', 15);
insert into TON values('XD12','CH02', 25);
insert into TON values('XD12','CH03', 27);
insert into TON values('XD12','CH04', 5);
insert into TON values('XD12','CH05', 15);

insert into TON values('BH01','CH01', 40);
insert into TON values('BH01','CH02', 35);
insert into TON values('BH01','CH03', 24);
insert into TON values('BH01','CH04', 36);
insert into TON values('BH01','CH05', 25);

insert into TON values('BH02','CH01', 33);
insert into TON values('BH02','CH02', 28);
insert into TON values('BH02','CH03', 20);
insert into TON values('BH02','CH04', 30);
insert into TON values('BH02','CH05', 15);

insert into TON values('BH03','CH01', 28);
insert into TON values('BH03','CH02', 39);
insert into TON values('BH03','CH03', 10);
insert into TON values('BH03','CH04', 25);
insert into TON values('BH03','CH05', 34);

insert into TON values('GT01','CH01', 30);
insert into TON values('GT01','CH02', 35);
insert into TON values('GT01','CH03', 40);
insert into TON values('GT01','CH04', 36);
insert into TON values('GT01','CH05', 30);

insert into TON values('GT02','CH01', 20);
insert into TON values('GT02','CH02', 45);
insert into TON values('GT02','CH03', 30);
insert into TON values('GT02','CH04', 37);
insert into TON values('GT02','CH05', 36);

insert into TON values('GT03','CH01', 25);
insert into TON values('GT03','CH02', 45);
insert into TON values('GT03','CH03', 35);
insert into TON values('GT03','CH04', 40);
insert into TON values('GT03','CH05', 30);

insert into TON values('MK01','CH01', 20);
insert into TON values('MK01','CH02', 15);
insert into TON values('MK01','CH03', 35);
insert into TON values('MK01','CH04', 38);
insert into TON values('MK01','CH05', 40);

insert into TON values('MK02','CH01', 26);
insert into TON values('MK02','CH02', 45);
insert into TON values('MK02','CH03', 32);
insert into TON values('MK02','CH04', 25);
insert into TON values('MK02','CH05', 45);

insert into TON values('BO01','CH01', 16);
insert into TON values('BO01','CH02', 15);
insert into TON values('BO01','CH03', 22);
insert into TON values('BO01','CH04', 15);
insert into TON values('BO01','CH05', 30);

insert into TON values('DE01','CH01', 16);
insert into TON values('DE01','CH02', 15);
insert into TON values('DE01','CH03', 22);
insert into TON values('DE01','CH04', 15);
insert into TON values('DE01','CH05', 30);

insert into TON values('DE02','CH01', 10);
insert into TON values('DE02','CH02', 10);
insert into TON values('DE02','CH03', 25);
insert into TON values('DE02','CH05', 15);

insert into TON values('SE01','CH01', 45);
insert into TON values('SE01','CH02', 35);
insert into TON values('SE01','CH03', 50);
insert into TON values('SE01','CH04', 25);
insert into TON values('SE01','CH05', 30);

insert into TON values('SE02','CH01', 35);
insert into TON values('SE02','CH02', 40);
insert into TON values('SE02','CH03', 30);
insert into TON values('SE02','CH04', 45);
insert into TON values('SE02','CH05', 20);

insert into TON values('SE03','CH01', 15);
insert into TON values('SE03','CH02', 20);
insert into TON values('SE03','CH03', 20);
insert into TON values('SE03','CH04', 35);
insert into TON values('SE03','CH05', 30);

insert into TON values('BR01','CH01', 55);
insert into TON values('BR01','CH02', 50);
insert into TON values('BR01','CH03', 65);
insert into TON values('BR01','CH04', 54);
insert into TON values('BR01','CH05', 47);

insert into TON values('BR02','CH01', 45);
insert into TON values('BR02','CH02', 60);
insert into TON values('BR02','CH03', 55);
insert into TON values('BR02','CH04', 56);
insert into TON values('BR02','CH05', 49);

insert into TON values('RU01','CH01', 60);
insert into TON values('RU01','CH03', 55);
insert into TON values('RU01','CH04', 46);
insert into TON values('RU01','CH05', 45);

insert into TON values('RU02','CH01', 55);
insert into TON values('RU02','CH02', 40);
insert into TON values('RU02','CH03', 50);
insert into TON values('RU02','CH04', 48);
insert into TON values('RU02','CH05', 55);

insert into TON values('RU03','CH01', 35);
insert into TON values('RU03','CH02', 40);
insert into TON values('RU03','CH03', 45);
insert into TON values('RU03','CH04', 36);

insert into TON values('RU04','CH01', 25);
insert into TON values('RU04','CH02', 30);
insert into TON values('RU04','CH03', 15);
insert into TON values('RU04','CH04', 40);
insert into TON values('RU04','CH05', 37);



