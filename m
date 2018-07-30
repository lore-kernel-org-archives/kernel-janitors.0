From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, 30 Jul 2018 06:25:36 +0000
Subject: Re: [PATCH -next v2] thermal: armada: fix copy-paste error in armada_thermal_probe()
Message-Id: <63a86b2d-7f57-a3d6-1bad-9b1a998883f0@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532918717-46808-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532918717-46808-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 30/07/2018 04:45, Wei Yongjun wrote:
> Fix the retrn value check which testing the wrong variable

s/retrn/return/

"which testing" is not correct.

I would suggest something like:

 "The return value from devm_kzalloc() is not checked correctly. The
test is done against a wrong variable. Fix it."


> in armada_thermal_probe().
>=20
> Fixes: e72f03ef2543 ("thermal: armada: use the resource managed registrat=
ion helper alternative")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 - > v2: fix typo of patch subject
> ---
>  drivers/thermal/armada_thermal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_th=
ermal.c
> index 8de4ba5..a269482 100644
> --- a/drivers/thermal/armada_thermal.c
> +++ b/drivers/thermal/armada_thermal.c
> @@ -610,7 +610,7 @@ static int armada_thermal_probe(struct platform_devic=
e *pdev)
>  		return -ENOMEM;
> =20
>  	drvdata =3D devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> -	if (!priv)
> +	if (!drvdata)
>  		return -ENOMEM;
> =20
>  	priv->dev =3D &pdev->dev;
>=20


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
