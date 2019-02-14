#include <math.h>
#include <stdlib.h>

int sign(int x) {
	return (x >= 0 ? 1 : -1);
}

void draw_line(int x1, int y1, int x2, int y2, int c) {
	int x = x1, 
		y = y1, 
		dx = abs(x2 - x1), 
		dy = abs(y2 - y1);

	int s1 = sign(x2 - x1), 
		s2 = sign(y2 - y1);

	bool f;
	if (dy > dx) {
		swap(&dx, &dy);
		f = true;
	}
	else {
		f = false;
	}

	int e = dy;
	for (int i = 1; i <= dx + dy; ++i) {
		putpixel(x, y, c);

		if (2 * e < dx) {
			(f ? y += s2 : x += s1);
			e += dy;
		}
		else {
			(f ? x += s1 : y += s2);
			e -= dx;
		}
	}
	putpixel(x, y, c);
}