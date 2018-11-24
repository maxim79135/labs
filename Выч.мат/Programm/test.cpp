#include <iostream>

using namespace std;

int main(int argc, char const *argv[])
{
	int n;
	cin >> n;
	int *a = new int[n];

	for (int i = 0; i < n; i++) cin >> a[i];
	for (int i = 0; i < n; i++) {
		int p = 1;
		for (int j = 0; j <= i; j++) p *= a[j];
		cout << "a1 .. " << "a" << i << " " << p << endl;
	}
	return 0;
}
