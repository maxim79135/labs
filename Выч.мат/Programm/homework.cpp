#include <iostream>
#include <algorithm>
#include <numeric>
#include <stdlib.h>
#include <time.h>

using namespace std;

int main() {
	srand(time(NULL));
	int s = 0;
	int n;
	cin >> n;
	int a[1000], b[1000];
	char symbol;
	cin >> symbol;
	while (symbol == 's') {
		for (int i = 0; i < n; i++) b[i] = rand() % 20;
		for (int i = 0; i < n; i++) cout << b[i] << " ";
		cout << endl;
		cin >> symbol;
	}	
}