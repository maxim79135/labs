#include <iostream>
#include <cmath>

using namespace std;

double f(double x) { return x * x - log(x + 1); }
double f_1(double x) { return 2 * x - 1 / (x + 1); }
double f_2(double x) { return 2 + 1 / (x + 1) * (x + 1); }

int main() {
	double a = 0.1, b = 0.9, e = 0.000001;
	while (abs(a - b ) > 2 * e) {
		if (f_1(a) * f_2(a) < 0) a = a - f(a) * (a - b) / (f(a) - f(b));
		if (f_1(a) * f_2(a) > 0) a = a - f(a) / f_1(a);
		
		if (f_1(b) * f_2(b) < 0) b = b - f(b) * (b - a) / (f(b) - f(a));
		if (f_1(b) * f_2(b) > 0) b = b - f(b) / f_1(b);
	}

	double x = (a + b) / 2;
	cout << x;
}