From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 10 Mar 2012 18:44:07 +0000
Subject: Re: [PATCH] drivers/ata/pata_mpc52xx.c: add missing kfree
Message-Id: <20120310184407.GB4139@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cvVnyQ+4j833TQvp"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331402199-8000-1-git-send-email-Julia.Lawall@lip6.fr>
 <20120310181315.GA4139@pengutronix.de>
 <1331404377.14442.19.camel@joe2Laptop>
In-Reply-To: <1331404377.14442.19.camel@joe2Laptop>
To: Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: linux-ide-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, Jeff Garzik <jgarzik-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>


--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Anatolij is not listed as a maintainer for this file
> nor has he ever written or signed a patch for it.

I noticed that Grant was in CC, assumed that it was because of his previous=
 MPC
maintainership and mentioned that Anatolij took over. Nothing more, just wa=
nted
to help.

> It'd be possible to add patterns to MAINTAINERS
> if Anatolij really wants to see changes to drivers.

It seems a bit too much for my taste (hardly readable? false positives?), b=
ut
then again, it is not my decision, but Anatolij's :)

Thanks!

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9boPcACgkQD27XaX1/VRulfACaA9SJ+mYmDAahULtYCkpEy3fw
2PcAoMrBrav7Iq+Ay12VktLVxc4jHRYV
=14t0
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
