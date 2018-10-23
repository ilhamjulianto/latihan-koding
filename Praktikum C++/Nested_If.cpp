/* --------------------------------------------------------------
 * Program: Multi-level Menu dengan Nested If
 * Ditulis oleh: Fajar Ru <kzofajar@gmail.com> @12-Oct-2018
 * --------------------------------------------------------------
 */

#include <iostream>
using namespace std;

/**
	Generator untuk Nama Belakang.
	
	@param jenisKelamin : Int Kode Jenis Kelamin.
	@param tanggal : Int Tanggal Lahir User.
	@return String Nama Belakang.
*/
string cekNamaBelakang(int jenisKelamin, int tanggal)
{	
	if (jenisKelamin == 1)
	{
		if ((tanggal >= 1) && (tanggal <= 10))
			return "Finn";
		if ((tanggal >= 11) && (tanggal <= 20))
			return "Han";
		if ((tanggal >= 21) && (tanggal <= 31))
			return "Anakin";
		else
			return " Guy";
	}
	else if (jenisKelamin == 2)
	{
		if ((tanggal >= 1) && (tanggal <= 10))
			return "Leia";
		if ((tanggal >= 11) && (tanggal <= 20))
			return "Mira";
		if ((tanggal >= 21) && (tanggal <= 31))
			return "Atris";
		else
			return "Girl";
	}
	
	return "Unknown";
}

/**
	Generator untuk Nama Depan.
	
	@param bulan : Int Bulan Lahir User.
	@return String Nama Depan.
*/
string cekNamaDepan(int bulan)
{
	if ((bulan >= 1) && (bulan <= 4))
		return "Master";
	if ((bulan >= 5) && (bulan <= 8))
		return "Guardian";
	if ((bulan >= 9) && (bulan <= 12))
		return "Dark Lord";
	else
		return "Apprentice";
}

/**
	Generator Nama Lengkap.
	
	@param jenisKelamin : Int Kode Jenis Kelamin.
	@param tanggalLahir : Int Tanggal Lahir User.
	@param bulanLahir : Int Bulan Lahir User.
	@return String Nama Depan.
*/
string generatorNama(int jenisKelamin, int tanggalLahir, int bulanLahir)
{
	string nama;
	
	nama = cekNamaDepan(bulanLahir);
	nama += " " + cekNamaBelakang(jenisKelamin, tanggalLahir);
	
	return nama;
}

int main()
{
	int pilihan, jenisKelamin, tanggal, bulan;
	
	cout << R"(      ________________.  ___     .______
     /                | /   \    |   _  \
    |   (-----|  |----`/  ^  \   |  |_)  |
     \   \    |  |    /  /_\  \  |      /
.-----)   |   |  |   /  _____  \ |  |\  \-------.
|________/    |__|  /__/     \__\| _| `.________|
 ____    __    ____  ___     .______    ________.
 \   \  /  \  /   / /   \    |   _  \  /        |
  \   \/    \/   / /  ^  \   |  |_)  ||   (-----`
   \            / /  /_\  \  |      /  \   \
    \    /\    / /  _____  \ |  |\  \---)   |
     \__/  \__/ /__/     \__\|__| `._______/

)" << endl;
	
	cout << "##################################################" << endl
		 << "------------- Apa nama Star Wars mu? -------------" << endl
		 << "==================================================" << endl;
	
	cout << "MAIN MENU" << endl
		 << "--------------------------------------------------" << endl;
	
	cout << "Apakah kamu tahu atau suka Star Wars?" << endl
		 << "1. Ya" << endl
		 << "2. Tidak " << endl
		 << "Jawaban: ";
	cin >> pilihan;
	
	cout << endl
		 << "--------------------------------------------------" << endl
		 << "MAIN MENU > PILIHAN " << pilihan << endl
		 << "--------------------------------------------------" << endl;
			 
	if (pilihan == 1)
	{
		cout << "Apa jenis kelamin kamu? " << endl
			 << "1. Laki-Laki" << endl
			 << "2. Perempuan" << endl
			 << "Jawaban: ";
		cin >> jenisKelamin;
		
		if (!((jenisKelamin == 1) || (jenisKelamin == 2)))
		{
			cout << "Jawaban gak cocok!";
			return 0;
		}
		
		cout << endl
			 << "--------------------------------------------------" << endl
			 << "MAIN MENU > PILIHAN 1 > PILIHAN " << jenisKelamin << endl
			 << "--------------------------------------------------";
			
		cout << endl
			 << "Apa Bulan Lahirmu? " << endl
			 << "Input (1-12): ";
		cin >> bulan;
		
		cout << endl
			 << "Apa Tanggal Lahirmu? " << endl
			 << "Input (1-31): ";
		cin >> tanggal;
		
		cout << endl 
			 << "==================================================" << endl
			 << "May the force be with you, " 
			 << generatorNama(jenisKelamin, tanggal, bulan) 
			 << "!" << endl
			 << "##################################################" << endl;
	}
	else if (pilihan == 2)
	{
		cout << "Yakin nih?" << endl
			 << "1. Ya" << endl
			 << "2. Tidak " << endl
			 << "Jawaban: ";
		cin >> pilihan;
		
		cout << endl
			 << "--------------------------------------------------";
			 
		if (pilihan == 1)
			cout << endl << "Sampai jumpa teman!";
		else if (pilihan == 2)
			cout << endl << "Welcome to the club!";
		else
			cout << "Jawaban gak cocok!";
	} 
	else
	{
		cout << "Jawaban gak cocok!";
	}
	
	return 0;
}
