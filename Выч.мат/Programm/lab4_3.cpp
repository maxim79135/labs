#include <iostream>
#include <iomanip>
#include <cmath>
#include <algorithm>

using namespace std;

double f(double x) {
	return x / sqrt(x * x + 2);
}

int main(int argc, char const *argv[])
{
		cout << "Formula by Gauss for numerical integral\n";
		cout << "f(x) = x/sqrt(x^2+2)\n";
		cout << "[0.8;2]\n";
		cout << "I = summ(i=0..n) Ai * phi(xi)\n";

		double a = 0.8, b = 2.0;
	
		cout << "n1=5; n2=8\n";
		cout << "\n1. 5-node\n";
		cout << "x1=-x5=-0,90618        A1=A5=0,23698" << endl << 
						"x2=-x4=-0,538469       A2=A4=0,47863" << endl << 
						"x3=0                   A3=0,56889\n";
		
		double x1[5] = {-0.90618, -0.538469, 0, 0.538469, 0.90618};
		double A1[5] = {0.23698, 0.47863, 0.56889, 0.47863, 0.23698};
		double summ = 0;
		for (int i = 0; i < 5; i++) {
			summ += A1[i] * (b - a) / 2 * f((a + b) / 2 + (b - a) / 2 * x1[i]);
		}

		cout << "I1 = " << summ;
		cout << endl << "\n2. 8-node\n";
		cout << "x1=-x8=-0,96028986     A1=A8=0,10122854" << endl <<
						"x2=-x7=-0,79666648     A2=A7=0,22238103" << endl <<
						"x3=-x6=-0,52553242     A3=A6=0,31370664" << endl << 
						"x4=-x5=-0,18343464     A4=A5=0,36268378\n";
		
		double x2[8] = {-0.96028986, -0.79666648, -0.52553242, -0.18343464, 0.18343464, 0.52553242, 0.79666648, 0.96028986};
		double A2[8] = {0.10122854, 0.22238103, 0.31370664, 0.36268378, 0.36268378, 0.31370664, 0.22238103, 0.10122854};
		summ = 0;
		for (int i = 0; i < 8; i++) {
			summ += A2[i] * (b - a) / 2 * f((a + b) / 2 + (b - a) / 2 * x2[i]);
		}
		cout << "I2 = " << summ;
		return 0;
}
