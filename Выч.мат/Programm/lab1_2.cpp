#include <iostream>
#include <cmath>

using namespace std;


double f(double x) { return x * x - log(x + 1); }
double f_1(double x) { return 2 * x - 1 / (x + 1); }
double f_2(double x) { return 2 + 1 / (x + 1) * (x + 1); }

double find(double x, double e) {
	double rez;
	int iteration;
	do {
		iteration++;
		rez = x;
		x = sqrt(log(x + 1));
	} while (fabs(rez - x) > e);
	return x;
}

int main(int argc, char const *argv[])
{
	double a = 0.5, b = 0.9, e = 0.000001;	
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
	cout << "phi(x) = sqrt(ln(x + 1)" << endl;
	double x0 = (a + b) / 2;
	cout << "phi'(x0) = " << 1 / (2 * sqrt(log(x0 + 1)) * (x0 + 1)) << endl;
	cout << find(x0, e);
	return 0;
}