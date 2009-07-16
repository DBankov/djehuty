module tui.label;

import core.string;
import core.main;
import core.definitions;

import io.console;

import tui.widget;

// Section: Console

// Description: This console control abstracts a simple static text field.
class TuiLabel : TuiWidget {

	this( uint x, uint y, uint width, String text,
		  fgColor fgclr = fgColor.BrightBlue,
		  bgColor bgclr = bgColor.Black ) {
		super(x,y,width,1);

		_forecolor = fgclr;
		_backcolor = bgclr;

		_value = new String(text);
	}

	this( uint x, uint y, uint width, string text,
		  fgColor fgclr = fgColor.BrightBlue,
		  bgColor bgclr = bgColor.Black ) {
		super(x,y,width,1);

		_forecolor = fgclr;
		_backcolor = bgclr;

		_value = new String(text);
	}

	override void onAdd() {
	}

	override void onInit() {
		draw();
	}

	void text(String newValue) {
		_value = new String(newValue);
		draw();
	}

	void text(string newValue) {
		_value = new String(newValue);
		draw();
	}

	String text() {
		return new String(_value);
	}

	void forecolor(fgColor fgclr) {
		_forecolor = fgclr;
		draw();
	}

	fgColor forecolor() {
		return _forecolor;
	}

	void backcolor(bgColor bgclr) {
		_backcolor = bgclr;
		draw();
	}

	bgColor backcolor() {
		return _backcolor;
	}

protected:

	void draw() {
		if (canDraw) {
			Console.setPosition(this.left, this.top);
			Console.setColor(_forecolor, _backcolor);

			// draw as much as we can

			if (_value.length > width) {
				Console.put((new String(_value[0..width])));
			}
			else {
				Console.put(_value);
			}
		}
	}

private:

	fgColor _forecolor = fgColor.BrightBlue;
	bgColor _backcolor = bgColor.Black;

	String _value;
}