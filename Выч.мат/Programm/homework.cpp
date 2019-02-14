#include <iostream> 
using namespace std; 

int main () 
{ 
 	int n; 
 	cin >> n;
	int a[n+1][n+1]; 
 	if (n % 4 == 0) {
		 for (int i = 0; i < n; i++) {
			 for (int j = 0; j < n; j++) {
				 if (i < n / 4 && j < n / 4 ||
				 		 i < n / 4 && j > n - n / 4 - 1 ||
						 i > n - n / 4 - 1 && j < n / 4 ||
						 i > n - n / 4 - 1 && j > n - n / 4 - 1 ||
						 i >= n / 4 && i < n - n / 4 && j < n - n / 4 && j >= n / 4 
						) a[i][j] = n * n + 1; else a[i][j] = 0;
			 }
		 }
		 for (int k = 0; k < n * n; k++) {
		   if (a[k / n][k % n] == n * n + 1) a[k / n][k % n] = k + 1;
			 if (a[k / n][k % n] == 0) a[k / n][k % n] = n * n - k;
		 }
	} else if (n % 2 == 1) {
		int m=n*n; 
		int i=0, j=n/2; 
		for (int k=1;k<=m;k++) { 
			a[i][j] = k;
			i--; 
			j++; 
			if (k % n == 0) { 
				i += 2; 
				j--; 
			} 
			else { 
				if (j==n){ 
					j=j-n; 
				} else 
				if (i < 0) { 
					i += n; 
				} 
			} 
		}
	}
 for(int i = 0; i < n; i++) { 
 	for(int j = 0; j < n; j++) { 
 		cout << a[i][j] << "\t"; 
 	} 
 cout << endl; 
 } 
 system("pause"); 
}