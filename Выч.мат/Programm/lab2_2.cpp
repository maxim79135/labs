#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;

const	int n = 3;	
const double e = 0.01;

bool converge(double *xk, double *xkp) {
	double norm = 0;
	for (int i = 0; i < n; i++) norm += (xk[i] - xkp[i]) * (xk[i] - xkp[i]);
	return (sqrt(norm) < e); 
}

int main() {
	cout << "Solving a fourth-order linear equation system by the Zeidel method" << endl;
	
	double A [4][4] = { 	{0.17, 0.31, -0.18, 0.22}, 
	                      {-0.21, 0, 0.33, 0.22}, 
									      {0.32, -0.18, 0.05, -0.19}, 
									      {0.12, 0.28, -0.14, 0} 
											 };
	
	double B[4] = {-1.71, 0.62, -0.89, 0.94};
	double x[4], p[4];

	for (int i = 0; i < n; i++) x[i] = B[i];
	do {
		for (int i = 0; i < n; i++) p[i] = x[i];
		for (int i = 0; i < n; i++) {
    	double var = 0;
			for (int j = 0; j < n; j++) var += (A[i][j] * x[j]);
    	x[i] = B[i] + var;
			for (int i = 0; i < n; i++) cout << setw(5) << fixed << setprecision(5) << x[i] << " | ";
			cout << endl;
		}
	}
	while (!converge(x, p));

	for (int i = 0; i < n; i++) cout << "x" << i + 1 << " = " << x[i] << " | ";
}