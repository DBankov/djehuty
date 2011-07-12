module platform.application;

class ApplicationController {
private:

	bool _usingCurses;
	uint _exitCode;
	static ApplicationController _app;
	
public:
	this() {
	}

	void exitCode(uint value) {
		_exitCode = value;
	}

	uint exitCode() {
		return _exitCode;
	}

	void start() {
	}

	void end() {
//		exit(_exitCode);
	}

	static ApplicationController instance() {
		if (_app is null) {
			_app = new ApplicationController();
		}
		return _app;
	}
}
