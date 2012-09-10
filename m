From: Felipe Balbi <balbi@ti.com>
Date: Mon, 10 Sep 2012 14:18:46 +0000
Subject: Re: [balbi-usb:gadget 58/62] drivers/usb/gadget/ether.c:113:1: error: expected ')' before '.' token
Message-Id: <20120910141843.GL20569@arwen.pp.htv.fi>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+278g007AL/ykmV8"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910135441.GA12990@localhost>
 <504DF3F8.6080208@linutronix.de>
In-Reply-To: <504DF3F8.6080208@linutronix.de>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Fengguang Wu <fengguang.wu@intel.com>, kernel-janitors@vger.kernel.org, Felipe Balbi <balbi@ti.com>, linux-omap@vger.kernel.org, linux-usb@vger.kernel.org


--+278g007AL/ykmV8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 10, 2012 at 04:06:48PM +0200, Sebastian Andrzej Siewior wrote:
> On 09/10/2012 03:54 PM, Fengguang Wu wrote:
> >tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git gadg=
et
> >head:   7a7322b0a5d984025dd4faea9098b8fef07f8d8f
> >commit: 721e2e91945bc2520d57d795dfe1b502ecec567c [58/62] usb: gadget: li=
bcomposite: move composite.c into libcomposite
> >config: x86_64-randconfig-s284 (attached as .config)
> >
> >All related error/warning messages:
> >
> >In file included from drivers/usb/gadget/ether.c:110:0:
> >drivers/usb/gadget/u_ether.c:87:21: error: expected ')' before 'uint'
>=20
> That is the problem. u_ether.c lacks a "#include <linux/module.h>". It
> built here because I had rndis & EEM which included that file=E2=80=A6
>=20
> Thanks for finding this so quickly.
>=20
> Felipe, patch on top or do fix up this commit?

Please... It also built for me as I had make allmodconfig :-s

--=20
balbi

--+278g007AL/ykmV8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQTfbDAAoJEIaOsuA1yqRE3y0P/0WfaxWNfmbGDW6vvaIET6t7
DFZiUjm5ING/aev0PBA5fE97MYugWZ8LBajEoAY0+50B6D2HyudOTOd7fAfoY7lk
zG6q3liah2bxQ9phLGmNhf5iBgSWQefEAZIHNzcZPPp8kndLNKIZfy1F3pa28gKX
cpa2H96qRa7WscL1k6NxlOw/84T52daHMr+f8T7vQZ+xAuzCuFHVBX18GqRGRbwv
asi8Fn7cpYN2MOWU14ZaIPX+98Vc7ZrRIfEJLF3yeVdkExnuuag/rnpPmPsKYFZB
OwiNBBSiwVtkLnYk/pmsfBiYH7taEC9WNqGzbwrSQUsjynbm3rxytKMfjaLNrbdY
hX2CGAvG2dxmdFwRZSPEKGbptL6PMd3FPghntiKODQLsSTiG2TyghFQWKgaQYlnQ
OLw2Ah7Eh10uc4vOzWYsUDApru9VtpQCYGC69gIlnbTjsF5bXboBKLPYd/AO+PD0
sxFl0yPCNLNhyaZU1ACYqH/s3+RpyRXUGLgCvHvxo3bs+kz0E7wFuovok1KPNRRa
zsRRUyPLsCBrDaoH2zn3TagfuXYfXR40xE7Xl8OEqZgK2E3vdwuuIDfaqljkgdXm
JVWz5P6ZWvAZuPWom9NRH9/uKaoOI3SkxgWkzu+D1L1o1Wy5luFY2KGNwF/r0CWC
hQVT1A0U6vi45TcR5gXv
=a7Go
-----END PGP SIGNATURE-----

--+278g007AL/ykmV8--
