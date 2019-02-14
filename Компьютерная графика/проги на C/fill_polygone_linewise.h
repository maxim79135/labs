#include <math.h>
#include <stdlib.h>

struct Point {
	int x, y;
};

void fill_polygone_linewise(Point* points, int n, int colz, int colk) {
	for (int i = 0; i < n; ++i) {
		line(points[i].x, points[i].y, points[(i + 1) % n].x, points[(i + 1) % n].y, colk);
	}

	int x_min = 1000000, x_max = -1, y_min = 1000000, y_max = -1;

	for (int i = 0; i < n; ++i) {
		x_min = min(x_min, points[i].x);
		x_max = max(x_max, points[i].x);
		y_min = min(y_min, points[i].y);
		y_max = max(y_max, points[i].y);
	}

	for (int y = y_min; y <= y_max; ++y) {
		int x1 = x_min;
		while (x1 <= x_max && getpixel(x1, y) != colk) {
			++x1;
		}
		++x1;
		int x2 = x1;
		while (x2 <= x_max && getpixel(x2, y) != colk) {
			++x2;
		}
		if (getpixel(x2, y) == colk) {
			--x2;
			line(x1, y, x2, y, colz);
		}
	}
}