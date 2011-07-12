
MY_ARCH := $(shell uname)

DC = ldc
OBJCC = gcc
DFLAGS =

# can be changed
PLATFORM = WINDOWS

LFLAGS_LINUX = -Iplatform/unix -Icompiler -L-lGL -L-lcairo -L-lpango-1.0 -L-lpangocairo-1.0 -L-llua5.1 -L-lncursesw -J./tests -I./runtime -nodefaultlib
LFLAGS_MAC = -lobjc -framework Cocoa -framework Foundation -framework OpenGL -lncurses -llua5.1 -Icompiler
LFLAGS_WIN = -Iplatform/win -Icompiler
LFLAGS_XOMB = -Iplatform/xomb -Icompiler -I./runtime -nodefaultlib -I../xomb

ifeq (${MY_ARCH},MINGW32_NT-5.1)
	OBJEXT = .obj
	PLATFORM = WINDOWS
else
ifeq (${MY_ARCH},MINGW32_NT-6.0)
	OBJEXT = .obj
	PLATFORM = WINDOWS
else
ifeq (${MY_ARCH},MINGW32_NT-6.1)
	OBJEXT = .obj
	PLATFORM = WINDOWS
else
	OBJEXT = .o
	PLATFORM = NIX
endif
endif
endif

DFILES_PLATFORM_MAC = platform/osx/platform/application.d platform/osx/scaffold/system.d platform/osx/scaffold/thread.d platform/osx/scaffold/time.d platform/osx/scaffold/console.d platform/osx/platform/definitions.d platform/osx/common.d platform/osx/main.d platform/osx/scaffold/opengl.d platform/osx/scaffold/graphics.d platform/osx/scaffold/file.d platform/osx/scaffold/socket.d platform/osx/scaffold/window.d platform/osx/scaffold/color.d platform/osx/scaffold/menu.d platform/osx/scaffold/wave.d platform/osx/scaffold/view.d platform/osx/scaffold/directory.d platform/osx/gui/apploop.d binding/c.d binding/ncurses/ncurses.d platform/osx/scaffold/cui.d platform/osx/platform/vars/cui.d platform/osx/platform/vars/file.d platform/unix/common.d platform/osx/platform/vars/thread.d platform/osx/platform/vars/directory.d platform/osx/platform/vars/view.d platform/osx/platform/vars/semaphore.d platform/osx/platform/vars/condition.d platform/osx/platform/vars/window.d
OBJC_FILES = platform/osx/objc/window.m platform/osx/objc/app.m platform/osx/objc/view.m

