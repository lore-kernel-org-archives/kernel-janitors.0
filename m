From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:55:36 +0000
Subject: Re: [PATCH 8/9] staging: ks7010: Delete a variable in write_to_device()
Message-Id: <20160720155536.GH1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="K1n7F7fSdjvFAEnM"
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <749c981a-c649-2b24-bd47-8511d0cc95b9@users.sourceforge.net>
In-Reply-To: <749c981a-c649-2b24-bd47-8511d0cc95b9@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


--K1n7F7fSdjvFAEnM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:28:44PM +0200, SF Markus Elfring wrote:
> From 01291121668ccb54f1a784765a8d2b5811afa75a Mon Sep 17 00:00:00 2001
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 17 Jul 2016 19:26:15 +0200
> Subject: [PATCH 8/9] staging: ks7010: Delete a variable in write_to_devic=
e()
>=20
> The local variable "rc" was assigned a zero at one place.
> But it was not read within this function. Thus delete it.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Wolfram Sang <wsa@the-dreams.de>


--K1n7F7fSdjvFAEnM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj574AAoJEBQN5MwUoCm2JioP/iATlE8vThgdkclA62HA+6QY
QMMpoZ46s2OPIgZ0IDlycfF22sHy96EgmnGS6vvuX9b336tNmO0R85JMAMYWt+0h
a5C2LZRyODXUD4zbjhBYiTB03NMjzlG+kglJ2fa1Eqz0+8MBwtWdlZlIftzMnZdA
QKwDGUyF4gAL+CST8I4bWmprRb73JreA86MEY4asVDnJNTMvyPi4ADaDT2QTqOil
xCJGaeZsXsgRCavq+o9QGbLypy7ehvFSwWKp1qXGi/UxEjjppvVaXdYfdA1bwy8R
Tk9OB2krbG0uagPdZZ8BP5K+uUZTxxS390PUM5+baul+VuF1EXt9YHpuCo7U5oNK
U+6n7tgMEb0/Zz3syiotgXXUfZzUCDqKckP8/n1uJV/YudLecUpWVIq9c7vztmIF
d/9ot8HqGr1QHwzDdvHl0xkp96wjdJA8Hg7s5Ql7lU6a4InbVfiMeveC3w0qadir
dz7BjWsJFPM4ligzBm5342yBvA8cBmnLQksfszi6zVtV34fR4AOujU8Vg7yICbm/
1pyG4r7knodZx6eodU86VP24Zr+C9oEF91hGixYxf7Pxgl44HnrQkgysA+txS/Fe
59RtRuHfl4JlSiEeJ9Nv4291MGRS6vQIE8GRW8GCMrk4Oa97i3GxXOMnzbjc+/Dh
XK494t2pl9vMWyUB3hFT
=1PsI
-----END PGP SIGNATURE-----

--K1n7F7fSdjvFAEnM--
