From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Sun, 18 Nov 2018 00:56:57 +0000
Subject: Re: [PATCH -next] thermal: armada: Use PTR_ERR_OR_ZERO in armada_thermal_probe_legacy()
Message-Id: <268a90c1-14f9-68bf-ee1a-886d7f4d4e42@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542118425-20298-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542118425-20298-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 13/11/2018 15:13, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>


> ---
>  drivers/thermal/armada_thermal.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_th=
ermal.c
> index 92f67d40..4b36a30 100644
> --- a/drivers/thermal/armada_thermal.c
> +++ b/drivers/thermal/armada_thermal.c
> @@ -545,20 +545,14 @@ static int armada_thermal_probe_legacy(struct platf=
orm_device *pdev,
> =20
>  	priv->syscon =3D devm_regmap_init_mmio(&pdev->dev, base,
>  					     &armada_thermal_regmap_config);
> -	if (IS_ERR(priv->syscon))
> -		return PTR_ERR(priv->syscon);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(priv->syscon);
>  }
> =20
>  static int armada_thermal_probe_syscon(struct platform_device *pdev,
>  				       struct armada_thermal_priv *priv)
>  {
>  	priv->syscon =3D syscon_node_to_regmap(pdev->dev.parent->of_node);
> -	if (IS_ERR(priv->syscon))
> -		return PTR_ERR(priv->syscon);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(priv->syscon);
>  }
> =20
>  static void armada_set_sane_name(struct platform_device *pdev,
>=20
>=20
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
