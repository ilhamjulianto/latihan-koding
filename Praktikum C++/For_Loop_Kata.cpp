/*
 * Program: For-loop kata membentuk segitiga terbalik
 * Ditulis oleh: Fajar Ru <kzofajar@gmail.com> @23-Oct-2018
 * 
 * Ilustrasi Output:
 * --------------------------
 * KLATEN NETALK
 *  LATEN NETAL
 *   ATEN NETA
 *    TEN NET
 *     EN NE
 *      N N
 * --------------------------
 */

#include <iostream>
#include <string.h>
using namespace std;

int main()
{
    char kata[255];
    cout << "Susun Kata: ";
    cin >> kata;

    int panjangKata = strlen(kata);

    for (int startIndex = 0; startIndex < panjangKata; startIndex++)
    {
        // For-loop Whitespace
        for (int counterSpace = 0; counterSpace < startIndex; counterSpace++)
        {
            cout << " ";
        }

        // For-loop Kata Normal
        for (int indexKata = startIndex; indexKata < panjangKata; indexKata++)
        {
            cout << kata[indexKata];
        }

        cout << " ";

        // For-loop Kata Terbalik
        for (int indexKata = panjangKata; indexKata > startIndex; indexKata--)
        {
            cout << kata[indexKata - 1];
        }

        cout << endl;
    }

    return 0;
}