DFILES_PLATFORM_UNIX = platform/unix/platform/application.d platform/unix/scaffold/system.d platform/unix/scaffold/thread.d platform/unix/scaffold/time.d platform/unix/scaffold/console.d platform/unix/platform/definitions.d platform/unix/common.d binding/cairo/cairo.d binding/x/Xlib.d binding/x/X.d platform/unix/main.d platform/unix/scaffold/graphics.d platform/unix/scaffold/file.d platform/unix/scaffold/socket.d platform/unix/scaffold/color.d platform/unix/scaffold/menu.d platform/unix/scaffold/wave.d platform/unix/scaffold/view.d platform/unix/scaffold/directory.d binding/c.d binding/ncurses/ncurses.d platform/unix/scaffold/cui.d platform/unix/platform/vars/cui.d platform/unix/platform/vars/wave.d platform/unix/platform/vars/window.d platform/unix/platform/vars/menu.d platform/unix/platform/vars/view.d platform/unix/platform/vars/region.d platform/unix/platform/vars/brush.d platform/unix/platform/vars/pen.d platform/unix/platform/vars/font.d binding/pango/pango.d platform/unix/platform/vars/directory.d platform/unix/platform/vars/file.d platform/unix/platform/vars/thread.d platform/unix/platform/vars/mutex.d platform/unix/platform/vars/semaphore.d platform/unix/platform/vars/library.d platform/unix/platform/vars/socket.d platform/unix/platform/vars/condition.d binding/cairo/xlib.d binding/cairo/features.d binding/pango/font.d binding/pango/types.d binding/pango/context.d binding/pango/pbreak.d binding/pango/engine.d binding/pango/fontset.d binding/pango/coverage.d binding/pango/glyph.d binding/pango/matrix.d binding/pango/attributes.d binding/pango/layout.d binding/pango/cairo.d binding/pango/script.d binding/pango/gravity.d binding/pango/fontmap.d binding/pango/item.d binding/pango/tabs.d binding/pango/glyphitem.d compiler/ldc/vararg.d compiler/ldc/cstdarg.d
DFILES_PLATFORM_WIN = compiler/dmd/bullshit.d compiler/dmd/minit.d compiler/dmd/cstdarg.d compiler/dmd/eh.d compiler/dmd/invariant.d compiler/dmd/memset.d platform/win/platform/vars/thread.d binding/win32/gdipluscolormatrix.d binding/win32/gdiplusinit.d binding/win32/gdiplusmem.d binding/win32/gdiplusbase.d binding/win32/gdiplusflat.d binding/win32/gdiplusstringformat.d binding/win32/gdiplusmetafile.d binding/win32/gdipluslinecaps.d binding/win32/gdiplusimagecodec.d binding/win32/gdiplusgpstubs.d binding/win32/gdiplusfontfamily.d binding/win32/gdiplusfontcollection.d binding/win32/gdiplusfont.d binding/win32/gdiplusenums.d binding/win32/gdiplustypes.d binding/win32/gdiplusregion.d binding/win32/gdipluscolor.d binding/win32/gdiplusbitmap.d binding/win32/gdipluseffects.d binding/win32/gdipluscachedbitmap.d binding/win32/gdipluspath.d binding/win32/gdiplusbrush.d binding/win32/gdipluspen.d binding/win32/gdiplusgraphics.d binding/win32/ws2def.d binding/win32/winsock2.d binding/win32/inaddr.d binding/win32/mmsystem.d  binding/win32/wincon.d binding/win32/winbase.d binding/win32/winuser.d binding/win32/windef.d binding/win32/wingdi.d platform/win/platform/application.d platform/win/platform/vars/cui.d platform/win/scaffold/cui.d platform/win/scaffold/system.d platform/win/main.d platform/win/common.d platform/win/platform/vars/menu.d platform/win/platform/vars/view.d platform/win/platform/vars/semaphore.d platform/win/platform/vars/mutex.d platform/win/platform/vars/region.d platform/win/platform/vars/library.d platform/win/platform/vars/wave.d platform/win/platform/vars/pen.d platform/win/platform/vars/brush.d platform/win/platform/vars/window.d platform/win/platform/vars/file.d platform/win/platform/vars/directory.d platform/win/platform/vars/font.d platform/win/platform/vars/socket.d platform/win/scaffold/console.d platform/win/platform/definitions.d platform/win/scaffold/wave.d platform/win/scaffold/directory.d platform/win/scaffold/graphics.d platform/win/scaffold/thread.d platform/win/scaffold/menu.d platform/win/scaffold/color.d platform/win/scaffold/file.d platform/win/scaffold/socket.d platform/win/scaffold/time.d platform/win/scaffold/opengl.d platform/win/scaffold/view.d

