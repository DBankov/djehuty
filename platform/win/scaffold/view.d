/*
 * view.d
 *
 * This file implements the Scaffold for platform specific View
 * operations in Windows.
 *
 * Author: Dave Wilkinson
 *
 */

module scaffold.view;

import platform.win.common;
import platform.win.main;

import platform.vars.view;
import platform.vars.window;

import gui.window;

import graphics.view;
import graphics.graphics;
import graphics.bitmap;

import core.string;
import core.main;
import core.definitions;

import utils.linkedlist;


// views
void ViewCreate(View view, ViewPlatformVars*viewVars) {
	HDC dc;

	dc = GetDC(null);

	viewVars.clipRegions = new _clipList();

	viewVars.dc = CreateCompatibleDC(dc);

	HBITMAP bmp = CreateCompatibleBitmap(dc, view.width(), view.height());

	ReleaseDC(null, dc);

	SelectObject(viewVars.dc, bmp);

	DeleteObject(bmp);
}

void ViewDestroy(ref View view, ViewPlatformVars*viewVars) {
	DeleteDC(viewVars.dc);
}

void ViewCreateDIB(ref Bitmap view, ViewPlatformVars*viewVars) {
	HDC dc;

	dc = GetDC(null);

	viewVars.clipRegions = new _clipList();

	viewVars.dc = CreateCompatibleDC(dc);

	BITMAPINFO bi;

	bi.bmiHeader.biSize = BITMAPINFOHEADER.sizeof;
	bi.bmiHeader.biWidth = view.width();
	bi.bmiHeader.biHeight = -view.height();
	bi.bmiHeader.biPlanes = 1;
	bi.bmiHeader.biBitCount = 32;

	//HBITMAP bmp = CreateCompatibleBitmap(dc, _width, _height);
	HBITMAP bmp = CreateDIBSection(dc, &bi, DIB_RGB_COLORS, &viewVars.bits, null, 0);

	viewVars.length = (view.width() * view.height()) * 4;

	ReleaseDC(null, dc);

	SelectObject(viewVars.dc, bmp);

	DeleteObject(bmp);
}

void ViewCreateForWindow(ref WindowView view, ViewPlatformVars*viewVars, ref Window window, WindowPlatformVars* windowVars) {
	//will set _inited to true:
	ViewCreate(view, viewVars);
}

void ViewResizeForWindow(ref WindowView view, ViewPlatformVars*viewVars, ref Window window, WindowPlatformVars* windowVars) {
}

void ViewResize(ref View view, ViewPlatformVars*viewVars) {
	HDC dc;

	dc = GetDC(null);

	HBITMAP bmp;

	if (cast(Bitmap)view !is null) {

		BITMAPINFO bi;

		bi.bmiHeader.biSize = BITMAPINFOHEADER.sizeof;
		bi.bmiHeader.biWidth = view.width();
		bi.bmiHeader.biHeight = -view.height();
		bi.bmiHeader.biPlanes = 1;
		bi.bmiHeader.biBitCount = 32;

		bmp = CreateDIBSection(dc, &bi, DIB_RGB_COLORS, &viewVars.bits, null, 0);
	}
	else {
		bmp = CreateCompatibleBitmap(dc, view.width(), view.height());
	}

	ReleaseDC(null, dc);

	SelectObject(viewVars.dc, bmp);

	DeleteObject(bmp);
}

void* ViewGetBytes(ViewPlatformVars*viewVars, ref ulong length) {
	length = viewVars.length;
	return viewVars.bits;
}

void* ViewGetBytes(ViewPlatformVars*viewVars) {
	return viewVars.bits;
}

uint ViewRGBAToInt32(ref bool _forcenopremultiply, ViewPlatformVars*_pfvars, ref uint r, ref uint g, ref uint b, ref uint a) {
	if (!_forcenopremultiply) {
		float anew = a;
		anew /= cast(float)0xFF;

		r = cast(ubyte)(anew * cast(float)r);
		g = cast(ubyte)(anew * cast(float)g);
		b = cast(ubyte)(anew * cast(float)b);
	}
	return (r << 16) | (g << 8) | (b) | (a << 24);
}

uint ViewRGBAToInt32(ViewPlatformVars*_pfvars, ref uint r, ref uint g, ref uint b) {
	return (r << 16) | (g << 8) | (b) | 0xFF000000;
}