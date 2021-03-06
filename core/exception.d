/*
 * exception.d
 *
 * This module defines common exceptions.
 *
 * Author: Dave Wilkinson
 * Originated: August 20th, 2009
 *
 */

module core.exception;

import core.string;
import core.definitions;
/*
class Exception {
	this(string msg, string file = "", ulong line = 0) {
		_msg = msg.dup;
		_file = file.dup;
		_line = line;
	}

	string name() {
		return this.classinfo.name.dup;
	}

	string message() {
		return _msg.dup;
	}

	string file() {
		return _file;
	}

	ulong line() {
		return _line;
	}

	string toString() {
		return this.name() ~ " caught at " ~ _file ~ "@" ~ toStr(_line) ~ ": " ~ _msg;
	}

private:
	char[] _msg;
	char[] _file;
	ulong _line;
}
*/

// Exceptions for IO
abstract class IOException : Exception {
	this(string msg) {
		super(msg);
	}

static:

	class CreationFailure : IOException {
		this(string filename) {
			super(filename ~ " could not be created.");
		}
	}

	class ExistenceFailure : IOException {
		this(string filename) {
			super(filename ~ " not found.");
		}
	}

	class PermissionFailure : IOException {
		this(string filename) {
			super(filename ~ " has the wrong permissions for the operation.");
		}
	}
}

// Exceptions for data structures
abstract class DataException : Exception {
	this(string msg) {
		super(msg);
	}

static:

	class OutOfElements : DataException {
		this(string objectName) {
			super("Out of items in " ~ objectName);
		}
	}

	class OutOfBounds : DataException {
		this(string objectName) {
			super("Index out of bounds in " ~ objectName);
		}
	}

	class ElementNotFound : DataException {
		this(string objectName) {
			super("Element does not exist in " ~ objectName);
		}
	}
}

abstract class MemoryException : Exception {
	this(string msg) {
		super(msg);
	}

static:
	class OutOfMemory : MemoryException {
		this() {
			super("Out of memory");
		}
	}
}