DFILES_PLATFORM_XOMB = platform/xomb/platform/application.d platform/xomb/scaffold/system.d platform/xomb/scaffold/thread.d platform/xomb/scaffold/time.d platform/xomb/scaffold/console.d platform/xomb/platform/definitions.d platform/xomb/main.d platform/xomb/scaffold/graphics.d platform/xomb/scaffold/file.d platform/xomb/scaffold/socket.d platform/xomb/scaffold/color.d platform/xomb/scaffold/menu.d platform/xomb/scaffold/wave.d platform/xomb/scaffold/view.d platform/xomb/scaffold/directory.d platform/xomb/scaffold/cui.d platform/xomb/platform/vars/cui.d platform/xomb/platform/vars/wave.d platform/xomb/platform/vars/window.d platform/xomb/platform/vars/menu.d platform/xomb/platform/vars/view.d platform/xomb/platform/vars/region.d platform/xomb/platform/vars/brush.d platform/xomb/platform/vars/pen.d platform/xomb/platform/vars/font.d platform/xomb/platform/vars/directory.d platform/xomb/platform/vars/file.d platform/xomb/platform/vars/thread.d platform/xomb/platform/vars/mutex.d platform/xomb/platform/vars/semaphore.d platform/xomb/platform/vars/library.d platform/xomb/platform/vars/socket.d platform/xomb/platform/vars/condition.d compiler/ldc/vararg.d compiler/ldc/cstdarg.d platform/xomb/common.d

DFILES_ANALYZING = analyzing/debugger.d
DFILES_LOCALES = locales/en_us.d locales/fr_fr.d locales/all.d
DFILES_CORE = core/date.d core/locale.d core/variant.d core/exception.d core/signal.d core/library.d core/system.d core/regex.d core/arguments.d core/definitions.d core/application.d core/time.d core/timezone.d core/unicode.d core/endian.d core/stream.d core/string.d core/main.d core/color.d core/error.d core/util.d
DFILES_GUI = gui/window.d
DFILES_DATA = data/stack.d data/queue.d data/queue2.d data/fibonacci.d data/heap.d data/list.d data/iterable.d
DFILES_RUNTIME = runtime/dstatic.d runtime/switchstmt.d runtime/monitor.d runtime/array.d runtime/apply.d runtime/lifetime.d runtime/gc.d runtime/exception.d runtime/object.d runtime/typeinfo.d runtime/moduleinfo.d runtime/assocarray.d runtime/classinvariant.d runtime/error.d runtime/typeinfos/ti_array.d runtime/typeinfos/ti_array_bool.d runtime/typeinfos/ti_array_byte.d runtime/typeinfos/ti_array_cdouble.d runtime/typeinfos/ti_array_cfloat.d runtime/typeinfos/ti_array_char.d runtime/typeinfos/ti_array_creal.d runtime/typeinfos/ti_array_dchar.d runtime/typeinfos/ti_array_double.d runtime/typeinfos/ti_array_float.d runtime/typeinfos/ti_array_idouble.d runtime/typeinfos/ti_array_ifloat.d runtime/typeinfos/ti_array_int.d runtime/typeinfos/ti_array_ireal.d runtime/typeinfos/ti_array_long.d runtime/typeinfos/ti_array_object.d runtime/typeinfos/ti_array_real.d runtime/typeinfos/ti_array_short.d runtime/typeinfos/ti_array_ubyte.d runtime/typeinfos/ti_array_uint.d runtime/typeinfos/ti_array_ulong.d runtime/typeinfos/ti_array_ushort.d runtime/typeinfos/ti_array_void.d runtime/typeinfos/ti_array_wchar.d runtime/typeinfos/ti_assocarray.d runtime/typeinfos/ti_byte.d runtime/typeinfos/ti_cdouble.d runtime/typeinfos/ti_cfloat.d runtime/typeinfos/ti_char.d runtime/typeinfos/ti_creal.d runtime/typeinfos/ti_dchar.d runtime/typeinfos/ti_delegate.d runtime/typeinfos/ti_double.d runtime/typeinfos/ti_enum.d runtime/typeinfos/ti_float.d runtime/typeinfos/ti_function.d runtime/typeinfos/ti_idouble.d runtime/typeinfos/ti_ifloat.d runtime/typeinfos/ti_int.d runtime/typeinfos/ti_interface.d runtime/typeinfos/ti_ireal.d runtime/typeinfos/ti_long.d runtime/typeinfos/ti_object.d runtime/typeinfos/ti_ptr.d runtime/typeinfos/ti_real.d runtime/typeinfos/ti_short.d runtime/typeinfos/ti_staticarray.d runtime/typeinfos/ti_struct.d runtime/typeinfos/ti_tuple.d runtime/typeinfos/ti_typedef.d runtime/typeinfos/ti_ubyte.d runtime/typeinfos/ti_uint.d runtime/typeinfos/ti_ulong.d runtime/typeinfos/ti_ushort.d runtime/typeinfos/ti_void.d runtime/typeinfos/ti_wchar.d runtime/util.d runtime/common.d runtime/main.d

