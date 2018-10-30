From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 30 Oct 2018 16:54:53 +0000
Subject: Re: [PATCH] thermal: broadcom: use devm_thermal_zone_of_sensor_register
Message-Id: <14095608-e080-d907-c9ea-788a3abe1645@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540915731-22312-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540915731-22312-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On 30/10/2018 17:08, Julia Lawall wrote:
> Using devm_thermal_zone_of_sensor_register allows to simplify some
> error handling code, drop a label, and drop the remove function.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

> ---
>=20
> This patch is completely orthogonal to the recent constification
> patch.
>=20
>  drivers/thermal/broadcom/brcmstb_thermal.c |   24 ++++------------------=
--
>  1 file changed, 4 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal=
/broadcom/brcmstb_thermal.c
> index 1919f91fa756..956eef8717bb 100644
> --- a/drivers/thermal/broadcom/brcmstb_thermal.c
> +++ b/drivers/thermal/broadcom/brcmstb_thermal.c
> @@ -329,7 +329,8 @@ static int brcmstb_thermal_probe(struct platform_devi=
ce *pdev)
>  	priv->dev =3D &pdev->dev;
>  	platform_set_drvdata(pdev, priv);
> =20
> -	thermal =3D thermal_zone_of_sensor_register(&pdev->dev, 0, priv, &of_op=
s);
> +	thermal =3D devm_thermal_zone_of_sensor_register(&pdev->dev, 0, priv,
> +						       &of_ops);
>  	if (IS_ERR(thermal)) {
>  		ret =3D PTR_ERR(thermal);
>  		dev_err(&pdev->dev, "could not register sensor: %d\n", ret);
> @@ -341,40 +342,23 @@ static int brcmstb_thermal_probe(struct platform_de=
vice *pdev)
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		dev_err(&pdev->dev, "could not get IRQ\n");
> -		ret =3D irq;
> -		goto err;
> +		return irq;
>  	}
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					brcmstb_tmon_irq_thread, IRQF_ONESHOT,
>  					DRV_NAME, priv);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "could not request IRQ: %d\n", ret);
> -		goto err;
> +		return ret;
>  	}
> =20
>  	dev_info(&pdev->dev, "registered AVS TMON of-sensor driver\n");
> =20
>  	return 0;
> -
> -err:
> -	thermal_zone_of_sensor_unregister(&pdev->dev, thermal);
> -	return ret;
> -}
> -
> -static int brcmstb_thermal_exit(struct platform_device *pdev)
> -{
> -	struct brcmstb_thermal_priv *priv =3D platform_get_drvdata(pdev);
> -	struct thermal_zone_device *thermal =3D priv->thermal;
> -
> -	if (thermal)
> -		thermal_zone_of_sensor_unregister(&pdev->dev, priv->thermal);
> -
> -	return 0;
>  }
> =20
>  static struct platform_driver brcmstb_thermal_driver =3D {
>  	.probe =3D brcmstb_thermal_probe,
> -	.remove =3D brcmstb_thermal_exit,
>  	.driver =3D {
>  		.name =3D DRV_NAME,
>  		.of_match_table =3D brcmstb_thermal_id_table,
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
