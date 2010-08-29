From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sun, 29 Aug 2010 15:42:08 +0000
Subject: Re: [PATCH 2/7] drivers/serial/mpc52xx_uart.c: Add of_node_put to
Message-Id: <20100829154208.GA4647@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	<1283075566-27441-3-git-send-email-julia@diku.dk>
In-Reply-To: <1283075566-27441-3-git-send-email-julia@diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 29, 2010 at 11:52:41AM +0200, Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_find_compatible_node.
>=20
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @r exists@
> local idexpression x;
> expression E,E1;
> statement S;
> @@
>=20
> *x =3D=20
> (of_find_node_by_path
> |of_find_node_by_name
> |of_find_node_by_phandle
> |of_get_parent
> |of_get_next_parent
> |of_get_next_child
> |of_find_compatible_node
> |of_match_node
> )(...);
> ...
> if (x =3D=3D NULL) S
> <... when !=3D x =3D E
> *if (...) {
>   ... when !=3D of_node_put(x)
>       when !=3D if (...) { ... of_node_put(x); ... }
> (
>   return <+...x...+>;
> |
> *  return ...;
> )
> }
> ...>
> of_node_put(x);
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

adding ppc-list to CC.

>=20
> ---
>  drivers/serial/mpc52xx_uart.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/serial/mpc52xx_uart.c b/drivers/serial/mpc52xx_uart.c
> index 8dedb26..c4399e2 100644
> --- a/drivers/serial/mpc52xx_uart.c
> +++ b/drivers/serial/mpc52xx_uart.c
> @@ -500,6 +500,7 @@ static int __init mpc512x_psc_fifoc_init(void)
>  	psc_fifoc =3D of_iomap(np, 0);
>  	if (!psc_fifoc) {
>  		pr_err("%s: Can't map FIFOC\n", __func__);
> +		of_node_put(np);
>  		return -ENODEV;
>  	}
> =20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--zYM0uCDKw75PZbzx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkx6f9AACgkQD27XaX1/VRvCagCfaXB7s7ylnvsqXSENeL/ElY2F
Fm8An17DInsA6VeUdGFB3XFlG1Si+Yj5
=FU2M
-----END PGP SIGNATURE-----

--zYM0uCDKw75PZbzx--
