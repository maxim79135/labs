#include <math.h>
#include <stdlib.h>

void fill_polygone(int xz, int yz, int colk, int colz) {
	int color = getpixel(xz, yz);
	if (color != colk && color != colz) {
		putpixel(xz, yz, colz);
	}
	else {
		return;
	}

	fill_polygone(xz + 1, yz, colk, colz);
	fill_polygone(xz - 1, yz, colk, colz);
	fill_polygone(xz, yz + 1, colk, colz);
	fill_polygone(xz, yz - 1, colk, colz);
}