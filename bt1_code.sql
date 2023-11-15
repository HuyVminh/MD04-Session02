CREATE TABLE phieu_xuat(
	SoPX INT PRIMARY KEY,
    NgayXuat DATE
);
CREATE TABLE vat_tu(
	MaVT INT PRIMARY KEY,
    TenVT VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE phieu_nhap(
	SoPN INT PRIMARY KEY,
    NgayNhap DATE
);
CREATE TABLE chi_tiet_phieu_xuat(
	SoPX INT,
    FOREIGN KEY(SoPX) REFERENCES phieu_xuat(SoPX),
    MaVT INT,
    FOREIGN KEY(MaVT) REFERENCES vat_tu(MaVT),
    primary key(SoPX,MaVT),
    DGXuat FLOAT NOT NULL,
    SLXuat INT
);
create table chi_tiet_phieu_nhap(
	MaVT INT,
    FOREIGN KEY(MaVT) REFERENCES vat_tu(MaVT),
    SoPN INT,
    FOREIGN KEY(SoPN) REFERENCES phieu_nhap(SoPN),
    primary key(MaVT,SoPN),
    DGNhap float NOT NULL,
    SLNhap int
);
create table nha_cung_cap(
	MaNCC int primary key,
    TenNCC varchar(100) NOT NULL,
    DiaChi varchar(255) NOT NULL UNIQUE,
    SDT varchar(50) NOT NULL UNIQUE
);
create table don_DH(
	SoDH int primary key,
    NgayDH date,
    MaNCC INT,
    FOREIGN KEY(MaNCC) REFERENCES nha_cung_cap(MaNCC)
);
create table chi_tiet_don_dat_hang(
	MaVT INT,
    FOREIGN KEY(MaVT) REFERENCES vat_tu(MaVT),
    SoDH INT,
    FOREIGN KEY(SoDH) REFERENCES don_DH(SoDH),
    primary key(MaVT,SoDH)
);

