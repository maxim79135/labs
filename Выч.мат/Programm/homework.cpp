#include <iostream>
#include <cmath>
using namespace std;

double F(double x, double y){
        return 3*sin(2*y)+x;
}

int main() {
        double a=0; double b=1; double h=0.1;
        double n=(b-a)/h;
        double X[(int)n];
        double Y1[(int)n];
        double Y2[(int)n];
        double Y3[(int)n];
        double Y4[(int)n];
        double Y[(int)n];
        //calculate
        X[0]=a; Y[0]=2;
        for(int i=1; i<=n; i++){
                X[i]=a+i*h;
                Y1[i]=h*F(X[i-1],Y[i-1]);
                Y2[i]=h*F(X[i-1]+h/2.0,Y[i-1]+Y1[i]/2.0);
                Y3[i]=h*F(X[i-1]+h/2,Y[i-1]+Y2[i]/2);
                Y4[i]=h*F(X[i-1]+h,Y[i-1]+Y3[i]);
                Y[i]=Y[i-1]+(Y1[i]+2*Y2[i]+2*Y3[i]+Y4[i])/6;
        }
        //print results
        for(int i=0; i<=n; i++){
                cout << "X["<<i<<"]="<<X[i] <<" ";
        }
        cout << endl;
        for(int i=0; i<=n; i++){
                cout << "Y["<<i<<"]="<<Y[i] << " ";
        }
        return 0;
}
