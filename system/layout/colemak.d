/*
 * colemak.d
 *
 * This module implements the colemak keyboard layout.
 *
 */

module system.layout.colemak;

import system.layout.keyboardtranslator;

import core.definitions;

class ColemakTranslator : KeyboardTranslator {
	// This array will translate the scan code to the base key
	static int _translateScancode[] = [
		// 0x00
		Key.Invalid,
		Key.F9,
		Key.Invalid,
		Key.F5,
		Key.F3,
		Key.F1,
		Key.F2,
		Key.F12,
		Key.F17,
		Key.F10,
		Key.F8,
		Key.F6,
		Key.F4,
		Key.Tab,
		Key.SingleQuote,
		Key.Invalid,
		// 0x10
		Key.F18,
		Key.LeftAlt,
		Key.LeftShift,
		Key.Invalid,
		Key.LeftControl,
		Key.Q,
		Key.One,
		Key.Invalid,
		Key.F19,
		Key.Invalid,
		Key.Z,
		Key.R,
		Key.A,
		Key.W,
		Key.Two,
		Key.F13,
		// 0x20
		Key.F20,
		Key.C,
		Key.X,
		Key.S,
		Key.F,
		Key.Four,
		Key.Three,
		Key.F14,
		Key.F21,
		Key.Space,
		Key.V,
		Key.T,
		Key.G,
		Key.P,
		Key.Five,
		Key.F15,
		// 0x30
		Key.F22,
		Key.K,
		Key.B,
		Key.H,
		Key.D,
		Key.J,
		Key.Six,
		Key.Invalid,
		Key.F23,
		Key.Invalid,
		Key.M,
		Key.N,
		Key.L,
		Key.Seven,
		Key.Eight,
		Key.Invalid,
		// 0x40
		Key.F24,
		Key.Comma,
		Key.E,
		Key.U,
		Key.Y,
		Key.Zero,
		Key.Nine,
		Key.Invalid,
		Key.Invalid,
		Key.Period,
		Key.Foreslash,
		Key.I,
		Key.O,
		Key.Semicolon,
		Key.Minus,
		Key.Invalid,
		// 0x50
		Key.Invalid,
		Key.Invalid,
		Key.Quote,
		Key.Invalid,
		Key.LeftBracket,
		Key.Equals,
		Key.Invalid,
		Key.Invalid,
		Key.CapsLock,
		Key.RightShift,
		Key.Return,
		Key.RightBracket,
		Key.Invalid,
		Key.Backslash,
		Key.F16,
		Key.Invalid,
		// 0x60
		Key.Invalid,
		Key.Invalid,
		Key.Invalid,
		Key.Invalid,
		Key.Invalid,
		Key.Invalid,
		Key.Backspace,
		Key.Invalid,
		Key.Invalid,
		Key.KeypadOne,
		Key.Invalid,
		Key.Left,
		Key.KeypadSeven,
		Key.Invalid,
		Key.Invalid,
		Key.Invalid,
		// 0x70
		Key.KeypadZero,
		Key.KeypadPeriod,
		Key.KeypadTwo,
		Key.KeypadFive,
		Key.KeypadSix,
		Key.KeypadEight,
		Key.Escape,
		Key.NumLock,
		Key.F11,
		Key.KeypadPlus,
		Key.KeypadThree,
		Key.KeypadMinus,
		Key.KeypadAsterisk,
		Key.KeypadNine,
		Key.ScrollLock,
		Key.Invalid,
		// 0x80
		Key.Invalid,
		Key.Invalid,
		Key.Invalid,
		Key.Invalid,
		Key.SysRq,
	];

	static int _translateScancodeEx[] = [
		0x1f: Key.LeftGui,
		0x14: Key.RightControl,
		0x27: Key.RightGui,
		0x11: Key.RightAlt,
		0x2f: Key.Application,
		0x7c: Key.PrintScreen,
		0x70: Key.Insert,
		0x6c: Key.Home,
		0x7d: Key.PageUp,
		0x71: Key.Delete,
		0x69: Key.End,
		0x7a: Key.PageDown,
		0x75: Key.Up,
		0x6b: Key.Left,
		0x72: Key.Down,
		0x74: Key.Right,
		0x4a: Key.KeypadForeslash,
		0x5a: Key.KeypadReturn
	];

