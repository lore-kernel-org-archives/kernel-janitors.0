From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Fri, 16 May 2014 19:24:51 +0000
Subject: Re: [PATCH v2] ARM: imx: fix error handling
Message-Id: <20140516192451.GP16662@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400234045-6022-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1400234045-6022-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Hello Emil,

IMHO the subject is too general. Maybe better use:

	ARM: imx: fix error handling in ipu device registration

On Fri, May 16, 2014 at 11:54:05AM +0200, Emil Goode wrote:
> If we fail to allocate struct platform_device pdev we
> dereference it after the goto label err.
>=20
> I have rearranged the error handling a bit to fix the issue
> and also make it more clear.
>=20
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> v2: Changed to return -ENOMEM instead of ret where possible and
>     updated the subject line.
>=20
>  arch/arm/mach-imx/devices/platform-ipu-core.c |   22 +++++++++++++------=
---
>  1 file changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/arm/mach-imx/devices/platform-ipu-core.c b/arch/arm/mac=
h-imx/devices/platform-ipu-core.c
> index fc4dd7c..68f2a4a 100644
> --- a/arch/arm/mach-imx/devices/platform-ipu-core.c
> +++ b/arch/arm/mach-imx/devices/platform-ipu-core.c
> @@ -77,34 +77,38 @@ struct platform_device *__init imx_alloc_mx3_camera(
> =20
>  	pdev =3D platform_device_alloc("mx3-camera", 0);
>  	if (!pdev)
> -		goto err;
> +		return ERR_PTR(-ENOMEM);
> =20
>  	pdev->dev.dma_mask =3D kmalloc(sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
>  	if (!pdev->dev.dma_mask)
> -		goto err;
> +		goto put_pdev;
> =20
>  	*pdev->dev.dma_mask =3D DMA_BIT_MASK(32);
>  	pdev->dev.coherent_dma_mask =3D DMA_BIT_MASK(32);
> =20
>  	ret =3D platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
>  	if (ret)
> -		goto err;
> +		goto free_dma_mask;
> =20
>  	if (pdata) {
>  		struct mx3_camera_pdata *copied_pdata;
> =20
>  		ret =3D platform_device_add_data(pdev, pdata, sizeof(*pdata));
> -		if (ret) {
> -err:
> -			kfree(pdev->dev.dma_mask);
> -			platform_device_put(pdev);
> -			return ERR_PTR(-ENODEV);
> -		}
> +		if (ret)
> +			goto free_dma_mask;
> +
>  		copied_pdata =3D dev_get_platdata(&pdev->dev);
>  		copied_pdata->dma_dev =3D &imx_ipu_coredev->dev;
>  	}
> =20
>  	return pdev;
> +
> +free_dma_mask:
> +	kfree(pdev->dev.dma_mask);
> +put_pdev:
> +	platform_device_put(pdev);
> +
> +	return ERR_PTR(ret);
>  }
I didn't check if it is easily possible, but converting this file to use
platform_device_register_full might simplify it considerably.

I'm not sure this fix is critical, because the problem happens if an
allocation during boot fails. But still, if you want to get this fix
into a stable release, you should simplify it, i.e. don't do the code
reorganisations. (Also the "more clear" part seems to be subjective, I
like the error handling better as it is now. But that might only be me.)

Are you using this code? I thought arch/arm/mach-imx/devices to be dead
as it is unused on dt platforms.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
