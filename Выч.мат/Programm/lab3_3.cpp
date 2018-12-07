#include <iostream>
#include <iomanip>
#include <algorithm>
#include <cmath>

using namespace std;

const int n = 10;
const int basis = 2;

int det_matrix(int (&a)[3][3]) {
	return a[0][0] * (a[1][1] * a[2][2] - a[2][1] * a[1][2]) - a[0][1] * (a[1][0] * a[2][2] - a[2][0] * a[1][2]) + a[0][2] * (a[1][0] * a[2][1] - a[2][0] * a[1][1]);
}


int main(int argc, char const *argv[])
{
	int X[n] = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 };
	int Y[n] = { 95, 116, 139, 163, 190, 219, 250, 283, 319, 355};

	cout << "RMS approximation of the function with OLS:" << endl
			 << "10 95" << endl
			 << "11 116" << endl
			 << "12 139" << endl
			 << "13 163" << endl
			 << "14 190" << endl
			 << "15 219" << endl
			 << "16 250" << endl
			 << "17 283" << endl
			 << "18 319" << endl
			 << "19 355 \n\n";

	int matrix[11][7];
	for (int i = 0; i < n; i++) {
		matrix[i][0] = X[i];
		//cout << Y[i] << endl;
		matrix[i][1] = Y[i];
		matrix[i][2] = X[i] * X[i];
		matrix[i][3] = X[i] * X[i] * X[i];
		matrix[i][4] = X[i] * X[i] * X[i] * X[i];
		matrix[i][5] = X[i] * Y[i];
		matrix[i][6] = X[i] * X[i] * Y[i];
	}
	for (int i = 0; i < 7; i++) matrix[10][i] = 0;
	for (int i = 0; i < 7; i++) {
		for (int j = 0; j < n; j++) {
			matrix[10][i] += matrix[j][i]; 
		} 
	}
	//cout << matrix[0][1] << endl;
	cout << setw(10) << "x" << setw(10) << "y" << setw(10) << "x^2" 
			 << setw(10) << "x^3" << setw(10) << "x^4" << setw(10) << "x*y" << setw(10) << "x*y^2" << endl;
	for (int i = 0; i < 11; i++) {
		for (int j = 0; j < 7; j++)
			cout << setw(9) << matrix[i][j] << " ";
		cout << endl;
	}
	int temp1[3][3] = {{matrix[10][2], matrix[10][0], n}, 
										 {matrix[10][3], matrix[10][2], matrix[10][0]}, 
										 {matrix[10][4], matrix[10][3], matrix[10][2]}
										};

	int temp2[3][3] = {{matrix[10][1], matrix[10][0], n}, 
										 {matrix[10][5], matrix[10][2], matrix[10][0]}, 
										 {matrix[10][6], matrix[10][3], matrix[10][2]}
										};

	int temp3[3][3] = {{matrix[10][2], matrix[10][1], n}, 
										 {matrix[10][3], matrix[10][5], matrix[10][0]}, 
										 {matrix[10][4], matrix[10][6], matrix[10][2]}
										};

	
	int temp4[3][3] = {{matrix[10][2], matrix[10][0], matrix[10][1]}, 
										 {matrix[10][3], matrix[10][2], matrix[10][5]}, 
										 {matrix[10][4], matrix[10][3], matrix[10][6]}
										};

	double a, b, c;
	a = double(det_matrix(temp2))/det_matrix(temp1);
	b = double(det_matrix(temp3))/det_matrix(temp1);
	c = double(det_matrix(temp4))/det_matrix(temp1);

	cout << endl << "y = " << a << "x^2 " << b << "x " << c << endl << endl;

	double deviation;
	for (int i = 0; i < n; i++) {
		cout << "x = " << X[i] << setw(7) << " y = " << matrix[i][1] << setw(10) << " y' = " << a * X[i] * X[i] + b * X[i] + c << endl;
		deviation += pow(matrix[i][1] - (a * X[i] * X[i] + b * X[i] + c), 2);
	}
	cout << "Standard deviation: " << sqrt(deviation / n); 
	return 0;
}