#include <math.h>
#include <stdlib.h>

void draw_circle(int x, int y, int r, int c) {
	int x0 = x, 
		y0 = y;
	x = 0;
	y = r;
	int e = 3 - 2 * r;
	/* e(x, y) = 2x^2 + 2y^2 + 4x - 2y + 3 - 2r^2 */

	while (x <= y) {
		putpixel(x0 + x, y0 + y, c);
		putpixel(x0 + y, y0 + x, c);
		putpixel(x0 + y, y0 - x, c);
		putpixel(x0 + x, y0 - y, c);
		putpixel(x0 - x, y0 - y, c);
		putpixel(x0 - y, y0 - x, c);
		putpixel(x0 - y, y0 + x, c);
		putpixel(x0 - x, y0 + y, c);

		if (e >= 0) {
			e += 4 * (x - y) + 10;
			y -= 1;
		}
		else {
			e += 4 * x + 6;
		}

		x += 1;
	}
}