From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 10 Feb 2008 22:22:24 +0000
Subject: Re: [PATCH 2/8] drivers/block: Use FIELD_SIZEOF
Message-Id: <20080211092224.4181928b.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Mon__11_Feb_2008_09_22_24_+1100_VqWY6yVHBSQ4eUZw"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802102108000.23906@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802102108000.23906@ask.diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--Signature=_Mon__11_Feb_2008_09_22_24_+1100_VqWY6yVHBSQ4eUZw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 10 Feb 2008 21:08:49 +0100 (CET) Julia Lawall <julia@diku.dk> wrote:
>
> From: Julia Lawall <julia@diku.dk>
>=20
> Robert P.J. Day proposed to use the macro FIELD_SIZEOF in replace of code
> that matches its definition.
>=20
> The modification was made using the following semantic patch
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @haskernel@
> @@
>=20
> #include <linux/kernel.h>
>=20
> @depends on haskernel@
> type t;
> identifier f;
> @@
>=20
> - (sizeof(((t*)0)->f))
> + FIELD_SIZEOF(t, f)
>=20
> @depends on haskernel@
> type t;
> identifier f;
> @@
>=20
> - sizeof(((t*)0)->f)
> + FIELD_SIZEOF(t, f)
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__11_Feb_2008_09_22_24_+1100_VqWY6yVHBSQ4eUZw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHr3kkTgG2atn1QN8RAsIIAJoC1YVTppVwPlh/POyn59J6fpQEQgCfb6gy
20Lr+YFGUZNp/UemKhsA874=
=DbZf
-----END PGP SIGNATURE-----

--Signature=_Mon__11_Feb_2008_09_22_24_+1100_VqWY6yVHBSQ4eUZw--
