#include <math.h>
#include <stdlib.h>

struct Point {
	int x, y, w;
};

Point scale_transform(Point point, double scale) {
	Point res = point;
	res.x *= scale;
	res.y *= scale;
	return res;
}

Point move_to_transform(Point point, int x, int y) {
	Point res = point;
	res.x = x;
	res.y = y;
	return res;
}

Point mirror_x_transform(Point point) {
	Point res = point;
	res.y *= -1;
	return res;
}

Point mirror_y_transform(Point point) {
	Point res = point;
	res.x *= -1;
	return res;
}

Point rotate_transform(Point point, double angle) {
	Point res = point;
	int x = point.x, y = point.y;
	res.x = x * cos(angle) - y * sin(angle);
	res.y = x * sin(angle) + y * cos(angle);
	return res;
}

void draw_polygone(Point* points, int n, int col) {
	for (int i = 0; i < n; ++i) {
		points[i] = move_to_transform(points[i], 100, 100);
		points[i] = scale_transform(points[i], 1.5);
		points[i] = mirror_y_transform(points[i]);
	}

	for (int i = 0; i < n; ++i) {
		line(points[i].x,           points[i].y, 
		     points[(i + 1) % n].x, points[(i + 1) % n].y, col);
	}
}