DFILES_PARSING = parsing/d/trees.d parsing/d/addexprunit.d parsing/d/andexprunit.d parsing/d/assignexprunit.d parsing/d/blockstmtunit.d parsing/d/switchstmtunit.d parsing/d/casestmtunit.d parsing/d/defaultstmtunit.d parsing/d/breakstmtunit.d parsing/d/continuestmtunit.d parsing/d/gotostmtunit.d parsing/d/returnstmtunit.d parsing/d/volatilestmtunit.d parsing/d/throwstmtunit.d parsing/d/postfixexprlistunit.d parsing/d/cmpexprunit.d parsing/d/conditionalexprunit.d parsing/d/declarationunit.d parsing/d/expressionunit.d parsing/d/importdeclunit.d parsing/d/isexprunit.d parsing/d/lexer.d parsing/d/logicalandexprunit.d parsing/d/logicalorexprunit.d parsing/d/moduledeclunit.d parsing/d/moduleunit.d parsing/d/mulexprunit.d parsing/d/nodes.d parsing/d/orexprunit.d parsing/d/parser.d parsing/d/postfixexprunit.d parsing/d/primaryexprunit.d parsing/d/shiftexprunit.d parsing/d/staticunit.d parsing/d/declaratorunit.d parsing/d/declaratorsuffixunit.d parsing/d/declaratortypeunit.d parsing/d/tokens.d parsing/d/enumdeclunit.d parsing/d/typeunit.d parsing/d/enumbodyunit.d parsing/d/aggregatedeclunit.d parsing/d/aggregatebodyunit.d parsing/d/classbodyunit.d parsing/d/templatebodyunit.d parsing/d/interfacebodyunit.d parsing/d/classdeclunit.d parsing/d/interfacedeclunit.d parsing/d/constructorunit.d parsing/d/destructorunit.d parsing/d/parameterlistunit.d parsing/d/functionbodyunit.d parsing/d/staticifunit.d parsing/d/versionunit.d parsing/d/debugunit.d parsing/d/unittestunit.d parsing/d/parameterunit.d parsing/d/basictypeunit.d parsing/d/statementunit.d parsing/d/pragmastmtunit.d parsing/d/staticassertunit.d parsing/d/foreachstmtunit.d parsing/d/scopedstmtunit.d parsing/d/forstmtunit.d parsing/d/typedeclarationunit.d parsing/d/unaryexprunit.d parsing/d/xorexprunit.d parsing/ast.d parsing/lexer.d parsing/token.d parsing/parser.d parsing/options.d parsing/cfg.d parsing/parseunit.d
DFILES = djehuty.d
DFILES_BINARY_CODECS = decoders/binary/decoder.d decoders/binary/base64.d decoders/binary/yEnc.d decoders/binary/deflate.d decoders/binary/zlib.d
DFILES_IMAGE_CODECS = decoders/image/decoder.d decoders/image/all.d decoders/image/bmp.d decoders/image/png.d decoders/image/gif.d decoders/image/jpeg.d
DFILES_AUDIO_CODECS = decoders/audio/decoder.d decoders/audio/all.d decoders/audio/mp2.d decoders/audio/mp3.d decoders/audio/wav.d decoders/audio/mp3Huffman.d decoders/audio/mpegCommon.d
DFILES_GRAPHICS = graphics/path.d graphics/gradient.d graphics/bitmap.d graphics/view.d graphics/graphics.d graphics/convexhull.d graphics/region.d graphics/brush.d graphics/font.d graphics/pen.d
DFILES_NETWORKING = net/http.d net/telnet.d net/irc.d net/ftp.d
DFILES_IO = io/file.d io/directory.d io/console.d io/audio.d io/wavelet.d io/socket.d
DFILES_RESOURCE = resource/sound.d resource/image.d resource/resource.d resource/menu.d
DFILES_CODEC = decoders/decoder.d
DFILES_HASHES = hashes/digest.d hashes/all.d hashes/md5.d hashes/sha1.d hashes/sha224.d hashes/sha256.d
DFILES_CONSOLE = console/prompt.d
DFILES_CUI = cui/dialog.d cui/window.d cui/canvas.d cui/application.d cui/label.d cui/textfield.d cui/textbox.d cui/tabbox.d cui/button.d cui/progressbar.d cui/scrollbar.d cui/listbox.d cui/filebox.d cui/togglefield.d cui/spinner.d cui/listfield.d
#DFILES_SCRIPTING = scripting/lua.d
#DFILES_BINDING = binding/opengl/gl.d binding/opengl/glu.d binding/lua.d
DFILES_INTERFACES =
DFILES_MATH = math/random.d math/currency.d math/fixed.d math/integer.d math/common.d math/vector.d math/matrix.d math/mathobject.d math/sin.d math/cos.d math/pow.d math/tan.d math/sqrt.d math/definitions.d math/abs.d
DFILES_OPENGL = 
DFILES_TESTING = spec/support.d spec/logic.d spec/itemspecification.d spec/packagespecification.d spec/modulespecification.d spec/specification.d spec/test.d
DFILES_SYNCH = synch/atomic.d synch/condition.d synch/barrier.d synch/mutex.d synch/semaphore.d synch/thread.d synch/timer.d
DFILES_SYSTEM = system/keyboard.d system/layout/keytranslator.d system/layout/unitedstates.d system/layout/dvorak.d system/layout/colemak.d system/layout/quebec.d system/layout/canadianmultilingual.d system/layout/polishprogrammers.d system/layout/czechprogrammers.d system/layout/unitedstatesinternational.d

