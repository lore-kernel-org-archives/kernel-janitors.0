From: Joe Perches <joe@perches.com>
Date: Tue, 23 May 2017 18:55:52 +0000
Subject: Re: [PATCH] MIPS: Octeon: Delete an error message for a failed memory allocation in octeon_irq_init_
Message-Id: <1495565752.2093.69.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7995eb17-f2ec-54ad-f4d4-7b3dd8337d33@users.sourceforge.net>
In-Reply-To: <7995eb17-f2ec-54ad-f4d4-7b3dd8337d33@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-mips@linux-mips.org, Dan Carpenter <dan.carpenter@oracle.com>, David Daney <david.daney@cavium.com>, Ralf =?ISO-8859-1?Q?B=E4chle?= <ralf@linux-mips.org>, "Steven J. Hill" <steven.hill@cavium.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2017-05-23 at 20:10 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 23 May 2017 20:00:06 +0200
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-R=
efactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/cavium-octeon/octeon-irq.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octe=
on/octeon-irq.c
> index c1eb1ff7c800..050c08ece5b6 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1615,7 +1615,6 @@ static int __init octeon_irq_init_gpio(
>  		irq_domain_add_linear(
>  			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
>  	} else {
> -		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
>  		return -ENOMEM;
>  	}

You really should reverse the test here and
unindent the first block.

Again:  Don't be mindless.
        Take the time to improve the code.
---
diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon=
/octe
index c1eb1ff7c800..2bdc750f2f2d 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1609,15 +1609,13 @@ static int __init octeon_irq_init_gpio(
=A0	}
=A0
=A0	gpiod =3D kzalloc(sizeof(*gpiod), GFP_KERNEL);
-	if (gpiod) {
-		/* gpio domain host_data is the base hwirq number. */
-		gpiod->base_hwirq =3D base_hwirq;
-		irq_domain_add_linear(
-			gpio_node, 16, &octeon_irq_domain_gpio_ops, gpiod);
-	} else {
-		pr_warn("Cannot allocate memory for GPIO irq_domain.\n");
+	if (!gpiod)
=A0		return -ENOMEM;
-	}
+
+	/* gpio domain host_data is the base hwirq number. */
+	gpiod->base_hwirq =3D base_hwirq;
+	irq_domain_add_linear(gpio_node, 16,
+			      &octeon_irq_domain_gpio_ops, gpiod);
=A0
=A0	/*
=A0	 * Clear the OF_POPULATED flag that was set by of_irq_init()

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
