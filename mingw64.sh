./autogen.sh

mingw64-configure --build=mingw64 --with-crypto --with-curl CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS"
mingw64-make
