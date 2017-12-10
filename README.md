M/CPUminer
==========

This is a multi-threaded CPU miner,

Algorithms
==========
#### Currently supported
 * ✓ __scrypt__ (Litecoin, Dogecoin, Feathercoin, ...)
 * ✓ __scrypt:N__
 * ✓ __scrypt-jane:N__
 * ✓ __sha256d__ (Bitcoin, Freicoin, Peercoin/PPCoin, Terracoin, ...)
 * ✓ __axiom__ (Axiom Shabal-256 based MemoHash)
 * ✓ __bastion__ (Joincoin [J])
 * ✓ __bitcore__ Permuted serie of 10 algos (BitCore)
 * ✓ __blake__ (Saffron [SFR] Blake-256)
 * ✓ __blake2s__ (NevaCoin Blake2-S 256)
 * ✓ __bmw__ (Midnight [MDT] BMW-256)
 * ✓ __cryptonight__ (Bytecoin [BCN], Monero [XMR])
 * ✓ __cryptonight-light__ (Aeon)
 * ✓ __decred__ (Blake256-14 [DCR])
 * ✓ __dmd-gr__ (Diamond-Groestl)
 * ✓ __fresh__ (FreshCoin)
 * ✓ __groestl__ (Groestlcoin)
 * ✓ __jha__ (JackpotCoin, SweepStake)
 * ✓ __lbry__ (LBRY Credits [LBC])
 * ✓ __lyra2RE__ (Cryptocoin)
 * ✓ __lyra2REv2__ (VertCoin [VTC])
 * ✓ __myr-gr__ Myriad-Groestl (MyriadCoin [MYR])
 * ✓ __neoscrypt__ (Feathercoin)
 * ✓ __nist5__ (MistCoin [MIC], TalkCoin [TAC], ...)
 * ✓ __pentablake__ (Joincoin)
 * ✓ __pluck__ (Supcoin [SUP])
 * ✓ __quark__ (Quarkcoin)
 * ✓ __qubit__ (GeoCoin)
 * ✓ __skein__ (Skeincoin, Myriadcoin, Xedoscoin, ...)
 * ✓ __skein2__ (Woodcoin)
 * ✓ __s3__ (OneCoin)
 * ✓ __sia__ (Reversed Blake2B for SIA [SC])
 * ✓ __sib__ X11 + gost streebog (SibCoin)
 * ✓ __timetravel__ Permuted serie of 8 algos (MachineCoin [MAC])
 * ✓ __tribus__ 3 of the top NIST5 algos (Denarius [DNR])
 * ✓ __vanilla__ (Blake-256 8-rounds - double sha256 [VNL])
 * ✓ __veltor__ (Veltor [VLT])
 * ✓ __xevan__ x17 x 2 on bigger header (BitSend [BSD])
 * ✓ __x11evo__ (Revolver [XRE])
 * ✓ __x11__ (Darkcoin [DRK], Hirocoin, Limecoin, ...)
 * ✓ __x13__ (Sherlockcoin, [ACE], [B2B], [GRC], [XHC], ...)
 * ✓ __x14__ (X14, Webcoin [WEB])
 * ✓ __x15__ (RadianceCoin [RCE])
 * ✓ __x17__ (Verge [XVG])
 * ✓ __yescrypt__ (GlobalBoostY [BSTY], Unitus [UIS], MyriadCoin [MYR])
 * ✓ __zr5__ (Ziftrcoin [ZRC])

#### Implemented, but untested
 * ? hefty1 (Heavycoin)
 * ? keccak (Maxcoin  HelixCoin, CryptoMeth, Galleon, 365coin, Slothcoin, BitcointalkCoin)
 * ? luffa (Joincoin, Doomcoin)
 * ? shavite3 (INKcoin)

Dependencies
============
 * libcurl http://curl.haxx.se/libcurl/
 * jansson http://www.digip.org/jansson/ (jansson source is included in-tree)
 * openssl libcrypto https://www.openssl.org/
 * pthreads
 * zlib (for curl/ssl)

Build
=====

#### Basic *nix build instructions:
 * just use `./build.sh`
_OR_

```
 ./autogen.sh	# only needed if building from git repo
 ./nomacro.pl	# only needed if building on Mac OS X or with Clang
 ./configure CFLAGS="-march=native" --with-crypto --with-curl
 # Use -march=native if building for a single machine
 make
```

#### Note for pi64 users:

```
 ./configure --disable-assembly CFLAGS="-Ofast -march=native" --with-crypto --with-curl
```

#### Notes for AIX users:
 * To build a 64-bit binary, export OBJECT_MODE=64
 * GNU-style long options are not supported, but are accessible via configuration file

#### Cross compilation in Linux to Windows:
 * Install MinGW32/64 with:
   * winpthreads
   * libcurl devel
   * openssl devel
   * zlib
 * Execute ./mingw32.sh or ./mingw64.sh, depending on the intended platform.

#### Architecture-specific notes:
 * ARM:
   * No runtime CPU detection. The miner can take advantage of some instructions specific to ARMv5E and later processors, but the decision whether to use them is made at compile time, based on compiler-defined macros.
   * To use NEON instructions, add `"-mfpu=neon"` to CFLAGS.
 * x86:
   * The miner checks for SSE2 instructions support at runtime, and uses them if they are available.
 * x86-64:	
   * The miner can take advantage of AVX, AVX2 and XOP instructions, but only if both the CPU and the operating system support them.
     * Linux supports AVX starting from kernel version 2.6.30.
     * FreeBSD supports AVX starting with 9.1-RELEASE.
     * Mac OS X added AVX support in the 10.6.8 update.
     * Windows supports AVX starting from Windows 7 SP1 and Windows Server 2008 R2 SP1.
   * The configure script outputs a warning if the assembler doesn't support some instruction sets. In that case, the miner can still be built, but unavailable optimizations are left off.

Usage instructions
==================
Run "cpuminer --help" to see options.

### Connecting through a proxy

Use the --proxy option.

To use a SOCKS proxy, add a socks4:// or socks5:// prefix to the proxy host  
Protocols socks4a and socks5h, allowing remote name resolving, are also available since libcurl 7.18.0.

If no protocol is specified, the proxy is assumed to be a HTTP proxy.  
When the --proxy option is not used, the program honors the http_proxy and all_proxy environment variables.

Donations
=========
Please, donate for the work done in this fork:

* Bitcoin
  * BTC: `1NW7fhN7Vi9YM6g4DLCz4CiPsbjnC7yFob`
* Monero
  * XMR: `42tvWQxSLZFVQGegMbBfiZhHbhXXbnTu4bp2ispbA1ErN78hDQFQ2o5HF8CKhpJQxXb9nXYoJvtiafDwLna5WE483hD6dKx`

Thank You!
