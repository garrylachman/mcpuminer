./autogen.sh

extracflags="-O3 -Wall -D_REENTRANT -fmerge-all-constants" # -funroll-loops -fvariable-expansion-in-unroller -fbranch-target-load-optimize2 -fsched2-use-superblocks -falign-loops=16 -falign-functions=16 -falign-jumps=16 -falign-labels=16"
CFLAGS="-DCURL_STATICLIB -DOPENSSL_NO_ASM -DUSE_ASM -static-libgcc $extracflags"

mingw64-configure --build=mingw64 --with-crypto --with-curl CFLAGS="$CFLAGS" CPPFLAGS="$CPPFLAGS"
mingw64-make

strip -p --strip-debug --strip-unneeded cpuminer.exe

if [ -e sign.sh ] ; then
. sign.sh
fi