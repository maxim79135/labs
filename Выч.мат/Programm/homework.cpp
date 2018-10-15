#include <iostream>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
	double xn = 0.95;
	double xn1 = xn;
	do {
		xn = xn1;
		xn1 = 1.5 - 0.5 * log(2 + xn);
		cout << xn << " " << xn1 << " " << abs(xn1 - xn) << endl;
	} while (abs(xn1 - xn) <= 0.0001);
}