#include <iostream>
#include <cmath>
#include <iomanip>
#include <algorithm>

using namespace std;

double f(double x) { return x * x - log(x + 1); }
double f_1(double x) { return 2 * x - 1 / (x + 1); }
double f_2(double x) { return 2 + 1 / ((x + 1) * (x + 1)); }

int main() {
	double a = 0.1, b = 0.9, e = 0.00001;
	cout << "F(x) = x^2 - ln(x+1)" << endl;
	cout << "Combined solution" << endl;
	cout << "Isolation interval [" << a << ";" << b << "]" << endl;
	cout << "Calculation error: " << e << endl;
	cout << "F(a) = " << f(a) << endl;
	cout << "F(b) = " << f(b) << endl; 
	cout << "F'(a) = " << f_1(a) << endl;
	cout << "F'(b) = " << f_1(b) << endl;
	cout << "F''(a) = " << f_2(a) << endl;
	cout << "F''(b) = " << f_2(b) << endl;	
	int n = 1;
	//if (!max(abs(f_2(a)), abs(f_2(b))) <= 2 * max(abs(f_1(a)), abs(f_1(b)))) b = b - (b - a) / 2;
	
	if (f(a) * f_2(a) > 0) {
			a = a - f(a) / f_1(a);
			b = b - f(b) * (b - a) / (f(b) - f(a));
	} else {
			b = b - f(b) / f_1(b);
			a = a - f(a) * (a - b) / (f(a) - f(b));
	}

	while (abs(a - b ) > 2 * e) {
		a = a - f(a) / f_1(a);
		b = b - f(b) * (b - a) / (f(b) - f(a));
		cout << "n= " << fixed << setprecision(6) << n << "  a = " << setw(10) << a << " b = " << setw(10) << b << " |b-a|" << setw(10) << abs(b - a) << endl;
		n++;
	}

	double x = (a + b) / 2;
	cout << "Equation solution " << x;
}