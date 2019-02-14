#include <math.h>
#include <stdlib.h>

struct Point3D {
	int x, y, z, w;
};

Point3D move_to_transform(Point3D point, int x, int y, int z) {
	Point3D res = point;
	res.x = x;
	res.y = y;
	res.z = z;
	return res;
}

Point3D scale_transform(Point3D point, double scale) {
	Point3D res = point;
	res.x *= scale;
	res.y *= scale;
	res.z *= scale;
	return res;
}

Point3D mirror_transform(Point3D point, int xsign, int ysign, int zsign) {
	Point3D res = point;
	res.x *= xsign;
	res.y *= ysign;
	res.z *= zsign;
	return res;
}

Point3D cavalier_projection(Point3D point) {
	Point3D res = point;
	res.x = point.x + point.z * 0.707;
	res.y = point.y + point.z * 0.707;
	return res;
}

void draw_polytope(Point3D* points, int n, int col) {
	for (int i = 0; i < n; ++i) {
		points[i] = scale_transform(points[i], 2.1);
		points[i] = move_to_transform(points[i], 10, -1, 2);
		points[i] = mirror_transform(points[i], -1, 1, 1);
	}

	for (int i = 0; i < n; ++i) {
		Point3D p1, p2;
		p1 = cavalier_projection(points[i]);
		p2 = cavalier_projection(points[(i + 1) % n]);
		line(p1.x, p1.y, p2.x, p2.y, col);
	}
}