DFILES_RSC =
DFILES_SPECS = .specs/runtime/array.d .specs/runtime/foreach.d .specs/core/application.d .specs/core/arguments.d .specs/core/date.d .specs/core/exception.d .specs/core/regex.d .specs/core/string.d .specs/core/time.d .specs/core/unicode.d .specs/core/util.d .specs/core/variant.d .specs/data/fibonacci.d .specs/data/heap.d .specs/data/queue.d .specs/data/stack.d .specs/hashes/digest.d .specs/hashes/md5.d .specs/hashes/sha1.d .specs/hashes/sha224.d .specs/hashes/sha256.d .specs/math/random.d .specs/runtime/switch.d .specs/runtime/synchronized.d .specs/math/abs.d

SOURCES = $(DFILES_SPECS) $(DFILES) $(DFILES_RUNTIME) $(DFILES_SYSTEM) $(DFILES_LOCALES) $(DFILES_RESOURCE) $(DFILES_IO) $(DFILES_SYNCH) $(DFILES_PARSING) $(DFILES_OPENGL) $(DFILES_CUI) $(DFILES_ANALYZING) $(DFILES_SCRIPTING) $(DFILES_TESTING) $(DFILES_MATH) $(DFILES_GRAPHICS) $(DFILES_HASHES) $(DFILES_RSC) $(DFILES_NETWORKING) $(DFILES_INTERFACES) $(DFILES_DATA) $(DFILES_CONSOLE) $(DFILES_BINARY_CODECS) $(DFILES_CODEC) $(DFILES_IMAGE_CODECS) $(DFILES_AUDIO_CODECS) $(DFILES_CORE) $(DFILES_GUI) $(DFILES_PARSERS)

OBJS_CORE = $(SOURCES:.d=.o)

