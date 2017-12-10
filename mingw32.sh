./autogen.sh

mingw32-configure --build=mingw32 --with-crypto --with-curl CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS"
mingw32-make