#include <iostream>
#include <iomanip>
#include <algorithm>

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
		matrix[i][1] = Y[i];
		matrix[i][2] = X[i] * X[i];
		matrix[i][3] = X[i] * X[i] * X[i];
		matrix[i][4] = X[i] * X[i] * X[i] * X[i];
		matrix[i][5] = X[i] * Y[i];
		matrix[i][6] = X[i] * X[i] * Y[i];
	}
	matrix[11][0] = matrix[11][1] = matrix[11][2] = matrix[11][3] = matrix[11][4] = matrix[11][5] = matrix[11][6]= 0;
	for (int i = 0; i < 7; i++) {
		for (int j = 0; j < n; j++) {
			matrix[11][i] += matrix[j][i]; 
		} 
	}

	int temp1[3][3] = {{matrix[11][2], matrix[11][0], n}, 
										 {matrix[11][3], matrix[11][2], matrix[11][0]}, 
										 {matrix[11][4], matrix[11][3], matrix[11][2]}
										};

	int temp2[3][3] = {{matrix[11][1], matrix[11][0], n}, 
										 {matrix[11][5], matrix[11][2], matrix[11][0]}, 
										 {matrix[11][6], matrix[11][3], matrix[11][2]}
										};

	int temp3[3][3] = {{matrix[11][2], matrix[11][1], n}, 
										 {matrix[11][3], matrix[11][5], matrix[11][0]}, 
										 {matrix[11][4], matrix[11][6], matrix[11][2]}
										};

	
	int temp4[3][3] = {{matrix[11][2], matrix[11][0], matrix[11][1]}, 
										 {matrix[11][3], matrix[11][2], matrix[11][5]}, 
										 {matrix[11][4], matrix[11][3], matrix[11][6]}
										};

	double a, b, c;
	a = double(det_matrix(temp2))/det_matrix(temp1);
	b = double(det_matrix(temp3))/det_matrix(temp1);
	c = double(det_matrix(temp4))/det_matrix(temp1);

	cout << "y = " << a << "x^2 " << b << "x " << c; 
	return 0;
}
