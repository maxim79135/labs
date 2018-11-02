#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

double f1(double x, double y) {
	return sin(x) - y - 1.32;
}

double f2(double x, double y) {
	return cos(y) - x + 0.85;
}

double f1_x(double x, double y) {
	return cos(x);
}

double f1_y(double x, double y) {
	return -1;
}

double f2_x(double x, double y) {
	return -1;
}

double f2_y(double x, double y) {
	return -sin(y);
}


int main() {
	cout << "Solving a second-order linear equation system by the Newton method" << endl;
	double e = 0.001;
	cout << "System: " << endl
			 << "sin(x)-y-1,32=0" << endl
			 << "cos(y)-x+0,85=0" << endl;
	cout << "Matrix W is: " << endl
			 << "| f1'x | f1'y |" << endl
			 << "| f2'x | f2'y |" << endl;

	double x, y, W[2][2], dx, dy, norm;
	cout << "Enter begining x and y: ";
	cin >> x >> y;
	do {
		W[0][0] = f2_y(x, y);
		W[0][1] = -f1_y(x, y);
		W[1][0] = -f2_x(x, y);
		W[1][1] = f1_x(x, y);
		cout << "Transparent matrix W: " << endl;
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < 2; j++)
				cout << setw(6) << fixed << setprecision(3) << W[i][j] << " | ";
			cout << endl;
		}
		double det = W[0][0] * W[1][1] - W[0][1] * W[1][0];
		dx = (W[0][0] * f1(x, y) + W[0][1] * f2(x, y)) / det; 
		dy = (W[1][0] * f1(x, y) + W[1][1] * f2(x, y)) / det;
		double px = x, py = y;
		x -= dx;
		y -= dy;
		cout << "x = " << x << " | y = " << y << " |" << "\n\n"; 
		norm = max((px - x) * (px - x), (py - y) * (py - y));
	} while (norm >= e);

	cout << "x = " << x << " | y = " << y << " |";
}