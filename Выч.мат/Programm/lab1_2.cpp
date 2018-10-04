#include <iostream>
#include <cmath>

using namespace std;

double f(double x) { return x * x - log(x + 1); }

double find(double x, double e) {
	double rez;
	int iteration;
	cout << "x0 = " << x << endl;
	do {
		iteration++;
		rez = x;
		x = sqrt(log(x + 1));
	} while (fabs(rez - x) > e && iteration < 10000000);
	return x;
}

int main(int argc, char const *argv[])
{
	double a = 0.5, b = 0.9, e = 0.000001;	
	cout << find(a, e);
	return 0;
}
