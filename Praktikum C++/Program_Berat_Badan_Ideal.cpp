/* --------------------------------------------------------------
 * Program: Penghitung Berat Badan Ideal
 * Ditulis oleh: Fajar Ru <kzofajar@gmail.com> @13-Oct-2018
 * --------------------------------------------------------------
 */

#include <iostream>
using namespace std;

float kalkulasiBeratIdeal(int jenisKelamin, float tinggiBadan)
{
    if (jenisKelamin == 1)
        return (tinggiBadan - 100) - ((tinggiBadan - 100) * 10 / 100);
    else if (jenisKelamin == 2)
        return (tinggiBadan - 100) - ((tinggiBadan - 100) * 15 / 100);

    return 0;
}

int main()
{
    int jenisKelamin;
    float beratBadan, tinggiBadan;

    cout << "Jenis Kelamin?" << endl
         << "1. Laki-laki" << endl
         << "2. Perempuan" << endl
         << "Jawaban: ";
    cin >> jenisKelamin;

    cout << endl;

    cout << "Masukkan berat badan anda: ";
    cin >> beratBadan;

    cout << "Masukkan tinggi badan anda: ";
    cin >> tinggiBadan;

    cout << endl;
    float beratIdeal = kalkulasiBeratIdeal(jenisKelamin, tinggiBadan);

    cout << "Berat ideal kamu: " << beratIdeal << "kg. Sementara berat kamu: " << beratBadan << "kg." << endl;

    if (beratIdeal < beratBadan)
        cout << "Kurusin badannya!" << endl;
    else
        cout << "Gemukin badannya!" << endl;

    return 0;
}