OBJS_MAC = $(OBJS_CORE) $(DFILES_PLATFORM_MAC:.d=.o) $(OBJC_FILES:.m=.o)

OBJS_LINUX = $(OBJS_CORE) $(DFILES_PLATFORM_UNIX:.d=.o)

OBJS_WIN = $(OBJS_CORE:.o=.obj) $(DFILES_PLATFORM_WIN:.d=.obj)

OBJS_XOMB = $(OBJS_CORE:.o=_xomb.o) $(DFILES_PLATFORM_XOMB:.d=_xomb.o)

TOOLS_DSPEC = tools/dspec/main.d tools/dspec/feeder.d tools/dspec/filelist.d tools/dspec/ast.d tools/dspec/parser.d tools/dspec/parseunit.d tools/dspec/output.d
TOOLS_DSCRIBE = tools/dscribe/main.d tools/dscribe/lexer.d
TOOLS_SOBEK = tools/sobek/main.d
TOOLS_SESHAT = tools/seshat/main.d tools/seshat/options.d tools/seshat/dependencylist.d
TOOLS_TESTS = runtests.d

EXAMPLES_CUITETRIS = examples/CuiTetris/app.d examples/CuiTetris/gamewindow.d examples/CuiTetris/tetris.d examples/CuiTetris/gamecontrol.d

EXAMPLES_MOREDUCKS = examples/MoreDucks/MoreDucks.d

EXAMPLES_SNAKE = examples/Snake/app.d examples/Snake/constants.d examples/Snake/game.d examples/Snake/posn.d examples/Snake/snake.d examples/Snake/win.d

libdeps_linux: $(OBJS_LINUX)
	@echo ">> framework compilation complete. <<"

libdeps_mac: $(OBJS_MAC)
	@echo ">> framework compilation complete. <<"

libdeps_win: $(OBJS_WIN)
#	@echo ">> framework compilation complete. <<"

libdeps_xomb: $(OBJS_XOMB)
	@echo ">> framework compilation complete. <<"

# compile D files
%.o: %.d
	@echo \-\-\-\> $<
ifeq (${MY_ARCH},Darwin)
	@$(DC) $< $(DFLAGS) -d-version=PlatformOSX -c -of$@ -O3 -J./tests -I./platform/osx
else
ifeq ($(PLATFORM),"WINDOWS")
else
	@$(DC) $< $(DFLAGS) -d-version=PlatformLinux -c -of$@ -O3 -J./tests ${LFLAGS_LINUX}
endif
endif

%_xomb.o: %.d
	@echo \-\-\-\> $<
	@$(DC) $< $(DFLAGS) -d-version=PlatformXOmB -c -of$@ -O3 -J./tests ${LFLAGS_XOMB}

%.obj: %.d
	@echo \-\-\-\> $<
ifeq (${MY_ARCH},Darwin)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -c -of$@ -J./tests $(DFLAGS) -version=PlatformWindows -I. -Iplatform/win -unittest $<
else
endif
endif

# compile Objective-C files
%.o: %.m
	@echo \-\-\-\> \(objc\) $<
ifeq (${MY_ARCH},Darwin)
	@$(OBJCC) $(OBJCFLAGS) -m32 -c $< -o $@ -O3
else
endif

# initiates the compilation of the main framework
lib:
	@echo compiling framework... Target: ${MY_ARCH}
ifeq (${MY_ARCH},Darwin)
	@echo OS X detected...
	@make libdeps_mac
else
ifeq ($(PLATFORM),WINDOWS)
	@echo Windows detected...
	@make libdeps_win
else
	@echo UNIX detected...
	@make libdeps_linux
endif
endif

app: libdeps_xomb

	@echo compiling test program...
ifeq (${MY_ARCH},MINGW32_NT-6.0)
	@lib -c -p64 djehutyxomb.lib $(OBJS_XOMB) $(LFLAGS_WIN)
