From: Romain Perier <romain.perier@free-electrons.com>
Date: Fri, 16 Dec 2016 10:30:01 +0000
Subject: Re: [patch 2/3] spi: armada-3700: Set mode bits correctly
Message-Id: <aacbdfad-e29f-9af0-215c-93ee026db570@free-electrons.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161216093325.GA13942@elgon.mountain>
In-Reply-To: <20161216093325.GA13942-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

Le 16/12/2016 =E0 10:33, Dan Carpenter a =E9crit :
> We set SPI_RX_DUAL twice instead of setting SPI_TX_DUAL.
>
> Fixes: 5762ab71eb24 ("spi: Add support for Armada 3700 SPI Controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/spi/spi-armada-3700.c b/drivers/spi/spi-armada-3700.c
> index 5c7508dc6f0b..40491be3365f 100644
> --- a/drivers/spi/spi-armada-3700.c
> +++ b/drivers/spi/spi-armada-3700.c
> @@ -825,7 +825,7 @@ static int a3700_spi_probe(struct platform_device *pd=
ev)
>  	master->unprepare_message =3D a3700_spi_unprepare_message;
>  	master->set_cs =3D a3700_spi_set_cs;
>  	master->flags =3D SPI_MASTER_HALF_DUPLEX;
> -	master->mode_bits |=3D (SPI_RX_DUAL | SPI_RX_DUAL |
> +	master->mode_bits |=3D (SPI_RX_DUAL | SPI_TX_DUAL |
>  			      SPI_RX_QUAD | SPI_TX_QUAD);
>
>  	platform_set_drvdata(pdev, master);
>

Good catch,

Acked-by: Romain Perier <romain.perier@free-electrons.com>


Thanks,
Romain
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
