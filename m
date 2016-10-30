From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 30 Oct 2016 11:53:02 +0000
Subject: Re: [PATCH] drm/sun4i: Fix error handling
Message-Id: <c15282b4-e88a-06b1-527d-96aedce8b7eb@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030084926.15303-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030084926.15303-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: maxime.ripard@free-electrons.com, airlied@linux.ie, wens@csie.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

BTW, memory allocation in 'sun4i_layers_init()' looks spurious,=20
especially the use of 'layer' in the for loop.
Just my 2 cents.


I also forgot to say that we could propagate the error code returned by=20
sun4i_layers_init instead of returning -EINVAL unconditionally

CJ




Le 30/10/2016 =E0 09:49, Christophe JAILLET a =E9crit :
> 'sun4i_layers_init()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
>
> Signed-off-by: Christophe JAILLET<christophe.jaillet@wanadoo.fr>
> ---
>   drivers/gpu/drm/sun4i/sun4i_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/su=
n4i_drv.c
> index 9776f0305834..628712e6edd6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -143,7 +143,7 @@ static int sun4i_drv_bind(struct device *dev)
>  =20
>   	/* Create our layers */
>   	drv->layers =3D sun4i_layers_init(drm);
> -	if (!drv->layers) {
> +	if (IS_ERR(drv->layers)) {
>   		dev_err(drm->dev, "Couldn't create the planes\n");
>   		ret =3D -EINVAL;
>   		goto free_drm;


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
