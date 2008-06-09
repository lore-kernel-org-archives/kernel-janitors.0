From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 09 Jun 2008 13:10:37 +0000
Subject: Re: [PATCH 4/4] drivers/macintosh/therm_adt746x.c: add missing
Message-Id: <20080609231037.b8aa7561.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Mon__9_Jun_2008_23_10_37_+1000_HKYG/_Axzb=z6d7v"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806091421200.16009@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806091421200.16009@ask.diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

--Signature=_Mon__9_Jun_2008_23_10_37_+1000_HKYG/_Axzb=z6d7v
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jun 2008 14:21:51 +0200 (CEST) Julia Lawall <julia@diku.dk> wrote:
>
> From: Julia Lawall <julia@diku.dk>
>=20
> of_node_put is needed before discarding a value received from
> of_find_node_by_name, eg in error handling code.
>=20
> The semantic patch that makes the change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @@
> struct device_node *n;
> struct device_node *n1;
> statement S;
> identifier f;
> expression E;
> constant C;
> @@
>=20
> n =3D of_find_node_by_name(...)
> ...
> if (!n) S
> ... when !=3D of_node_put(n)
>     when !=3D n1 =3D f(n,...)
>     when !=3D E =3D n
>     when any
>     when strict
> (
> + of_node_put(n);
>   return -C;
> |
>   of_node_put(n);
> |
>   n1 =3D f(n,...)
> |
>   E =3D n
> |
>   return ...;
> )
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__9_Jun_2008_23_10_37_+1000_HKYG/_Axzb=z6d7v
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhNK80ACgkQTgG2atn1QN9GFgCfQNgpZmLlg9arSLT+Y8mCW+Xt
9KYAn0p59n2uytbhr13aoaCRdP2w2nKa
=0s7l
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Jun_2008_23_10_37_+1000_HKYG/_Axzb=z6d7v--
