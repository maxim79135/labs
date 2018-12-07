#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

double f(double x) {
	return 1 / sqrt(x * x + 0.6);
}

int main(int argc, char const *argv[])
{
	cout << "Method by Simpson with numerical integration\n";
	cout << "f(x) = 1/sqrt(x^2+0,6)\n";
	cout << "[a,b] = [2.2,2.6]\n";
	double a = 2.2, b = 2.6, e = 0.0001; 
	cout << "e = M2 / (12 * N^2)\n";
	double M2 = max((3 * a * a / (a * a + 0.6) - 1) / pow(sqrt(a * a + 0.6),3),
									(3 * b * b / (b * b + 0.6) - 1) / pow(sqrt(b * b + 0.6),3));
	cout << "M2 = " << M2 << endl;
	int N = round(sqrt(M2 / 12 / e));
	cout << "N = " << N << endl;
	int n = N / 2;
	double h = (b - a) / N;
	double integral = 0, s1 = 0, s2 = 0;
	integral += f(a);
	for (int i = 1; i <= n - 1; i++) s1 += f(a + 2 * i * h);
	for (int i = 1; i <= n; i++) s2 += f(a + (2 * i - 1) * h);
	integral += 2 * s1 + 4 * s2 + f(b);
	integral *= h / 3;
	cout << "Integral f(x) on [a,b]: h / 3 * (2 * (summ(i=1..n-1) f(xi)) + summ(i=1..n) f(x(i-1)))\n";
	cout << "Integral f(x) on [a,b]: " << integral << endl;
	return 0;
}
