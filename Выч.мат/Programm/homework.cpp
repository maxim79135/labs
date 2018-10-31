#include <iostream>
#include <algorithm>
#include <numeric>

using namespace std;

int main() {
	int a[5] = {1, 2, 3, 4, 5};
	cout << accumulate(a, a + 5, 0);	
}