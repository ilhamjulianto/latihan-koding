/* --------------------------------------------------------------
 * Program: Perhitungan IP Mahasiswa
 * Ditulis oleh: Fajar Ru <kzofajar@gmail.com> @05-Oct-2018
 * --------------------------------------------------------------
 */

#include <iostream>
#include <array>
using namespace std;

float konversiNilaiKeIp(float totalNilai, int totalSks)
{
    return totalNilai / totalSks;
}

char konversiNilaiAngkaKeHuruf(float nilai)
{
    if (nilai > 80)
        return 'A';
    else if (nilai > 60 && nilai <= 80)
        return 'B';
    else if (nilai > 40 && nilai <= 60)
        return 'C';
    else if (nilai > 20 && nilai <= 40)
        return 'D';
    else
        return 'E';
}

int konversiNilaiHurufKeAngka(char huruf)
{
    switch(huruf){
        case 'A':
            return 4;
        case 'B':
            return 3;
        case 'C':
            return 2;
        case 'D':
            return 1;
        default:
            return 0;
    }
}

int main()
{
    string nama, nim;
    const int JUMLAH_SKS_PER_MATKUL = 2;
    float ipkMhs = 0, totalNilai = 0, _nilaiAsli = 0, _nilaiAngka = 0;
    char _nilaiHuruf;

    cout << "Nama Mahasiswa: ";
    getline(cin, nama);

    cout << "NIM: ";
    getline(cin, nim);

    array<string, 5> matkul = {
        "Algoritma dan Pemrograman",
        "Aljabar dan Linear Matriks",
        "Bahasa Inggris I",
        "Pendidikan Agama",
        "Kalkulus"
    };

    cout << endl;

    for (int i = 0; i < matkul.size(); i++)
    {
        cout << matkul[i] << " (0-100): ";
        cin >> _nilaiAsli;

        _nilaiHuruf = konversiNilaiAngkaKeHuruf(_nilaiAsli);
        cout << _nilaiAsli << " => " << _nilaiHuruf;

        _nilaiAngka = konversiNilaiHurufKeAngka(_nilaiHuruf);
        cout << " => " << _nilaiAngka << "\n\n";

        totalNilai += _nilaiAngka * JUMLAH_SKS_PER_MATKUL;
    }

    ipkMhs = konversiNilaiKeIp(totalNilai, matkul.size() * JUMLAH_SKS_PER_MATKUL);
    cout << nama << " (" << nim << ")" << endl;
    cout << "Total IP(K) anda: " << ipkMhs;

    return 0;
}
