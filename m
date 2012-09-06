From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Thu, 06 Sep 2012 07:55:47 +0000
Subject: Re: [omap-dss2:work:omap5-dt 83/133] include/linux/of.h:318:1: error: unknown type name 'device_node
Message-Id: <1346918147.2737.23.camel@deskari>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-ew9eMMONYNAMRsbdjIC+"
List-Id: <kernel-janitors.vger.kernel.org>
References: <50485535.6060203@ti.com>
In-Reply-To: <50485535.6060203@ti.com>
To: kernel-janitors@vger.kernel.org


--=-ew9eMMONYNAMRsbdjIC+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

Why are you compiling work/omap5-dt branch? That's not a stable one.

But yes, the patch is Peter's, even if it's my git tree, so he was the
correct one to blame ;).

 Tomi

On Thu, 2012-09-06 at 10:48 +0300, Peter Ujfalusi wrote:
> Hi,
>=20
> On 09/06/2012 06:51 AM, Fengguang Wu wrote:
> > Hi Peter,
> >=20
> > FYI, kernel build failed on
>=20
> Thank you for report. AFAIK this is a work in progress tree for OMAP DSS2
> maintained by Tomi Valkeinen (I have put him to CC).
>=20
> Regards,
> P=C3=A9ter
>=20
> >=20
> > tree:   git://gitorious.org/linux-omap-dss2/linux work/omap5-dt
> > head:   73fc80a0ac6b4a62eab3ce20150167f5be0233e7
> > commit: 3fc0d2ee0ac2c9f927b4e4aa5aca915d85ec56eb [83/133] dt: Add empty=
 of_find_node_by_name() function
> > config: x86_64-allyesdebian (attached as .config)
> >=20
> > All related error/warning messages:
> >=20
> > In file included from arch/x86/kernel/irq.c:7:0:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from arch/x86/include/asm/prom.h:17:0,
> >                  from arch/x86/kernel/setup.c:115:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from arch/x86/include/asm/prom.h:17:0,
> >                  from arch/x86/kernel/irqinit.c:27:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from arch/x86/kernel/rtc.c:10:0:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from include/linux/i2c.h:36:0,
> >                  from include/linux/fb.h:5,
> >                  from fs/compat_ioctl.c:44:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from kernel/irq/irqdomain.c:11:0:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from drivers/ata/sata_mv.c:68:0:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from drivers/base/core.c:21:0:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from include/linux/i2c.h:36:0,
> >                  from include/linux/fb.h:5,
> >                  from arch/x86/video/fbdev.c:9:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from include/asm-generic/gpio.h:7:0,
> >                  from include/linux/gpio.h:48,
> >                  from drivers/gpio/gpiolib.c:10:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > --
> > In file included from include/asm-generic/gpio.h:7:0,
> >                  from include/linux/gpio.h:48,
> >                  from drivers/gpio/devres.c:18:
> > include/linux/of.h:318:1: error: unknown type name 'device_node'
> > ..
> >=20
> > ---
> > 0-DAY kernel build testing backend         Open Source Technology Centr=
e
> > Fengguang Wu <wfg@linux.intel.com>                     Intel Corporatio=
n
> >=20
>=20
>=20


--=-ew9eMMONYNAMRsbdjIC+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJQSFcDAAoJEPo9qoy8lh71wr0QAKIMXc3dtbJozZXiL4mhPMWt
TJ2bFQgeX5j/LfPVMTtuG3Py2ImgV7mnGb68PCMOQLfb7VJpuD6BtmWbP/rq9K0S
2X22WyhPTAW99HNALUukXGzLqn1tswAozF+/odaJykgEZMCM4axOksC5CNewzXxT
A6llDOTsM576T5Wg2W6boN+yWj4C712CKQZUglVBERdBQQ3h/bDioPtnc13yvg/H
marM5Jaiqvrg6ow9C7uJqMBt88SWrf0Q9ks35N6+m5eDOukqJmHlPP1eJN9OuZCO
urwJDhb7MkBQljdTWMVpuZKHUA5CRyRExzHS8Cz3FbeddPNbP3/zbQPNs/I1bkZ/
jmsVmzwHQtXh4gIrkKHM1H67yNd75NHZwr9N7DyrxOYFHBhH4pZhj7of4UeZrsv3
Y6XNhjTIo+TQXZWYduCR+RhFQDFtcvO7exNJjXmhPYrOdT0RMUbwn8WvbmRpuIQH
5AnlrUSj5NQ1J908VJPgK/nfHYTetKgdB5HEJ8JAWADrhPiCeonWkmlHoBVsk48h
sSQQRkWePpfQzI90QZzDeMe44XJ0qQTI3Ar3gZKZi+Hj6ACPKeVWQPDIh41kqcRO
GlIgduifpeHhfJq6MtGropXCpy2p82ei2S4FxwZG9flJ1IFJBxAH/hicyAX2/Kd7
4n2hq5ybv5T491iJ08z3
=Xcc+
-----END PGP SIGNATURE-----

--=-ew9eMMONYNAMRsbdjIC+--

