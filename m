From: Wolfram Sang <wsa@the-dreams.de>
Date: Wed, 20 Jul 2016 15:52:16 +0000
Subject: Re: [PATCH 4/9] staging: ks7010: Rename jump labels
Message-Id: <20160720155216.GD1688@katana>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="VMt1DrMGOVs3KQwf"
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
 <5f019748-0e67-6077-5abc-381725410b66@users.sourceforge.net>
In-Reply-To: <5f019748-0e67-6077-5abc-381725410b66@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>


--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 17, 2016 at 08:20:12PM +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 17 Jul 2016 16:26:18 +0200
>=20
> Adjust jump targets according to the Linux coding style convention.

Really? Is that documented somewhere?

Quoting Jean Delvare:

"> It is generally accepted to indent labels with a single space. This
 > avoids breaking the -p option of diff."

So, NACK for now unless we know 'diff' has been fixed.


--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXj54wAAoJEBQN5MwUoCm2OwIP/RSO8iisFzzrCbn58K8D5HSX
HSEdIf0JTLRSiY/tAFzTcEaQmPST4AkW8X/nYjtasWL1szOByKdwfjz/PsH90Oad
1NbQfHdSxE9N6xU6YibLsU2CMDHybZKHqEgVJJUmILC+WOaizH7t3yfeZymf2oVc
7u42LierN0f35KtnGvivLt1nNbXsWbWnyYOpbx7QuxleRdOfDLxG7+En5Gswkfe1
+67pMz3ecnAEs6H/2FmwZHrEXuUkW0PsaznpWlLqwo4SjRYoG0xkArddyHrYUChW
d4OGKQxeAjNAhnxR3CmFYVUcw/EQgS6XbAvnPR0rMjogwlFp7sw+/4+m4Zy+SeW0
WleZ8xm8MnljyXkrF+iFaXD51iNbmUq0soZXGJBOHTcN5wc0dhbmXwBqSz8o3MC0
KCUJ+JKHNQhCOAQSIoLr3GzAVmycxiAQNY6dwvFL+zd5wTcu8P2o+IzDrPjF344B
2vmuwAgMckDrmuHIQX6De7YH6Y1mpOcQqwRaZppA9q2vyfYsaw7LdFJXUTdzulAe
gNt50LjM/l/CxltqZLUQuwyzCFXsV4/8n/kzzSs0d3behUh37MHOes8/cGr5WXWl
3DHadjsBWxZPoMRS7+cbYY3q+/epVTTzVA804Z1UjWQBwimLGziX0KmHIOAhubCc
NF5yqAYflJGrRWpPdBRs
=Xobz
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
