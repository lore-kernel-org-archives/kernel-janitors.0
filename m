From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 25 Jul 2017 08:00:09 +0000
Subject: Re: [PATCH 07/11] mfd: Drop unnecessary static
Message-Id: <20170725080009.sm675kxlj7mhjqhi@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1500149266-32357-1-git-send-email-Julia.Lawall@lip6.fr>
 <1500149266-32357-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1500149266-32357-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Tony Lindgren <tony@atomide.com>, keescook@chromium.org, kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 15 Jul 2017, Julia Lawall wrote:

> Drop static on a local variable, when the variable is initialized before
> any possible use.  Thus, the static has no benefit.
>=20
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @bad exists@
> position p;
> identifier x;
> type T;
> @@
> static T x@p;
> ...
> x =3D <+...x...+>
>=20
> @@
> identifier x;
> expression e;
> type T;
> position p !=3D bad.p;
> @@
> -static
>  T x@p;
>  ... when !=3D x
>      when strict
> ?x =3D e;
> // </smpl>
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
> These patches are all independent of each other.
>=20
>  drivers/mfd/twl4030-irq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks like I didn't reply to this patch.

Just to let you know, it has been applied.

> diff -u -p a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
> --- a/drivers/mfd/twl4030-irq.c
> +++ b/drivers/mfd/twl4030-irq.c
> @@ -685,7 +685,7 @@ int twl4030_sih_setup(struct device *dev
> =20
>  int twl4030_init_irq(struct device *dev, int irq_num)
>  {
> -	static struct irq_chip	twl4030_irq_chip;
> +	struct irq_chip		twl4030_irq_chip;
>  	int			status, i;
>  	int			irq_base, irq_end, nr_irqs;
>  	struct			device_node *node =3D dev->of_node;
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
