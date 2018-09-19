From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 19 Sep 2018 11:35:22 +0000
Subject: Re: [PATCH] thermal: armada: fix a test in probe()
Message-Id: <20180919133522.7b0393c6@xps13>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180919103500.GB9238@mwanda>
In-Reply-To: <20180919103500.GB9238@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Dan,

Dan Carpenter <dan.carpenter@oracle.com> wrote on Wed, 19 Sep 2018
13:35:00 +0300:

> The platform_get_resource() function doesn't return error pointers, it
> returns NULL on error.
>=20
> Fixes: 3d4e51844a4e ("thermal: armada: convert driver to syscon register =
accesses")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_th=
ermal.c
> index 2c2f6d93034e..92f67d40f2e9 100644
> --- a/drivers/thermal/armada_thermal.c
> +++ b/drivers/thermal/armada_thermal.c
> @@ -526,8 +526,8 @@ static int armada_thermal_probe_legacy(struct platfor=
m_device *pdev,
> =20
>  	/* First memory region points towards the status register */
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (IS_ERR(res))
> -		return PTR_ERR(res);
> +	if (!res)
> +		return -EIO;
> =20
>  	/*
>  	 * Edit the resource start address and length to map over all the

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
