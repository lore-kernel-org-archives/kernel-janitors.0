From: William Breathitt Gray <vilhelm.gray@gmail.com>
Date: Mon, 27 Jul 2020 12:28:25 +0000
Subject: Re: [PATCH] counter: microchip-tcb-capture: check the correct variable
Message-Id: <20200727122825.GA5614@shinobu>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="IJpNTDwzlM2Ie8A6"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200727112316.GG389488@mwanda>
In-Reply-To: <20200727112316.GG389488@mwanda>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Kamel Bouhara <kamel.bouhara@bootlin.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2020 at 02:23:16PM +0300, Dan Carpenter wrote:
> This should be testing "regmap" instead of "priv->regmap".  The
> "priv->regmap" variable is always zero so it's not an error pointer.
>=20
> Fixes: 106b104137fd ("counter: Add microchip TCB capture counter")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

> ---
> The commit 106b104137fd ("counter: Add microchip TCB capture counter")
> doesn't use the correct patch prefix.  This is a common mistake for the
> the first commit which adds the driver.  There is no kernel wide
> standard for patch prefixes so it's difficult for people sending fixes
> to know the correct prefix should be.
>=20
>  drivers/counter/microchip-tcb-capture.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/mi=
crochip-tcb-capture.c
> index f7b7743ddb94..b7b252c5addf 100644
> --- a/drivers/counter/microchip-tcb-capture.c
> +++ b/drivers/counter/microchip-tcb-capture.c
> @@ -320,8 +320,8 @@ static int mchp_tc_probe(struct platform_device *pdev)
>  	}
> =20
>  	regmap =3D syscon_node_to_regmap(np->parent);
> -	if (IS_ERR(priv->regmap))
> -		return PTR_ERR(priv->regmap);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> =20
>  	/* max. channels number is 2 when in QDEC mode */
>  	priv->num_channels =3D of_property_count_u32_elems(np, "reg");
> --=20
> 2.27.0
>=20

--IJpNTDwzlM2Ie8A6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEk5I4PDJ2w1cDf/bghvpINdm7VJIFAl8eyEoACgkQhvpINdm7
VJK0WA/+NeMk3F3w6l1WBuWUgdRiZ7HzmFUqDleCv9qgVbPynOPQH7yYrf3TcsBd
8KoRrfJLXGRwlzZr1B9kGGbQF4C9lve8Zt3yzq4nlZkvt0IoKgfIUza0L/1thbmC
cN7YXZQMshUEQd+aMQ2jn0efwxTyN3dPfV97u8nGeiA6ZIdaH8R1c+myrgN/CgXF
+cOiATSqcTr8Zb+1baIaxlI0vIH80/P8Aid47nhe5hzJMUb3ZBuoUTVdZz9f3mXf
Ljx1PlUIr90YtPuQ6x88K/7jGtN3iJg3Y7xl9vkulvJm2ABYGQUaJVjasG+8e5vb
Z2+8eyV6MaL9Hd94yXudmljFdoxF0ecqrc8qJstnD+A9h45+jB3CqLw7HrEYziUn
UMRQefVumrlSxUENNBbW5iHdBZXzsxkNXXJYJbPCE/TEc0Dj4glogqqFsLjOjLw7
zsWSbqmG5Oa8pVFUiRespqL+DIgGDrOMhQ6NJVITLJmI0pkNbPHGSDXBtrVgoT3v
mPjzP5DihRxhLMR0jvX0Zz7M8fhB7G++tBb/RgBG0vfbGBiGgp1e0EB58WbHAuXp
+Ldvsb9HcRftlyHOFygBfrFCRzmAq3V/fPvZOWhqYD2mZDJpG4DbtmC0dc0eKFJ/
oO6tL9pL92d0qikvfC52qBJwEVYmbvFi9HRB+DDegisA/c5YskY=
=sSZ0
-----END PGP SIGNATURE-----

--IJpNTDwzlM2Ie8A6--
