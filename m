From: Andreas Mohr <andi@rhlx01.fht-esslingen.de>
Date: Wed, 26 Apr 2006 07:20:26 +0000
Subject: Re: [KJ] [PATCH] constify drivers/block/floppy.c (2.6.17-rc1-mm3)
Message-Id: <20060426072026.GA15596@rhlx01.fht-esslingen.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7311293072516496=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060425180313.GA7096@rhlx01.fht-esslingen.de>
In-Reply-To: <20060425180313.GA7096@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============7311293072516496==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Apr 25, 2006 at 11:19:49PM -0400, Arthur Othieno wrote:
> On Tue, Apr 25, 2006 at 08:03:13PM +0200, Andreas Mohr wrote:
> > -static char *table[] = {
> > +static const char * const table[] = {
> 
>   warning: initialization makes pointer from integer without a cast

Argh.

> Please at least compile test your patches. Thanks.

Uh, I do (plus, I runtime-tested it, too):

# make modules
  CHK     include/linux/version.h
  CC [M]  drivers/block/floppy.o
  Building modules, stage 2.
  MODPOST
WARNING: "v4l_compat_translate_ioctl" [drivers/media/video/saa7134/saa7134.ko] undefined!
WARNING: "v4l_compat_translate_ioctl" [drivers/media/video/cx88/cx8800.ko] undefined!
WARNING: "v4l_compat_translate_ioctl" [drivers/media/common/saa7146_vv.ko] undefined!
  LD [M]  drivers/block/floppy.ko

# gcc -v
Reading specs from /usr/lib/gcc-lib/i386-redhat-linux/3.2.3/specs
Configured with: ../configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --enable-shared --enable-threads=posix --disable-checking --with-system-zlib --enable-__cxa_atexit --host=i386-redhat-linux
Thread model: posix
gcc version 3.2.3 20030502 (Red Hat Linux 3.2.3-49)


Should have done that testing on a machine with a less-than-medieval compiler,
though, methinks...

Sorry for the confusion! I'll submit a correct patch soon.

Nice domain name, BTW (so wonderfully fitting my patch ;-P).

Thanks for your report!

Andreas Mohr

-- 
No programming skills!? Why not help translate many Linux applications! 
https://launchpad.ubuntu.com/rosetta
(or alternatively buy nicely packaged Linux distros/OSS software to help
support Linux developers creating shiny new things for you?)

--===============7311293072516496==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7311293072516496==--
