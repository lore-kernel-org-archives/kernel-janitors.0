From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Thu, 12 Jul 2012 17:30:40 +0000
Subject: Re: [patch] Extcon: Arizona: unlock on an error in arizona_micdet()
Message-Id: <20120712173040.GT7256@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="PPxI8paQBs33t8dK"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063602.GG11812@elgon.mountain>
In-Reply-To: <20120711063602.GG11812@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--PPxI8paQBs33t8dK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 11, 2012 at 09:36:02AM +0300, Dan Carpenter wrote:
> Smatch complains about this.  I don't have a way to test this, but it
> does look like we should unlock on error here.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acke-dby: Mark Brown <broonie@opensource.wolfsonmicro.com>

--PPxI8paQBs33t8dK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP/wmfAAoJEBus8iNuMP3dLGEP/iXdWVHyQ7lhe6XvIdZPWqjc
Hw53oO7ZZ2zQacLqQrg5wQypVnFEnSUbzXteUOjzDkJz5T6OmSM+fQX6wm2C7PFf
QS+K8h9ntFBZ9dqATv6C+5usEhwB4kAqsAiK3+uOwhvVPX5trjaDj19CniDJXCpE
7VBLn8pcD+XZHjQhR3aK9nhlN6rtHbvlg1CDjLrPNm+J4Z/w60og7cs2mrvK9aKy
DF3ux0+dBxpIpTNYozHLmdkhdLhXIsYk+BocNbvIxDOgs6yCdUwh7BjLC5Zv2vRl
WPMbFILpQl4NaLJf91UBvQfbwbYHOPVEdDHUBRbnsqr/l3dioAqgOuQosYD7kXez
bvJ6TMTS4iqex2XjbP98BPaYWoMolkrOULlpSMSB1cFpNuCMr9wbHBVBcGx2at/N
LtjtEFRJweuPFAP2qRVSBQ7qW3jqNKAisd7cm8QM6Qcxr0oiVkKgcQD/YJjx0U34
Cc0+azMxv0329ZsGly/2YJV/Stt+FKgZCSjK1sCqhqNiBV3A+nj5AA/0bKokBix4
fukwXL0G9DXus9J7p+7RBBTBlXfmODbdPx/OGo45sJhx7V/Vdh95l+pSsg2Ek8VM
gNnWgCF8QLGaWXiESZnhzqlZjQey+GwJ2jq90U1VrSKVmRPaxiiBlcbXqZLZgjsH
yngPgeWroNJd9nUhYCRs
=9xCq
-----END PGP SIGNATURE-----

--PPxI8paQBs33t8dK--
