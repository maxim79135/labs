#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

const int n = 11;
void newton(double *x, double *y, double *X);
int Fact(int x);

int main() {
	double X[n] = { 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65 };
	double Y[n] = { 0.860708, 0.818731, 0.778801, 0.740818, 0.704688, 0.670320, 0.637628, 0.606531, 0.576950, 0.548812, 0.522046 }; 
	double t[4] = { 0.1535, 0.6247, 0.1317,0.6672 };
	double e = 0.000001;

	cout << "Interpolation according to the Newton formula" << endl;
	cout << "X1=0,1535; X2=0,6247; X3=0,1317; X4=0,6672" << endl;
	cout << "0,15     0,860708 " << endl 
 			 <<	"0,20     0,818731 " << endl
 			 <<	"0,25     0,778801 " << endl 
 			 <<	"0,30     0,740818 " << endl 
 			 <<	"0,35     0,704688 " << endl 
 			 <<	"0,40     0,670320 " << endl 
 			 <<	"0,45     0,637628 " << endl 
 			 <<	"0,50     0,606531 " << endl 
 			 <<	"0,55     0,576950 " << endl 
 			 <<	"0,60     0,548812 " << endl
 			 <<	"0,65     0,522046 \n\n";
	
	newton(X, Y, t);
}

void newton(double *x, double *y, double *X) {
	double a[n][n];
	double sum;
	
	for (int i = 0; i < 4; i++) {
		sum = 0;

		for (int j = 0; j < n; j++) a[j][0] = y[j];

		for (int j = 1; j < n; j++)
			for (int k = 0; k < n - j; k++)
				a[k][j] = a[k + 1][j - 1] - a[k][j - 1];
		
		double q;
		if (i % 2 == 0) {
			q = (X[i] - x[0]) / 0.05;
			sum += y[0];
			double p;
			for (int j = 1; j < n; j++) {
				p = 1;
				for (int k = 0; k < j; k++) 
					p *= (q - k);
				sum += p * a[0][j] / Fact(j);
			}
		} else {
			q = (X[i] - x[n - 1]) / 0.05;
			sum += y[n - 1];
			double p;
			for (int j = 1; j < n; j++) {
				p = 1;
				for (int k = 0; k < j; k++) 
					p *= (q + k);
				//cout << p << " " << a[n - j - 1][j] << endl;
				sum += p * a[n - j - 1][j] / Fact(j);
			}
		}
		cout << "N(X" << i + 1 << ")" << " = " << fixed << setprecision(6) << sum << endl;	
	}
	cout << "\n\n Finite differences: " << endl;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n - i; j++)
			cout << setw(9) << a[i][j] << " | ";
		cout << endl;
	}
}

int Fact(int x)  { 
    if (x==0)
    return 1;
    return x*Fact(x-1);
}
