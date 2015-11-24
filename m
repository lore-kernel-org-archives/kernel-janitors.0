From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 24 Nov 2015 16:30:11 +0000
Subject: Re: [PATCH] mfd: constify da903x_chip_ops structure
Message-Id: <20151124163011.GA12874@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1447430631-10455-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1447430631-10455-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Support Opensource <support.opensource@diasemi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 13 Nov 2015, Julia Lawall wrote:

> The da903x_chip_ops structure is never modified, so declare it
> as const.
>=20
> Done with the help of Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/mfd/da903x.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/mfd/da903x.c b/drivers/mfd/da903x.c
> index 37e4426..f6a0459 100644
> --- a/drivers/mfd/da903x.c
> +++ b/drivers/mfd/da903x.c
> @@ -60,7 +60,7 @@ struct da903x_chip_ops {
>  struct da903x_chip {
>  	struct i2c_client	*client;
>  	struct device		*dev;
> -	struct da903x_chip_ops	*ops;
> +	const struct da903x_chip_ops *ops;
> =20
>  	int			type;
>  	uint32_t		events_mask;
> @@ -424,7 +424,7 @@ static irqreturn_t da903x_irq_handler(int irq, void *=
data)
>  	return IRQ_HANDLED;
>  }
> =20
> -static struct da903x_chip_ops da903x_ops[] =3D {
> +static const struct da903x_chip_ops da903x_ops[] =3D {
>  	[0] =3D {
>  		.init_chip	=3D da9030_init_chip,
>  		.unmask_events	=3D da9030_unmask_events,
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
