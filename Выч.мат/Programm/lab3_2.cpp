#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

const int n = 6;
double lagrang(double *x, double *y, double X);

int main() {
	double X[11] = { 0.15, 0.20, 0.25, 0.30, 0.35, 0.40, 0.45, 0.50, 0.55, 0.60, 0.65 };
	double Y[11] = { 0.860708, 0.818731, 0.778801, 0.740818, 0.704688, 0.670320, 0.637628, 0.606531, 0.576950, 0.548812, 0.522046 }; 
	double t[4] = { 0.1535, 0.6247, 0.1317, 0.6672 };
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
 			 <<	"0,65     0,522046 " << endl;
	
	cout << "N(X) = " << fixed << setprecision(6) << newton(X, Y, t) << endl;
	//cout << (-82.0647873) * t*t*t*t*t + 240.8373045285334 * t * t * t * t - 292.282957064 * t * t * t +187.6966416139549 * t * t - 67.60908206759223 * t +12.7584368549594;
}

double newton(double *x, double *y, double *X) {
	double sum = 0;
	for (int i = 0; i < 4; i++) {
		double q = (X[i] - x[0]) / (0.05);
	}
	return sum;
}


