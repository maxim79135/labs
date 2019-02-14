#include <math.h>
#include <stdlib.h>

struct Point {
	int x, y;
};

unsigned mask(Point tl, Point br, Point p) {
	unsigned m = 0;
	if (p.x < tl.x) {
		m |= 0x1;
	}
	if (p.x > br.x) {
		m |= 0x2;
	}
	if (p.y < tl.y) {
		m |= 0x8;
	}
	if (p.y > br.y) {
		m |= 0x4;
	}
	return m;
}

void cohen_sutherland(Point o1, Point o2, Point r1, Point r2, col) {
	int x1 = o1.x, y1 = o1.y,
		x2 = o2.x, y2 = o2.y;
		
	unsigned p1, p2;
	p1 = mask(r1, r2, o1);
	p2 = mask(r1, r2, o2);
	do {
		if (p1 == 0 && p2 == 0) {
			line(x1, y1, x2, y2, col);
			break;
		}
		else {
			if (p1 == 0) {
				swap(&x1, &x2);
				swap(&y1, &y2);
				swap(&p1, &p2);
			}

			// left
			if (x1 < r1.x) {
				y1 = (int) y1 + 1.0 * (y2 - y1) * (r1.x - x1) / (x2 - x1);
				x1 = r1.x;
			}
			//top
			else if (y1 < r1.y) {
				x1 = (int) x1 + 1.0 * (x2 - x1) * (r1.y - y1) / (y2 - y1);
				y1 = r1.y;
			}
			//right
			else if (x1 > r2.x) {
				y1 = (int) y1 + 1.0 * (y2 - y1) * (r2.x - x1) / (x2 - x1);
				x1 = r2.x;
			}
			//bottom
			else if (y1 > r2.y) {
				x1 = (int) x1 + 1.0 * (x2 - x1) * (r2.y - y1) / (y2 - y1);
				y1 = r2.y;
			}
		}
		p1 = mask(r1, r2, o1);
		p2 = mask(r1, r2, o2);
	} while (true);
}