From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date: Thu, 14 Jan 2021 08:49:02 +0000
Subject: Re: [PATCH][next] media: i2c: fix spelling mistakes: "enpoint" -> "endpoint"
Message-Id: <YAAFfh1iytVAvJK2@aptenodytes>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DMj+727u0fJbYvjc"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210113100517.10959-1-colin.king@canonical.com>
In-Reply-To: <20210113100517.10959-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, =?utf-8?B?S8OpdmluIEwnaMO0cGl0YWw=?= <kevin.lhopital@bootlin.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


--DMj+727u0fJbYvjc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed 13 Jan 21, 10:05, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are two spelling mistakes in dev_err messages. Fix these.

Thanks for the patch!

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/media/i2c/ov5648.c | 2 +-
>  drivers/media/i2c/ov8865.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> index 609aa67b54ce..46ad0a539853 100644
> --- a/drivers/media/i2c/ov5648.c
> +++ b/drivers/media/i2c/ov5648.c
> @@ -2453,7 +2453,7 @@ static int ov5648_probe(struct i2c_client *client)
> =20
>  	handle =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>  	if (!handle) {
> -		dev_err(dev, "unable to find enpoint node\n");
> +		dev_err(dev, "unable to find endpoint node\n");
>  		return -EINVAL;
>  	}
> =20
> diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
> index fda5a55979aa..fd5be8ef079c 100644
> --- a/drivers/media/i2c/ov8865.c
> +++ b/drivers/media/i2c/ov8865.c
> @@ -2799,7 +2799,7 @@ static int ov8865_probe(struct i2c_client *client)
> =20
>  	handle =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>  	if (!handle) {
> -		dev_err(dev, "unable to find enpoint node\n");
> +		dev_err(dev, "unable to find endpoint node\n");
>  		return -EINVAL;
>  	}
> =20
> --=20
> 2.29.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--DMj+727u0fJbYvjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmAABX4ACgkQ3cLmz3+f
v9H8RAf/fVSXIjjtgpBr2fjzagLAkOv9OO1WvvSMheagyn+1E+t74WB15cEKvTAb
IZ1C+iNFkkodpmp2bX2YxptrBtLIvxZ6PpuxTp1prS/X0f0yHd2emEl6i+vgBlvi
MlFNDNRihyNARSeSwtJUmAOo8nxYwwvKnGIzGzIo6hYFFoxvfxD/H1DoFflfbVXK
1CeI2QeMZu0ZUvHQxCr9/o6uQspnrQoWw38x935H2NYDdQjarKwWp07kLvsnTYAn
EReG/Y8IK5y7J9VyPx5ig05WzHDkk/J4ngUoOzcWeg+pn4/+TvMrUyDZOZ++M08C
MbsldPtZX+e5JUEFJvdw9hP8QTeBGw==
=8PNC
-----END PGP SIGNATURE-----

--DMj+727u0fJbYvjc--