	override Key translate(Key key) {

		if (key.scan == 0xe11477) {
			key.code = Key.Pause;
		}
		else if (key.scan < _translateScancode.length) {
			key.code = _translateScancode[key.scan];
		}
		else if (key.scan > 0xe000) {
			key.code = _translateScancodeEx[key.scan & 0xff];
		}

		key.printable = '\0';
		if (key.shift) {
			switch(key.code) {
				case Key.SingleQuote:
					key.code = Key.Tilde;
					key.printable = '~';
					break;
				case Key.One:
					key.code = Key.Bang;
					key.printable = '!';
					break;
				case Key.Two:
					key.code = Key.At;
					key.printable = '@';
					break;
				case Key.Three:
					key.code = Key.Pound;
					key.printable = '#';
					break;
				case Key.Four:
					key.code = Key.Dollar;
					key.printable = '$';
					break;
				case Key.Five:
					key.code = Key.Percent;
					key.printable = '%';
					break;
				case Key.Six:
					key.code = Key.Caret;
					key.printable = '^';
					break;
				case Key.Seven:
					key.code = Key.Ampersand;
					key.printable = '&';
					break;
				case Key.Eight:
					key.code = Key.Asterisk;
					key.printable = '*';
					break;
				case Key.Nine:
					key.code = Key.LeftParenthesis;
					key.printable = '(';
					break;
				case Key.Zero:
					key.code = Key.RightParenthesis;
					key.printable = ')';
					break;
				case Key.Minus:
					key.code = Key.Underscore;
					key.printable = '_';
					break;
				case Key.Equals:
					key.code = Key.Plus;
					key.printable = '+';
					break;
				case Key.LeftBracket:
					key.code = Key.LeftCurly;
					key.printable = '{';
					break;
				case Key.RightBracket:
					key.code = Key.RightCurly;
					key.printable = '}';
					break;
				case Key.Semicolon:
					key.code = Key.Colon;
					key.printable = ':';
					break;
				case Key.Quote:
					key.code = Key.DoubleQuote;
					key.printable = '"';
					break;
				case Key.Comma:
					key.code = Key.LeftAngle;
					key.printable = '<';
					break;
				case Key.Period:
					key.code = Key.RightAngle;
					key.printable = '>';
					break;
				case Key.Backslash:
					key.code = Key.Pipe;
					key.printable = '|';
					break;
				case Key.Foreslash:
					key.code = Key.QuestionMark;
					key.printable = '?';
					break;
				case Key.A, Key.B, Key.C, Key.D, Key.E, Key.F, Key.G, Key.H,
				  Key.I, Key.J, Key.K, Key.L, Key.M, Key.N, Key.O, Key.P, Key.Q,
				  Key.R, Key.S, Key.T, Key.U, Key.V, Key.W, Key.X, Key.Y, Key.Z:
					key.printable = 'A' + (key.code - Key.A);
					break;
				default:
					break;
			}
		}

		if (key.alt || key.ctrl) {
			key.printable = '\0';
		}
		else if (!key.shift) {
			switch(key.code) {
				case Key.SingleQuote:
					key.printable = '`';
					break;
				case Key.One:
					key.printable = '1';
					break;
				case Key.Two:
					key.printable = '2';
					break;
				case Key.Three:
					key.printable = '3';
					break;
				case Key.Four:
					key.printable = '4';
					break;
				case Key.Five:
					key.printable = '5';
					break;
				case Key.Six:
					key.printable = '6';
					break;
				case Key.Seven:
					key.printable = '7';
					break;
				case Key.Eight:
					key.printable = '8';
					break;
				case Key.Nine:
					key.printable = '9';
					break;
				case Key.Zero:
					key.printable = '0';
					break;
				case Key.Minus:
					key.printable = '-';
					break;
				case Key.Equals:
					key.printable = '=';
					break;
				case Key.LeftBracket:
					key.printable = '[';
					break;
				case Key.RightBracket:
					key.printable = ']';
					break;
				case Key.Semicolon:
					key.printable = ';';
					break;
				case Key.Quote:
					key.printable = '\'';
					break;
				case Key.Comma:
					key.printable = ',';
					break;
				case Key.Period:
					key.printable = '.';
					break;
				case Key.Backslash:
					key.printable = '\\';
					break;
				case Key.Foreslash:
					key.printable = '/';
					break;
				case Key.A, Key.B, Key.C, Key.D, Key.E, Key.F, Key.G, Key.H,
				  Key.I, Key.J, Key.K, Key.L, Key.M, Key.N, Key.O, Key.P, Key.Q,
				  Key.R, Key.S, Key.T, Key.U, Key.V, Key.W, Key.X, Key.Y, Key.Z:
					key.printable = 'a' + (key.code - Key.A);
					break;
				default:
					break;
			}
		}

		return key;
	}
}