#include <math.h>
#include <stdlib.h>

struct Point {
	int x, y;
};

void copy(Point* src, Point* dest, int n) {
	for (int i = 0; i < n; ++i) {
		dest[i] = src[i];
	}
}

void draw_spline(Point* points, int n, double step) {
	Point[n] R, P;
	copy(points, R, n);
	copy(points, P, n);
	int m = n;
	double t = 0;
	Point current_point = { P[0].x, P[0].y };
	putpixel(current_point.x, current_point.y, c);
	while (t < 1) {
		copy(P, R, n);
		for (int j = m; j > 1; --j) {
			for (int i = 0; i < j - 1; ++i) {
				R[i].x += round(t * (R[i + 1].x - R[i].x));
				R[i].y += round(t * (R[i + 1].y - R[i].y));
			}
		}

		t += step;
		current_point.x = R[0].x;
		current_point.y = R[0].y;
		putpixel(current_point.x, current_point.y, c);
	}
}