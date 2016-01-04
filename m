From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 04 Jan 2016 13:48:48 +0000
Subject: Re: [patch] drm/etnaviv: unlock on error in etnaviv_gem_get_iova()
Message-Id: <568A7840.6020205@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104131024.GA13563@mwanda>
In-Reply-To: <20160104131024.GA13563@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@arm.linux.org.uk>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

> We have to drop a lock before returning -ENOMEM here.
>=20
> Fixes: a8c21a5451d8 ('drm/etnaviv: add initial etnaviv DRM driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etna=
viv/etnaviv_gem.c
> index 8d6f859..9f77c3b 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -305,8 +305,10 @@ int etnaviv_gem_get_iova(struct etnaviv_gpu *gpu,
>  	mapping =3D etnaviv_gem_get_vram_mapping(etnaviv_obj, NULL);
>  	if (!mapping) {
>  		mapping =3D kzalloc(sizeof(*mapping), GFP_KERNEL);
> -		if (!mapping)
> -			return -ENOMEM;
> +		if (!mapping) {
> +			ret =3D -ENOMEM;
> +			goto out;
> +		}
> =20
>  		INIT_LIST_HEAD(&mapping->scan_node);
>  		mapping->object =3D etnaviv_obj;

How do you think about to reuse the jump label "unlock" there
like it is used in other source files?
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/drive=
rs/gpu/drm/etnaviv/etnaviv_gem.c?id=A8c21a5451d831e67b7a6fb910f9ca8bc7b4355=
4#n263

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
