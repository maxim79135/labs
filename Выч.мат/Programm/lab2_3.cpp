#include <iostream>
#include <cmath>
#include <iomanip>

using namespace std;

int det_matrix(int (&a)[3][3]) {
	return a[0][0] * (a[1][1] * a[2][2] - a[2][1] * a[1][2]) - a[0][1] * (a[1][0] * a[2][2] - a[2][0] * a[1][2]) + a[0][2] * (a[1][0] * a[2][1] - a[2][0] * a[1][1]);
}

int _A(int i, int j, int (&a)[3][3]) {
	int a2[2][2];
	int count = 0;
	for (int k = 0; k < 3; k++)
		for (int l = 0; l < 3; l++)
			if (k != i && l != j) {
				a2[count / 2][count % 2] = a[k][l];
				count++;
			}
	return pow(-1, i + j) * (a2[0][0] * a2[1][1] - a2[0][1] * a2[1][0]);
}

int main() {
	cout << "Solving a third-order linear equation system inverse matrix method" << endl << "AX=B => X=A^(-1)*B" << endl;
	int n = 3;
	int A[3][3] = { {3, 2, 7},
									{-5, 4, 1},
									{1, -3, 2}
								};
	int B[3] = {0, 2, -7};
	double X[3];
	int det;
	int A_T[3][3];
	if (det_matrix(A) != 0) {
		det = det_matrix(A);
		cout << "Determinant " << det << endl << endl;
		for (int i = 0; i < 3; i++)
			for (int j = 0; j < 3; j++) {
				A_T[j][i] = _A(i, j, A);
		 		cout << "A" << i + 1 << "," << j + 1 << " = " << A_T[j][i] << endl;
			}
		cout << endl << "Transparent matrix: " << endl;
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++)
				cout << setw(3) << A_T[i][j] << " | ";
			cout << endl;
		}

		for (int i = 0; i < 3; i++) {
			int val = 0;
			for (int j = 0; j < 3; j++)
				val += A_T[i][j] * B[j];
			X[i] = 1 / double(det) * val;
		}
		
		cout << endl;
		for (int i = 0; i < 3; i++) cout << "x" << i + 1 << " = " << fixed << setprecision(3) << X[i] << " | ";
	} else cout << "The system has no solutions.";
}