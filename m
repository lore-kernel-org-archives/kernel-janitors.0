From: Nicolas Ferre <nicolas.ferre@atmel.com>
Date: Mon, 14 Nov 2016 14:49:58 +0000
Subject: Re: [patch] spi: atmel: fix indenting in atmel_spi_gpio_cs()
Message-Id: <aa6d8d17-13f7-632c-babb-2a7c062155f1@atmel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161114142644.GA6179@mwanda>
In-Reply-To: <20161114142644.GA6179@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 14/11/2016 =E0 15:26, Dan Carpenter a =E9crit :
> These lines were indented one extra tab.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oh yes: sorry for that:
Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks, Dan. Best regards,

> diff --git a/drivers/spi/spi-atmel.c b/drivers/spi/spi-atmel.c
> index d3affa6..b293149 100644
> --- a/drivers/spi/spi-atmel.c
> +++ b/drivers/spi/spi-atmel.c
> @@ -1510,15 +1510,15 @@ static int atmel_spi_gpio_cs(struct platform_devi=
ce *pdev)
>  		int cs_gpio =3D of_get_named_gpio(pdev->dev.of_node,
>  						"cs-gpios", i);
> =20
> -			if (cs_gpio =3D -EPROBE_DEFER)
> -				return cs_gpio;
> -
> -			if (gpio_is_valid(cs_gpio)) {
> -				ret =3D devm_gpio_request(&pdev->dev, cs_gpio,
> -							dev_name(&pdev->dev));
> -				if (ret)
> -					return ret;
> -			}
> +		if (cs_gpio =3D -EPROBE_DEFER)
> +			return cs_gpio;
> +
> +		if (gpio_is_valid(cs_gpio)) {
> +			ret =3D devm_gpio_request(&pdev->dev, cs_gpio,
> +						dev_name(&pdev->dev));
> +			if (ret)
> +				return ret;
> +		}
>  	}
> =20
>  	return 0;
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
