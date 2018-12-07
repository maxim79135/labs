#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

double f(double x) {
	return x * x * log10(x);
}

int main(int argc, char const *argv[])
{
	cout << "Method by Simpson with numerical integration\n";
	cout << "f(x) = x^2*lg(x)\n";
	cout << "[a,b] = [1.4,3]\n";
	double a = 1.4, b = 3, e = 0.0001; 
	double integral_1 = 0, integral_2 = 0.1; 
	int n = 50;
	cout << 1.0 / 3 * (integral_2 - integral_1) << endl;
	while (1.0 / 3 * (integral_2 - integral_1) >= e) {
		integral_1 = integral_2;
		a = 1.4 + pow(e, 0.5);
		cout << "n = " << n << endl;
		double h = (b - a) / n, s1 = 0;
		integral_2 = 0;
		integral_2 += f(a) / 2 * (a - 1.4) + f(b) / 2 * (b - (a + (n - 1) * h));
		for (int i = 1; i <= n - 1; i++)
			s1 += f(a + i * h) / 2 * (a + (i + 1) * h - (a + (i - 1) * h));
		integral_2 += s1;
		cout << "Intgral f(x) on [a,b]: " << integral_2 << endl;
		n *= 2;
	}
	return 0;
}