endif
ifeq (${MY_ARCH},MINGW32_NT-6.1)
	@lib -c -p64 djehutyxomb.lib $(OBJS_XOMB) $(LFLAGS_WIN)
endif

	@echo linking...
ifeq (${MY_ARCH},MINGW32_NT-6.0)
	@compiler/dmd/bin/3 -w -version=PlatformXOmB -unittest app.d djehutyxomb.lib
endif
ifeq (${MY_ARCH},MINGW32_NT-6.1)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformXOmB -unittest app.d djehutyxomb.lib
endif

$(DFILES_SPECS):
	mkdir -p .specs
	mkdir -p .specs/core
	mkdir -p .specs/runtime
	mkdir -p .specs/data
	mkdir -p .specs/hashes
	mkdir -p .specs/math
	touch $(DFILES_SPECS)

xomb: libdeps_xomb
	@echo linking...
	$(DC) -d-version=PlatformXOmB winsamp.d -c -ofwinsamp.o -O3 -J./tests $(DFLAGS) ${LFLAGS_XOMB}
	ld winsamp.o $(OBJS_XOMB) $(LFLAGS_XOMB) -T../xomb/app/build/elf.ld ../xomb/runtimes/mindrt/drt0.a -nostdlib -o winsamp ../xomb/app/d/hello/dsss_objs/O/user.environment.o ../xomb/app/d/hello/dsss_objs/O/libos.libdeepmajik.threadscheduler.o ../xomb/app/d/hello/dsss_objs/O/user.syscall.o ../xomb/app/d/hello/dsss_objs/O/libos.libdeepmajik.umm.o ../xomb/app/d/hello/dsss_objs/O/user.nativecall.o ../xomb/app/d/hello/dsss_objs/O/libos.libkeyboard.o ../xomb/app/d/hello/dsss_objs/O/libos.console.o -gc-sections

# compiles the library framework, and then the test app
all: lib

	@echo linking...
