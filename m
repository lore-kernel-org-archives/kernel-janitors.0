From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Date: Wed, 29 Oct 2014 20:01:13 +0000
Subject: Re: [patch] i40e: precedence bug in i40e_get_pfc_delay()
Message-Id: <1414612873.2420.60.camel@jtkirshe-mobl>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-86iV/rNFU0BPYOI4Q4RD"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141029161028.GE5290@mwanda>
In-Reply-To: <20141029161028.GE5290@mwanda>
To: kernel-janitors@vger.kernel.org


--=-86iV/rNFU0BPYOI4Q4RD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2014-10-29 at 19:10 +0300, Dan Carpenter wrote:
> The ">>" operation has higher precedence than the "&" operation.  Also
> the casting is not needed.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is static checker work and I haven't tested it on real hardware.

As Shannon has already mentioned, we found this internally and I think
that I already have a patch in the queue to resolve this.  Thank you,
and if I find I am incorrect and we do not already have a patch
resolving this, I will add your patch to the queue.  Thank you Dan!

--=-86iV/rNFU0BPYOI4Q4RD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJUUUeJAAoJEOVv75VaS+3O5dwP/RShWVTZt+Y3gmb49m55PSGc
DXwkOGy4yJgkdy9LJ1OwZxlOZFQVc59/4menZpGX+4CtQezo9fQVPPIrN5cXTlm3
eaObN6nv1BQqwkOgVpezNH1rarvNcFh8tOh8YdHbhAhZAlCvFaK4XMSD34dMtAt8
51mjdNOirycbexyt9PP75JQh3J+asX3i78h9orTeb73h4UH8On/V1v2ke0dwBGUL
Nix4Bq1cAGlJt5M+NnpWuyeJNpE4taNlCc70SDsWbKaLvRjNKmUQE8ZlGDeoxlDZ
MrF2niyijcHQFe4hJtn1lykgVHJtwCZjQQ66lWJNbbxZM7idwqqV6MbC167hIGdp
VUFkIrWLtVhjAu3C10fKgFEOGJaNkfSdYXn+vpeGzus/wSaCsLL6d7YLdM92YTc4
d5evvBl0nPOcKsoYIAZJOp4NPpHqOpP/siLzlzhPWIIuYaUzSsc10bg2H8ZxQEHb
DPUIBVPR9FOfdeILS6Kw7PUq/7wuTMAXrI2E/9pFObhileomZf6RX3SuTtOVp7Mp
ui3RSe/Hmt2uENpvwW3CLHigz3pZqOYusn36LdGPqK0sYuYWXJphGU48PorLKblZ
lMIotpgwNnssiEPZF4Ris/CnHCslZI3VVJnIBdaHMMC0OpgAS9TS1lRdGW9ox4DX
U7GzeeMa9i3dYozPtHhV
=7pXq
-----END PGP SIGNATURE-----

--=-86iV/rNFU0BPYOI4Q4RD--

