#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

const int n = 6;
double lagrang(double *x, double *y, double X);

int main() {
	double X[6] = { 0.35, 0.41, 0.47, 0.51, 0.56, 0.64 };
	double Y[6] = { 2.73951, 2.30080, 1.96864, 1.78776, 1.59502, 1.34310 }; 
	double t = 0.453;
	double e = 0.000001;

	cout << "Interpolation according to the Lagrange formula" << endl;
	cout << "X = 0,453" << endl;
	cout << "0,35     2,73951 " << endl 
 			 <<	"0,41     2,30080 " << endl
 			 <<	"0,47     1,96864 " << endl 
 			 <<	"0,51     1,78776 " << endl 
 			 <<	"0,56     1,59502 " << endl 
 			 <<	"0,64     1,34310 " << endl;
	
	cout << "L(X) = " << fixed << setprecision(6) << lagrang(X, Y, t) << endl;
	//cout << (-82.0647873) * t*t*t*t*t + 240.8373045285334 * t * t * t * t - 292.282957064 * t * t * t +187.6966416139549 * t * t - 67.60908206759223 * t +12.7584368549594;
}

double lagrang(double *x, double *y, double X) {
	double sum = 0, p = 1;

	for (int i = 0; i < n; i++) {
		p = 1;
		for (int j = 0; j < n; j++) {
			if (i != j) {
				p *= ((X-x[j]) / (x[i] - x[j]));
			}
		}
		sum += y[i] * p;
	}
	return sum;
}


