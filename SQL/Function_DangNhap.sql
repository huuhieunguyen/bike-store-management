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
