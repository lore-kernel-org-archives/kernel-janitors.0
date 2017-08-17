From: Boris Brezillon <boris.brezillon@free-electrons.com>
Date: Thu, 17 Aug 2017 13:03:54 +0000
Subject: Re: [PATCH] mtd: physmap_of: Fix resources leak in 'of_flash_probe()'
Message-Id: <20170817150354.56cdd114@bbrezillon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170806125501.10368-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170806125501.10368-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le Sun,  6 Aug 2017 14:55:01 +0200,
Christophe JAILLET <christophe.jaillet@wanadoo.fr> a =C3=A9crit :

> If 'of_flash_probe_gemini()' or 'of_flash_probe_versatile()' fail, we must
> reslease some resources, as already done in all error handling paths in
> this function.

Applied to l2-mtd/master.

Thanks,

Boris

>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mtd/maps/physmap_of_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/physmap_of_core.c b/drivers/mtd/maps/physma=
p_of_core.c
> index 62fa6836f218..2c8cc97ce019 100644
> --- a/drivers/mtd/maps/physmap_of_core.c
> +++ b/drivers/mtd/maps/physmap_of_core.c
> @@ -235,10 +235,10 @@ static int of_flash_probe(struct platform_device *d=
ev)
> =20
>  		err =3D of_flash_probe_gemini(dev, dp, &info->list[i].map);
>  		if (err)
> -			return err;
> +			goto err_out;
>  		err =3D of_flash_probe_versatile(dev, dp, &info->list[i].map);
>  		if (err)
> -			return err;
> +			goto err_out;
> =20
>  		err =3D -ENOMEM;
>  		info->list[i].map.virt =3D ioremap(info->list[i].map.phys,

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