ifeq (${MY_ARCH},Darwin)
	@$(DC) winsamp.d $(DFLAGS) -d-version=PlatformOSX -c -ofwinsamp.o -O3 -J./tests -I./platform/osx 
	@$(OBJCC) -m32 $(OBJS_MAC) winsamp.o -o winsamp $(LFLAGS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	compiler/dmd/bin/dmd.exe -w -version=PlatformWindows winsamp.d $(OBJS_WIN) $(LFLAGS_WIN)
else
	$(DC) -d-version=PlatformLinux winsamp.d $(OBJS_LINUX) $(LFLAGS_LINUX)
endif
endif

sobek: lib

ifeq (${MY_ARCH},Darwin)
	for i in ${TOOLS_SOBEK}; do $(DC) "$${i}" $(DFLAGS) -d-version=PlatformOSX -c -of$${i}.o -O3 -J./tests -I./tools/sobek -I./platform/osx; done
	$(OBJCC) -m32 $(OBJS_MAC) `ls tools/sobek/*.o` -o sobek $(LFLAGS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofsobek.exe $(TOOLS_SOBEK) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofsobek -d-version=PlatformLinux $(TOOLS_SOBEK) $(OBJS_LINUX)
endif
endif

seshat: lib

ifeq (${MY_ARCH},Darwin)
	for i in ${TOOLS_SESHAT}; do $(DC) "$${i}" $(DFLAGS) -d-version=PlatformOSX -c -of$${i}.o -O3 -J./tests -I./tools/seshat -I./platform/osx; done
	$(OBJCC) -m32 $(OBJS_MAC) `ls tools/seshat/*.o` -o seshat $(LFLAGS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofseshat.exe $(TOOLS_SESHAT) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofseshat -d-version=PlatformLinux $(TOOLS_SESHAT) $(OBJS_LINUX)
endif
endif

dspec: lib

	@echo compiling DSpec and linking...
ifeq (${MY_ARCH},Darwin)
	#@$(DC) $(LFLAGS_MAC) -o winsamp winsamp.o $(OBJS_MAC)
	for i in ${TOOLS_DSPEC}; do $(DC) "$${i}" $(DFLAGS) -d-version=PlatformOSX -c -of$${i}.o -O3 -J./tests -I./tools/dspec -I./platform/osx; done
	$(OBJCC) -m32 $(OBJS_MAC) `ls tools/dspec/*.o` -o dspec $(LFLAGS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofdspec.exe $(TOOLS_DSPEC) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofdspec -d-version=PlatformLinux $(TOOLS_DSPEC) $(OBJS_LINUX)
endif
endif

dscribe: lib

	@echo compiling DScribe and linking...
ifeq (${MY_ARCH},Darwin)
	#@$(DC) $(LFLAGS_MAC) -o winsamp winsamp.o $(OBJS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofdscribe.exe $(TOOLS_DSCRIBE) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofdscribe -d-version=PlatformLinux $(TOOLS_DSCRIBE) $(OBJS_LINUX)
endif
endif

cuitetris: lib

	@echo compiling CuiTetris example and linking...
ifeq (${MY_ARCH},Darwin)
	for i in ${EXAMPLES_CUITETRIS}; do $(DC) "$${i}" $(DFLAGS) -d-version=PlatformOSX -c -of$${i}.o -O3 -J./tests -I./examples/CuiTetris -I./platform/osx; done
	$(OBJCC) -m32 $(OBJS_MAC) `ls examples/CuiTetris/*.o` -o cuitetris $(LFLAGS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofcuitetris.exe $(EXAMPLES_CUITETRIS) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofcuitetris -d-version=PlatformLinux $(EXAMPLES_CUITETRIS) $(OBJS_LINUX)
endif
endif

moreducks: lib

	@echo compiling More Ducks example and linking...
ifeq (${MY_ARCH},Darwin)
	for i in ${EXAMPLES_MOREDUCKS}; do $(DC) "$${i}" $(DFLAGS) -d-version=PlatformOSX -c -of$${i}.o -O3 -J./tests -I./examples/MoreDucks -I./platform/osx; done
	$(OBJCC) -m32 $(OBJS_MAC) `ls examples/MoreDucks/*.o` -o moreducks $(LFLAGS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofmoreducks.exe $(EXAMPLES_MOREDUCKS) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofmoreducks -d-version=PlatformLinux $(EXAMPLES_MOREDUCKS) $(OBJS_LINUX)
endif
endif

snake: lib

	@echo compiling snake example and linking...
ifeq (${MY_ARCH},Darwin)
	#@$(DC) $(LFLAGS_MAC) -o snake $(OBJS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofsnake.exe $(EXAMPLES_SNAKE) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofsnake -d-version=PlatformLinux $(EXAMPLES_SNAKE) $(OBJS_LINUX)
endif
endif

tests: lib
	@echo compiling Test Suite...
ifeq (${MY_ARCH},Darwin)
	@$(DC) runtests.d $(DFLAGS) -d-version=PlatformOSX -c -ofruntests.o -O3 -J./tests -I./platform/osx 
	@$(OBJCC) -m32 $(OBJS_MAC) runtests.o -o runtests $(LFLAGS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	@compiler/dmd/bin/dmd.exe -w -version=PlatformWindows -ofruntests.exe $(TOOLS_TESTS) $(OBJS_WIN) $(LFLAGS_WIN)
else
	@$(DC) $(LFLAGS_LINUX) -ofruntests -d-version=PlatformLinux $(TOOLS_TESTS) $(OBJS_LINUX)
endif
endif



clean:
ifeq (${MY_ARCH},Darwin)
	rm -f $(OBJS_MAC)
else
ifeq ($(PLATFORM),WINDOWS)
	rm -f $(OBJS_WIN)
	cp compiler/dmd/bin/_minit.obj compiler/dmd/minit.obj
else
	rm -f $(OBJS_LINUX)
endif
endif
