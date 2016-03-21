From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 21 Mar 2016 11:54:57 +0000
Subject: Re: [patch] mfd: lp8788-irq: uninitialized variable in irq handler
Message-Id: <20160321115457.GH4140@x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311081139.GC31887@mwanda>
In-Reply-To: <20160311081139.GC31887@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Milo Kim <milo.kim@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 11 Mar 2016, Dan Carpenter wrote:

> Instead to being true/false, the "handled" is true/uninitialized.
> Presumably this doesn't cause that many problems in real life because
> normally we handle the IRQ.
>=20
> Fixes: eea6b7cc53aa ('mfd: Add lp8788 mfd driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I've fixed the $SUBJECT line to be more consistent with the subsystem
style for you this time.  Please pay more attention to that in the
future.

`git log --oneline -- $SUBSYSTEM` helps with this.

[I think I recall a conversation with you about this before, and you
said it was part of your submission process?]

Patch applied, thanks.
=20
> diff --git a/drivers/mfd/lp8788-irq.c b/drivers/mfd/lp8788-irq.c
> index c7a9825..792d51b 100644
> --- a/drivers/mfd/lp8788-irq.c
> +++ b/drivers/mfd/lp8788-irq.c
> @@ -112,7 +112,7 @@ static irqreturn_t lp8788_irq_handler(int irq, void *=
ptr)
>  	struct lp8788_irq_data *irqd =3D ptr;
>  	struct lp8788 *lp =3D irqd->lp;
>  	u8 status[NUM_REGS], addr, mask;
> -	bool handled;
> +	bool handled =3D false;
>  	int i;
> =20
>  	if (lp8788_read_multi_bytes(lp, LP8788_INT_1, status, NUM_REGS))

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
