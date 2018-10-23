#include <iostream>
#include <algorithm>
#include <cmath>

using namespace std;

int main() {
	int n, m;
	cin >> n >> m;
	int a[100][100];
	
	for (int i = 0; i < n; i++)
		for (int j = 0; j < m ; j++)
			cin >> a[i][j];

	for (int j = 0; j < m - 1; j++)
		for (int k = j + 1; k < m ; k++)
			for (int i = 0; i < n; i++) {
				if (a[i][j] != a[i][k]) break;
				cout << "Yes";
				return 0;
			}
	cout << "No";
}