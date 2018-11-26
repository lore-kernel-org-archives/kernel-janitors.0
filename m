From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Mon, 26 Nov 2018 08:21:03 +0000
Subject: Re: [PATCH] media: cedrus: Fix a NULL vs IS_ERR() check
Message-Id: <7adca9862d2dafdc7cac10c878ff314eb7bc0c03.camel@bootlin.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-PtdwHGxsjhmWJwQTQhiY"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181126081044.yz5tenssdbt7mugb@kili.mountain>
In-Reply-To: <20181126081044.yz5tenssdbt7mugb@kili.mountain>
To: linux-arm-kernel@lists.infradead.org


--=-PtdwHGxsjhmWJwQTQhiY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2018-11-26 at 11:10 +0300, Dan Carpenter wrote:
> The devm_ioremap_resource() function doesn't return NULL pointers, it
> returns error pointers.

Good catch and thanks for the patch!

> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/sta=
ging/media/sunxi/cedrus/cedrus_hw.c
> index 32adbcbe6175..07520a2ce179 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -255,10 +255,10 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
> =20
>  	res =3D platform_get_resource(dev->pdev, IORESOURCE_MEM, 0);
>  	dev->base =3D devm_ioremap_resource(dev->dev, res);
> -	if (!dev->base) {
> +	if (IS_ERR(dev->base)) {
>  		v4l2_err(&dev->v4l2_dev, "Failed to map registers\n");
> =20
> -		ret =3D -ENOMEM;
> +		ret =3D PTR_ERR(dev->base);
>  		goto err_sram;
>  	}
> =20
--=20
Paul Kocialkowski, Bootlin (formerly Free Electrons)
Embedded Linux and kernel engineering
https://bootlin.com

--=-PtdwHGxsjhmWJwQTQhiY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAlv7rO8ACgkQ3cLmz3+f
v9F82Qf+KVGghWjDZZyrlXhtDrg2T0YuUlJlhHx5uHsIuejxmba3TLVPB6KkslIE
8/s2FqS3sNTABNa+kz29H8OiC0dtNp/KNRuGY0K3VhjLJjK/CuWdwjarMMbrbI2A
tectKYX9iFFWcsGMM2Z46Hswnw6ek3PH6mdTRBokdUVCEhFd56I1zuq0YN5D4oOV
ESmtJ8FY/OrxXdwWkJIwcsbzsC+RohBdXcTL9f/LP1nvoI3DHWvZquDQaWppxgAI
oA3gU7qUQkWSo7u14yK/Ea6qijGfCxS6MktR+utDl40cIyk2UyWhcZxFJ/4SXbwA
EQkvMtBSAGNYc01yBgzLaz2BTI+lyg==
=WaHe
-----END PGP SIGNATURE-----

--=-PtdwHGxsjhmWJwQTQhiY--
