#include <iostream>
#include <cmath>
#include <iomanip>
#include <algorithm>

using namespace std;


double phi(double x) { return sqrt(log(x + 1)); }
double phi_1(double x) { return 1 / (2 * sqrt(log(x + 1)) * (x + 1));}

double find(double x, double e) {
	double rez;
	int iteration = 0;
	do {
		iteration++;
		rez = x;
		x = sqrt(log(x + 1));
		cout << "n= " << fixed << setprecision(6) << setw(5) << iteration << "  xn = " << setw(10) << rez << " xn+1 = " << setw(10) << x << " |x(n+1)-xn|" << setw(10) << abs(rez - x) << endl;
	} while (phi_1(0.5) / (1 - phi_1(0.5)) * fabs(rez - x) > e);
	return x;
}

int main(int argc, char const *argv[])
{
	double a = 0.5, b = 0.9, e = 0.000001;	
	cout << "F(x) = x^2 - ln(x+1)" << endl;
	cout << "Combined solution" << endl;
	cout << "Isolation interval [" << a << ";" << b << "]" << endl;
	cout << "Calculation error: " << e << endl;
	cout << "phi(x) = sqrt(ln(x + 1)" << endl;
	cout << "phi(a) = " << phi(a) << endl;
	cout << "phi(b) = " << phi(b) << endl; 
	cout << "phi'(a) = " << phi_1(a) << endl;
	cout << "phi'(b) = " << phi_1(b) << endl;
	if (abs(phi_1(a)) < 1 && abs(phi_1(b) < 1)) cout << "|phi'(x)| < 1" << endl;
	cout << "One-sided convergence" << endl;
	double x0 = (a + b) / 2;
	cout << find(x0, e);
	return 0;
}