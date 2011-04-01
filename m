From: Maksym Planeta <mcsim.planeta@gmail.com>
Date: Fri, 01 Apr 2011 14:08:44 +0000
Subject: Re: [PATCH v2] x86: page: get_order() optimization
Message-Id: <1301666924.734.6.camel@debian>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301215556-8898-1-git-send-email-mcsim.planeta@gmail.com>
	 <20110327113323.GA27825@elte.hu> <1301246136.2291.49.camel@debian>
	 <20110328050844.GC26322@elte.hu> <1301340822.6302.90.camel@debian>
	 <4D90E539.7060908@zytor.com>
In-Reply-To: <4D90E539.7060908@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@elte.hu>, mingo@redhat.com, kernel-janitors@vger.kernel.org, namhyung@gmail.com, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jan Beulich <JBeulich@novell.com>

On Mon, 28/03/2011 at 12:44 -0700, H. Peter Anvin wrote:
> With what options?
>=20
> 	-hpa

$ gcc -v
Using built-in specs.
COLLECT_GCC=3Dgcc
COLLECT_LTO_WRAPPER=3D/usr/lib/gcc/x86_64-linux-gnu/4.5.2/lto-wrapper
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion=3D'Debian 4.5.2-4'
--with-bugurl=3Dfile:///usr/share/doc/gcc-4.5/README.Bugs
--enable-languages=3Dc,c++,fortran,objc,obj-c++ --prefix=3D/usr
--program-suffix=3D-4.5 --enable-shared --enable-multiarch
--enable-linker-build-id --with-system-zlib --libexecdir=3D/usr/lib
--without-included-gettext --enable-threads=3Dposix
--with-gxx-include-dir=3D/usr/include/c++/4.5 --libdir=3D/usr/lib
--enable-nls --enable-clocale=3Dgnu --enable-libstdcxx-debug
--enable-libstdcxx-time=3Dyes --enable-plugin --enable-gold
--enable-ld=DEfault --with-plugin-ld=3Dld.gold --enable-objc-gc
--with-arch-32=3Di586 --with-tune=3Dgeneric --enable-checking=3Drelease
--build=3Dx86_64-linux-gnu --host=3Dx86_64-linux-gnu
--target=3Dx86_64-linux-gnu
Thread model: posix
gcc version 4.5.2 (Debian 4.5.2-4)=20

for compiling kernel I've used: make defconfig && make -j3
--=20
Thanks,

Maksym Planeta

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
