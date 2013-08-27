From: Felipe Balbi <balbi@ti.com>
Date: Tue, 27 Aug 2013 20:05:27 +0000
Subject: Re: [patch] usb: musb: unlock on error in cppi41_dma_callback()
Message-Id: <20130827200527.GI3005@radagast>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="iS0NVSKxQTKrudDq"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130821083821.GI5240@elgon.mountain>
In-Reply-To: <20130821083821.GI5240@elgon.mountain>
To: kernel-janitors@vger.kernel.org

--iS0NVSKxQTKrudDq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2013 at 11:38:21AM +0300, Dan Carpenter wrote:
> We need to unlock and enable IRQs before returning on error.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

doesn't apply

--=20
balbi

--iS0NVSKxQTKrudDq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJSHQaHAAoJEIaOsuA1yqREfzEP/0sWgl5cP9egBKGt0cEYWaMw
JzvGrRQiw1lqXxgkOto90qMJ37trb1fl9W57H72xiqxWPnqNDkZACgxFrAKCoip+
9O2ApSaNECGMAA03WOxWyx7WvXKKPFEAj/qdZro1Rk2gxmzngUa6+zpIUbGkXAR3
ODllqKEB8eQFLDndIZ90HNvnLFRYLcYJYydi15wESMx13/9f4wt3xIQLsdJJGsmE
kbbGPZmrdpSGl8QCsIuGA3OPchnXHEWAmBzYAhjkH5K2DhL4/2JIRqiZmQSDFQxV
KKS+CbnUU2rBGnwOVdvQhKH6Rm5ciNo6JIXcJ6/WCl+Y303Jy8vI1L8XOR34yi33
sKRSdUDGmvJoWltgL+5PWbNFtQo0BOW8FYduNzQOSxlgfPjWw+Fq7UPZTZGL7pqR
50PECOVDpL131TaU+PSmn5fL+ChTeOf3QA+PLqzrBP2HiX6mllUkm0M9hbazugWa
NdbdIg2oGGzkMCYWMMxqKAll7sSYPGYrXh56H/B4cXiLjXZnbiKdQLIxLGCKYF2X
KQEnZbP0ES7zpcjplrz7rYqyZRgMjACIXLJcFsaXXqQrTmeyrcdq1t9IcYbeS05F
fqFpIZrE9c8EcrSjTL2Sww2y176+kFwb6UW9RxMXluhLn/Z9KVLPJ/LM7jPLJZh3
zfJ0euO2Y4lA008EnkMa
=Wbv8
-----END PGP SIGNATURE-----

--iS0NVSKxQTKrudDq--
