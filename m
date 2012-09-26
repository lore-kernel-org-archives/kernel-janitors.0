From: Fengguang Wu <wfg@linux.intel.com>
Date: Wed, 26 Sep 2012 00:51:56 +0000
Subject: Re: drivers/pci/search.c:85:2: warning: suggest parentheses around assignment used as truth value
Message-Id: <20120926005156.GB5528@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAE9FiQUnvwn+MjXaqiKANOQpeOOHg+X8DV0dFBks_JN1PmYdYw@mail.gmail.com>
In-Reply-To: <CAE9FiQUnvwn+MjXaqiKANOQpeOOHg+X8DV0dFBks_JN1PmYdYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 01:02:39PM -0700, Yinghai Lu wrote:
> On Tue, Sep 25, 2012 at 12:49 PM, Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> >> > drivers/edac/i7core_edac.c: In function 'i7core_pci_lastbus':
> >> > drivers/edac/i7core_edac.c:1299:2: warning: suggest parentheses around assignment used as truth value [-Wparentheses]
> >>
> >> for checkpatch.pl ?
> 
> > GCC.
> 
> gcc in opensuse 12.1 does not complain about that:
> 
> gcc -v
> Using built-in specs.
> COLLECT_GCC=gcc
> COLLECT_LTO_WRAPPER=/usr/lib64/gcc/x86_64-suse-linux/4.6/lto-wrapper
> Target: x86_64-suse-linux
> Configured with: ../configure --prefix=/usr --infodir=/usr/share/info
> --mandir=/usr/share/man --libdir=/usr/lib64 --libexecdir=/usr/lib64
> --enable-languages=c,c++,objc,fortran,obj-c++,java,ada
> --enable-checking=release --with-gxx-include-dir=/usr/include/c++/4.6
> --enable-ssp --disable-libssp --disable-plugin
> --with-bugurl=http://bugs.opensuse.org/ --with-pkgversion='SUSE Linux'
> --disable-libgcj --disable-libmudflap --with-slibdir=/lib64
> --with-system-zlib --enable-__cxa_atexit
> --enable-libstdcxx-allocator=new --disable-libstdcxx-pch
> --enable-version-specific-runtime-libs --program-suffix=-4.6
> --enable-linux-futex --without-system-libunwind --with-arch-32=i586
> --with-tune=generic --build=x86_64-suse-linux
> Thread model: posix
> gcc version 4.6.2 (SUSE Linux)

Yinghai, I'm running gcc 4.7.1 and 4.6.3 in debian. They both
complain about the parentheses for line

#define for_each_pci_host_bridge(d) while (d = pci_get_next_host_bridge(d))

wfg@bee ~/linux/obj-compiletest% gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/4.6/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Debian 4.6.3-1' --with-bugurl=file:///usr/share/doc/gcc-4.6/README.Bugs --enable-languages=c,c++,fortran,objc,obj-c++,go --prefix=/usr --program-suffix=-4.6 --enable-shared --enable-linker-build-id --with-system-zlib --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --with-gxx-include-dir=/usr/include/c++/4.6 --libdir=/usr/lib --enable-nls --with-sysroot=/ --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --enable-plugin --enable-objc-gc --with-arch-32=i586 --with-tune=generic --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu
Thread model: posix
gcc version 4.6.3 (Debian 4.6.3-1) 

Thanks,
Fengguang
