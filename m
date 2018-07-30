From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, 30 Jul 2018 14:14:53 +0000
Subject: Re: [PATCH] thermal: armada: fix incorrect check for drvdata allocation failure
Message-Id: <cad2f4c3-77c1-c233-975d-ed72fd640163@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180730122716.6267-1-colin.king@canonical.com>
In-Reply-To: <20180730122716.6267-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Hi Colin,

On 30/07/2018 14:27, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> Currently the drvdata allocation failure is being incorrectly checked by
> checking priv and not drvdata.  Fix this and also free priv to fix a
> memory leak.
>=20
> Detected by Coverity Scan, CID#1472102 ("Logically dead code")
>=20
> Fixes: c9899c183921 ("thermal: armada: use the resource managed registrat=
ion helper alternative")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/thermal/armada_thermal.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_th=
ermal.c
> index 4164a5a4e480..b164fd9f21ac 100644
> --- a/drivers/thermal/armada_thermal.c
> +++ b/drivers/thermal/armada_thermal.c
> @@ -611,8 +611,10 @@ static int armada_thermal_probe(struct platform_devi=
ce *pdev)
>  		return -ENOMEM;
> =20
>  	drvdata =3D devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!priv)
> +	if (!drvdata) {
> +		devm_kfree(&pdev->dev, priv);

This is not necessary, resources will be free when the driver is
destroyed after the probe fails.

>  		return -ENOMEM;
> +	}
> =20
>  	priv->dev =3D &pdev->dev;
>  	priv->data =3D (struct armada_thermal_data *)match->data;

Thanks for sending this fix. However, another fix was already submitted
for this.

  -- Daniel




--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
