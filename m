From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 07 Aug 2012 02:47:07 +0000
Subject: Re: [wireless-testing:master 53/59] drivers/net/wireless/mwifiex/uap_event.c:251:11: warning: compar
Message-Id: <20120807024707.GA21890@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120807005524.GD9903@localhost>
 <477F20668A386D41ADCC57781B1F7043083AE3DA2C@SC-VEXCH1.marvell.com>
In-Reply-To: <477F20668A386D41ADCC57781B1F7043083AE3DA2C@SC-VEXCH1.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bing Zhao <bzhao@marvell.com>
Cc: Avinash Patil <patila@marvell.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "John W. Linville" <linville@tuxdriver.com>, Kiran Divekar <dkiran@marvell.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On Mon, Aug 06, 2012 at 07:33:37PM -0700, Bing Zhao wrote:
> Hi Fengguang,
> 
> > drivers/net/wireless/mwifiex/uap_event.c: In function 'mwifiex_process_uap_event':
> > drivers/net/wireless/mwifiex/uap_event.c:251:11: warning: comparison of distinct pointer types lacks
> > a cast [enabled by default]
> 
> Thanks for reporting this warning.
> Could you please share your gcc version (or ppc toolchain version) with me?

Bing, the toolchain is downloaded from

https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/

Just unpack the powerpc package to /usr/local and run this:

/usr/bin/make ARCH=powerpc CROSS_COMPILE=/usr/local/gcc-4.6.3-nolibc/powerpc64-linux/bin/powerpc64-linux- allmodconfig

The gcc version is:

% /usr/local/gcc-4.6.3-nolibc/powerpc64-linux/bin/powerpc64-linux-gcc -v
Using built-in specs.
COLLECT_GCC=/usr/local/gcc-4.6.3-nolibc/powerpc64-linux/bin/powerpc64-linux-gcc
COLLECT_LTO_WRAPPER=/usr/local/gcc-4.6.3-nolibc/powerpc64-linux/bin/../libexec/gcc/powerpc64-linux/4.6.3/lto-wrapper
Target: powerpc64-linux
Configured with: /home/tony/buildall/src/gcc/configure --target=powerpc64-linux --host=x86_64-linux-gnu --build=x86_64-linux-gnu --enable-targets=all --prefix=/opt/cross/gcc-4.6.3-nolibc/powerpc64-linux/ --enable-languages=c --with-newlib --without-headers --enable-sjlj-exceptions --with-system-libunwind --disable-nls --disable-threads --disable-shared --disable-libmudflap --disable-libssp --disable-libgomp --disable-decimal-float --enable-checking=release --with-mpfr=/home/tony/buildall/src/sys-x86_64 --with-gmp=/home/tony/buildall/src/sys-x86_64 --disable-bootstrap --disable-libquadmath
Thread model: single
gcc version 4.6.3 (GCC) 

Thanks,
Fengguang
