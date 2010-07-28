From: Henrik Kretzschmar <henne@nachtwindheim.de>
Date: Wed, 28 Jul 2010 19:02:08 +0000
Subject: Re: [PATCH] video/w100fb: ignore void return value / fix build failure
Message-Id: <4C507EB0.8050208@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201007282029.52989.PeterHuewe@gmx.de>
In-Reply-To: <201007282029.52989.PeterHuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

Am 28.07.2010 20:29, schrieb Peter H=FCwe:
> From: Peter Huewe <peterhuewe@gmx.de>
>=20
> This patch fixes a build failure [1] (error: void value not ignored as
> it ought to be) by removing an assignment of a void return value.
> The functionality of the code is not changed.
>=20
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
Ached-by: Henrik Kretzschmar <henne@nachtwindheim.de>
> ---
> KernelVersion: linux-next-20100728
> References:
> [1] http://kisskb.ellerman.id.au/kisskb/buildresult/2980912/
>=20
>  drivers/video/w100fb.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/video/w100fb.c b/drivers/video/w100fb.c
> index e66b8b1..d8b12c3 100644
> --- a/drivers/video/w100fb.c
> +++ b/drivers/video/w100fb.c
> @@ -858,9 +858,9 @@ unsigned long w100fb_gpio_read(int port)
>  void w100fb_gpio_write(int port, unsigned long value)
>  {
>  	if (port=3DW100_GPIO_PORT_A)
> -		value =3D writel(value, remapped_regs + mmGPIO_DATA);
> +		writel(value, remapped_regs + mmGPIO_DATA);
>  	else
> -		value =3D writel(value, remapped_regs + mmGPIO_DATA2);
> +		writel(value, remapped_regs + mmGPIO_DATA2);
>  }
>  EXPORT_SYMBOL(w100fb_gpio_read);
>  EXPORT_SYMBOL(w100fb_gpio_write);

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
