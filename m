From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 03 Oct 2012 14:12:27 +0000
Subject: Re: [uapi:uapi-split 44/75] include/linux/projid.h:17:30: error: storage class specified for paramet
Message-Id: <20121003141227.GA9009@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003132913.GA4731@localhost>
In-Reply-To: <20121003132913.GA4731@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Oct 03, 2012 at 03:00:27PM +0100, David Howells wrote:
> Fengguang Wu <fengguang.wu@intel.com> wrote:
>=20
> > FYI, kernel build failed on
> >=20
> > tree:   git://git.infradead.org/users/dhowells/linux-headers.git uapi-s=
plit
> > head:   72541c7f48c3dcd7b9cbc3c56a804f7901c2c3dc
> > commit: 81be833cfcaa1b0186bc21f97ee9e65dc71506d5 [44/75] UAPI: (Scripte=
d) Disintegrate include/asm-generic
> > config: openrisc-or1ksim_defconfig
>=20
> I don't have a compiler for that.  Where did you get yours from?

https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/

I downloaded all of them (*/*.tar.xz), extracted to /usr/local, and
used the below script to simplify things. You may also try ktest.

setup:

        cd linux
        mkdir obj-compiletest
        cd obj-compiletest
        ln -s .. source

Usage:

        cd linux
        git checkout uapi-split

        cd obj-compiletest
        export ARCH=3Dopenrisc
        make distclean
        make or1ksim_defconfig
        make prepare
        make

Thanks,
Fengguang

$ cat ~/bin/make
#!/bin/bash

# compile the kernel?
[[ -f kernel/spinlock.c || -f source/kernel/spinlock.c ]] || exec /usr/bin/=
make "$@"

if [[ ${PWD##*-} =3D~ ^(i386|x86_64|alpha|arm|avr32|blackfin|c6x|cris|frv|h=
8300|hexagon|ia64|m32r|m68k|microblaze|mips|mn10300|openrisc|parisc|powerpc=
|s390|score|sh|sparc|sparc64|tile|um|unicore32|xtensa)$ ]]; then
	export ARCH=3D${PWD##*-}
fi

setup_cross_env_kernel_org()
{
	case $ARCH in
		i386|x86_64)
			CROSS			;;
		um)
			CROSS			subarch=3DSUBARCH=3Dx86_64
			;;
		arm)
			CROSS=3Darm-unknown-linux-gnueabi
			;;
		powerpc)
			CROSS=3Dpowerpc64-linux
			;;
		blackfin)
			CROSS=BFin-uclinux
			;;
		sh)
			CROSS=3Dsh4-linux
			;;
		parisc)
			CROSS=3Dhppa-linux
			;;
		openrisc)
			CROSS=3Dor32-linux
			;;
		s390)
			CROSS=3Ds390x-linux
			;;
		tile)
			CROSS=3Dtilegx-linux
			;;
		*)
			CROSS=3D$ARCH-linux
			;;
	esac
	if [[ $CROSS ]]; then
		gcc=3D(/usr/local/gcc-*-nolibc/${CROSS}/bin/${CROSS}-gcc)
		[[ -x $gcc ]] || {
			notice "No cross compiler for $ARCH"
			exit
		}
		cross=3DCROSS_COMPILE=3D${gcc%gcc}
	else
		cross	fi
}

setup_cross_env_local_itanium()
{
	case $ARCH in
		ia64)
			CROSS			;;
		parisc)
			CROSS=3Dhppa-linux
			;;
		sh)
			CROSS=3Dsh3-linux
			;;
		blackfin)
			CROSS=BFin-uclinux
			;;
		avr32)
			CROSS=3Davr-linux
			;;
		mn10300)
			CROSS=3Dam33_2.0-linux
			;;
		h8300)
			CROSS=3Dh8300-elf
			;;
		arm|score|m68k)
			# failed to build gcc cross compiler
			notice error $ARCH not supported
			exit
			;;
		*)
			CROSS=3D$ARCH-linux
			;;
	esac
	if [[ $CROSS ]]; then
		[[ -x /opt/cross/bin/$CROSS-gcc ]] || {
			notice "No cross compiler for $ARCH"
			exit
		}
		cross=3DCROSS_COMPILE=3D/opt/cross/bin/$CROSS-
	else
		cross	fi
}

if [ -x /opt/cross/bin/x86_64-linux-gcc ]; then
	: ${ARCH:=3Dia64}
	setup_cross_env_local_itanium
else
	: ${ARCH:=3Dx86_64}
	setup_cross_env_kernel_org
fi

# export CROSS_COMPILE=3D$ARCH-linux-gnu-
if [ -d obj-$ARCH ]; then
	export KBUILD_OUTPUT=3Dobj-$ARCH
	O=3DKBUILD_OUTPUT=3Dobj-$ARCH
fi

export INSTALL_PATH=3D$HOME/public_html/$ARCH
export INSTALL_MOD_PATH=3D/nfsroot/$USER-$ARCH

[ -f .make-env ] && source ./.make-env

if [[ -d source && -L source ]]; then
	echo /usr/bin/make -C source O=3D$PWD ARCH=3D$ARCH $cross $subarch "$@"
	exec /usr/bin/make -C source O=3D$PWD ARCH=3D$ARCH $cross $subarch "$@"
else
	echo /usr/bin/make $O ARCH=3D$ARCH $cross $subarch "$@"
	exec /usr/bin/make $O ARCH=3D$ARCH $cross $subarch "$@"
fi
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
