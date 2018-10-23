/* --------------------------------------------------------------
 * Program: Multi-level Menu dengan Nested Switch
 * Ditulis oleh: Fajar Ru <kzofajar@gmail.com> @19-Oct-2018
 * --------------------------------------------------------------
 */

#include <iostream>
using namespace std;

int main()
{
    const float PI = 3.14;
    char pilihan;

    cout << "[1] Hitung Luas" << endl
         << "[2] Hitung Keliling" << endl
         << "Pilih Menu: ";
    cin >> pilihan;

    switch (pilihan)
    {
    case '1':
        cout << "[A] Luas - Persegi Panjang" << endl
             << "[B] Luas - Segitiga" << endl
             << "[C] Luas - Lingkaran" << endl
             << "Pilih Menu: ";
        cin >> pilihan;

        switch (toupper(pilihan))
        {
        case 'A':
            float panjang, lebar;

            cout << "Masukkan Panjang (cm): ";
            cin >> panjang;

            cout << "Masukkan Lebar (cm): ";
            cin >> lebar;

            cout << "Hasilnya: " << (panjang * lebar) << "cm.";
            break;
        case 'B':
            float alas, tinggi;

            cout << "Masukkan Alas (cm): ";
            cin >> alas;

            cout << "Masukkan Tinggi (cm): ";
            cin >> tinggi;

            cout << "Hasilnya: " << ((alas * tinggi) / 2) << "cm.";
            break;
        case 'C':
            float jari;

            cout << "Masukkan Jari-Jari Lingkaran (cm): ";
            cin >> jari;

            cout << "Hasilnya: " << (PI * jari * jari) << "cm.";
            break;
        default:
            cout << "-- Pilihan tidak valid! -- \n\n";
            break;
        }
        break;
    case '2':
        cout << "[A] Keliling - Persegi Panjang" << endl
             << "[B] Keliling - Segitiga" << endl
             << "[C] Keliling - Lingkaran" << endl
             << "Pilih Menu: ";
        cin >> pilihan;

        switch (toupper(pilihan))
        {
        case 'A':
            float panjang, lebar;

            cout << "Masukkan Panjang (cm): ";
            cin >> panjang;

            cout << "Masukkan Lebar (cm): ";
            cin >> lebar;

            cout << "Hasilnya: " << (2 * (panjang + lebar)) << "cm.";
            break;
        case 'B':
            float sisiA, sisiB, sisiC;

            cout << "Masukkan Sisi A (cm): ";
            cin >> sisiA;

            cout << "Masukkan Sisi B (cm): ";
            cin >> sisiB;

            cout << "Masukkan Sisi C (cm): ";
            cin >> sisiC;

            cout << "Hasilnya: " << (sisiA + sisiB + sisiC) << "cm.";
            break;
        case 'C':
            float diameter;

            cout << "Masukkan Diameter Lingkaran (cm): ";
            cin >> diameter;

            cout << "Hasilnya: " << (PI * diameter);
            break;
        default:
            cout << "-- Pilihan tidak valid! -- \n\n";
            break;
        }
        break;
    default:
        cout << "-- Pilihan tidak valid. Coba Lagi! -- \n\n";
        main();
        break;
    }

    return 0;
}
