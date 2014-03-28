From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Fri, 28 Mar 2014 19:17:16 +0000
Subject: Re: [patch] i40e: remove an unneeded check
Message-Id: <1396034236.2287.24.camel@jtkirshe-mobl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-nT9MYZkpxNM75CSb0HbA"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140328082919.GM25192@mwanda>
In-Reply-To: <20140328082919.GM25192@mwanda>
To: kernel-janitors@vger.kernel.org


--=-nT9MYZkpxNM75CSb0HbA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-03-28 at 11:29 +0300, Dan Carpenter wrote:
> We know "ret" is zero here.  No need to check again.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Dan with the latest bunch of patches I just pushed and that Dave
accepted, the code changes which directly affect your patch to leaves
your patch only changing the return statement from:

return ret;

to=20

return 0;

but with the recent change in the code, the ret value can be something
other than 0 so your patch does not appear to be needed any longer.

Can you double check my findings by taking a look at David Miller's
latest net-next tree to verify please?

Cheers,
Jeff

--=-nT9MYZkpxNM75CSb0HbA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAABCgAGBQJTNcq8AAoJEOVv75VaS+3ODC0P/A7RWpxxoJ9SCXTeibyd/Iye
8y5ssRFmTS8HLMWBH8aVKsHEXkMRObGVXeE0CRJwYbks2P8NmvT4UBFhawmBa9g9
M5J1DsgeG67HER4UXRBl/gNFaKaWyRJdSl0mMgRPlFI8gFadsCQwvyAR+7yjLVAD
TVq32JFi6hOExxRYXQajYdt9gvVZmTOzF6lt9Wxoz6PcatpH0jORTOaaYG55NQoE
x7x8gor/vmF6AknK/m+FZRFNQt8a5pmu1aIY0G4dhP58vOhMuH2V52l+RMPnlVTR
HSIpqGMAyXrlKPvIUDRxQ4VIByBxc6Ewdiv5dPq8+yDM2ymaU1VsxDFRZCY+PP7b
zWMKHWP7gKgDdiILtjhNIBVBrEFKPkbZJTV3/5yGZVCDLzrOdd+tQoHFEyYGgldV
aMLXL5+q5fpRx9ew6uGxankelzar2yfl5TKE3+bK6ua3K8B+kDRlw3XQvw1nQFWC
ZLr+/tDDPvBSm+MyEpQx6y1c+5tlq8n6tuA4QuRktuMVEAbYw2oEFRCHKAOBhTwk
mZZ/rVjWScOdpy1LDGExnXl7EPqHSXNeGO3Pp97Y6uZf0r5Sw4nTageQpTFQgDHs
70gwJv90D1rBeC0xJpjA2bfw3PWEN/tt744D9WQq+xrIea30it1cVUrTL47xNlz3
o1jQqJC9ZdhkDYNHZ06G
=Rwpo
-----END PGP SIGNATURE-----

--=-nT9MYZkpxNM75CSb0HbA--

