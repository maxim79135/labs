#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

double f(double x, double y) {
	return x + y * sqrt(x);
}

int main(int argc, char const *argv[])
{
	cout << "Solve differential equation by Runge-Kutt method the second order\n";
	cout << "Current equation: y'=x+y*sqrt(x)\n";
	cout << "a=1; y(0)=0; h=0,1; 0<=x<=1\n";
	double a = 0, h[2] = {0.05, 0.1}, x, y[2] = {0, 0};
	for (int j = 0; j < 2; j++) {	
		for (int i = 0; i < 1 / h[j]; i++) {
			x = a + i * h[j];
			y[j] += h[j] * f(x + h[j] / 2, y[j] + h[j] / 2 * f(x, y[j]));
			cout << fixed << setprecision(6) << "x = " << x << " y = " << y[j] << endl;
		}
		cout << "y = " << y[j] << endl << endl;
	}
	cout << "e = y(h/2) - y(h)";
	cout << "e = " << (y[0] - y[1]) / 3 << endl;
	return 0;
}
