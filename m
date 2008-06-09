From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 09 Jun 2008 13:02:14 +0000
Subject: Re: [PATCH 1/4] arch/powerpc: add missing of_node_put
Message-Id: <20080609230214.ad6dca86.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Mon__9_Jun_2008_23_02_14_+1000_N=6vYmNszaIZm8Hs"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806091418340.16009@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806091418340.16009@ask.diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@ozlabs.org, kernel-janitors@vger.kernel.org, paulus@samba.org, linux-kernel@vger.kernel.org

--Signature=_Mon__9_Jun_2008_23_02_14_+1000_N=6vYmNszaIZm8Hs
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Jun 2008 14:20:04 +0200 (CEST) Julia Lawall <julia@diku.dk> wrote:
>
> From: Julia Lawall <julia@diku.dk>
>=20
> of_node_put is needed before discarding a value received from
> of_find_node_by_type, eg in error handling code.
>=20
> The semantic patch that makes the change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>=20
> // <smpl>
> @@
> struct device_node *n;
> struct device_node *n1;
> struct device_node *n2;
> statement S;
> identifier f1,f2;
> expression E1,E2;
> constant C;
> @@
>=20
> n =3D of_find_node_by_type(...)
> ...
> if (!n) S
> ... when !=3D of_node_put(n)
>     when !=3D n1 =3D f1(n,...)
>     when !=3D E1 =3D n
>     when any
>     when strict
> (
> + of_node_put(n);
>   return -C;
> |
>   of_node_put(n);
> |
>   n2 =3D f2(n,...)
> |
>   E2 =3D n
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

--Signature=_Mon__9_Jun_2008_23_02_14_+1000_N=6vYmNszaIZm8Hs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkhNKdYACgkQTgG2atn1QN/+0wCeJKxpRtOfAv90OEMbebOK1aTO
rDEAoIo9qAqf94KWekVVmhW3dlCKgLAu
=cV31
-----END PGP SIGNATURE-----

--Signature=_Mon__9_Jun_2008_23_02_14_+1000_N=6vYmNszaIZm8Hs--
