/* --------------------------------------------------------------
 * Program: Output Segitiga dengan Simbol Bintang
 * Ditulis oleh: Fajar Ru <kzofajar@gmail.com> @23-Oct-2018
 * 
 * Cara kerja program ini adalah dengan meng-outputkan
 * karakter whitespace (spasi) dan karakter bintang pada tiap
 * barisnya menggunakan for-loop.
 * --------------------------------------------------------------
*/

#include <iostream>
using namespace std;

int main()
{
	int jumlahDeret, jumlahSpasi, counterSpasi, counterBintang;
	
	cout << "Masukkan jumlah deret: ";
	cin >> jumlahDeret;
	
	for (int i = jumlahDeret; i > 0; i--)
	{
		/* 
			Nilai i saat ini dipakai untuk menghitung jumlah karakter whitespace 
			yang akan dioutputkan. Dikurangi 1 karna kita ingin baris terbawah 
			tidak mempunyai whitespace pada bagian awalnya. Karna nilai terakhir
			dari i adalah 1 (kondisi for-loop i > 0)
		*/
		jumlahSpasi = i - 1;
		
		// Loop untuk membuat output whitespace nya.
		for (counterSpasi = jumlahSpasi; counterSpasi > 0; counterSpasi--)
		{
			cout << "   ";
		}
		
		// Loop untuk membuat output bintangnya nya.
		for (counterBintang = (jumlahDeret - jumlahSpasi); counterBintang > 0; counterBintang--)
		{
			// Segitiga kiri
			cout << " * ";
			
			/* 
				Ini adalah workaround untuk menghilangkan kolom / index pertama dari 
				deret bintang ke kanan. Digunakan untuk menghasilkan segitiga
				yang mempunyai ujung lancip.
			*/
			if (counterBintang == 1)
				continue;
			
			// Segitiga kanan
			cout << " * ";
		}
		
		// Akhiri baris saat ini.
		cout << endl;
	}
	
	return 0;
}
