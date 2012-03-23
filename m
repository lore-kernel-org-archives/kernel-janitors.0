From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2012 17:04:51 +0000
Subject: Re: [patch] xHCI: use gfp flags from caller instead of GFP_ATOMIC
Message-Id: <20120323170451.GB3215@mwanda>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xXmbgvnjoT4axfJE"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323120900.GA20936@elgon.mountain>
In-Reply-To: <20120323120900.GA20936@elgon.mountain>
To: kernel-janitors@vger.kernel.org


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 09:29:57AM -0700, Sarah Sharp wrote:
> On Fri, Mar 23, 2012 at 03:09:00PM +0300, Dan Carpenter wrote:
> > We're not holding a lock here so we can use the gfp flags the caller
> > specifies instead of GFP_ATOMIC.  The callers use GFP_ATOMIC so this
> > change doesn't affect how the kernel runs, but it's a cleanup.
>=20
> Nak.  We are holding a lock in all the xhci_queue* functions, so we
> need GFP_ATOMIC.  It's locked in a parent function, xhci_urb_enqueue().
>=20

Sorry, bad changlog on my part.  I saw that it was locked in the
parent, but I meant that it's not taking a lock here.  The parent
specifies GFP_ATOMIC so the parent is fine.

I don't think we should bother passing the GFP flags if we don't use
them.

regards,
dan carpenter


--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPbK0yAAoJEOnZkXI/YHqRuC8P/3c2SLH8PPtZGVPgkLcVOwAU
MOlfk2wG3z2S9cRTFpru5Q25qx9vikZbOKi6AfzsZaxlBtKWO3z6+FgIX1Ej2SRq
7CrLO8Xz/YvYju3npFXbBkQFzHfKf2SkzSAH+XGxH+5c5LjsfT0tcIKtue6RIZTN
4UMBIqK9yT37wV+XhHZ52teCYQChTV8SlEh3DfUzykM3Uua+U20TsxoQ1O3zGVsU
jaUyGzPrR66pvIt1X61CxVfBfhFPDG/U4BPs7H+in007AEep2yrCxISX2ytYjr1X
b/dTdtbuRsbXOKKtXz4VsqFRbQk0j1gjgt6b3kSL2HpebEJTZXJwv4jaRpHlKDZS
QHz6IwV6amzzJOYdm4m80pWVqJYC2XHTCDyb9ILQ+vxkdVRACPZumlJ5SiaWDfRK
nKT+biNsc2+xCQRES3FuJb/gqsbzpFbwDNnu8ncgrh7IOz2MqtFUJQleoIwNmsTU
UApgDjEg6HzvctSiGeFCzPKFtHuv+7RG8+pULzX5lqMIvfDT30vjgWOPi+yyol2o
m0zNoPx3QC1di3nI3ifKVJfxksPajvEZ9hTEafCtjPYhVWSB+k32LaZXKgKpNwJC
Hm7b0S3vYBAIpXNHHXafmMOhp5lGvPtfIOVwThNFDD5xv6lPd/jBuDtpEALz/8UU
NfMltyS3Mnl/YOykyWAK
=Gc24
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--
