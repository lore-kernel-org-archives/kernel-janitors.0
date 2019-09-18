From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Date: Wed, 18 Sep 2019 11:00:53 +0000
Subject: Re: [PATCH] media: rc: Use devm_platform_ioremap_resource() in tango_ir_probe()
Message-Id: <yw1xk1a56f8a.fsf@mansr.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <04df8450-1b15-55ec-91e7-7d72ffbedac7@web.de>
In-Reply-To: <04df8450-1b15-55ec-91e7-7d72ffbedac7@web.de> (Markus Elfring's
 message of "Wed, 18 Sep 2019 12:37:24 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Himanshu Jha <himanshujha199640@gmail.com>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>, linux-media@vger.kernel.org

Markus Elfring <Markus.Elfring@web.de> writes:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Sep 2019 12:30:18 +0200
>
> Simplify this function implementation by using a known wrapper function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Mans Rullgard <mans@mansr.com>

> ---
>  drivers/media/rc/tango-ir.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/rc/tango-ir.c b/drivers/media/rc/tango-ir.c
> index 451ec4e9dcfa..b8eb5bc4d9be 100644
> --- a/drivers/media/rc/tango-ir.c
> +++ b/drivers/media/rc/tango-ir.c
> @@ -157,20 +157,10 @@ static int tango_ir_probe(struct platform_device *p=
dev)
>  	struct device *dev =3D &pdev->dev;
>  	struct rc_dev *rc;
>  	struct tango_ir *ir;
> -	struct resource *rc5_res;
> -	struct resource *rc6_res;
>  	u64 clkrate, clkdiv;
>  	int irq, err;
>  	u32 val;
>
> -	rc5_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!rc5_res)
> -		return -EINVAL;
> -
> -	rc6_res =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	if (!rc6_res)
> -		return -EINVAL;
> -
>  	irq =3D platform_get_irq(pdev, 0);
>  	if (irq <=3D 0)
>  		return -EINVAL;
> @@ -179,11 +169,11 @@ static int tango_ir_probe(struct platform_device *p=
dev)
>  	if (!ir)
>  		return -ENOMEM;
>
> -	ir->rc5_base =3D devm_ioremap_resource(dev, rc5_res);
> +	ir->rc5_base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(ir->rc5_base))
>  		return PTR_ERR(ir->rc5_base);
>
> -	ir->rc6_base =3D devm_ioremap_resource(dev, rc6_res);
> +	ir->rc6_base =3D devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(ir->rc6_base))
>  		return PTR_ERR(ir->rc6_base);
>
> --
> 2.23.0
>

--=20
M=E5ns Rullg=E5rd
