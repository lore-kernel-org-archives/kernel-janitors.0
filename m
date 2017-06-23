From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 23 Jun 2017 20:54:20 +0000
Subject: Re: [PATCH] clocksource/mips-gic-timer: Fix an error code in 'gic_clocksource_of_init()'
Message-Id: <5ccaffd7-b175-15b9-195b-b1a6f4ff366b@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623195510.12067-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170623195510.12067-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 23/06/2017 21:55, Christophe JAILLET wrote:
> 'clk' is a valid pointer at this point. So calling PTR_ERR on it is
> pointess.
> Return the error code from 'clk_prepare_enable()' if it fails instead.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not compile tested as I don't have the corresponding cross-compiler

The cross compiler mips-linux-gnu- is available on the ubuntu platform.

I gave a try [1] and it compiled without complains.

Thanks for sending this fix.

  -- Daniel

[1]

make ARCH=3Dmips CROSS_COMPILE=3Dmips-linux-gnu- KBUILD_OUTPUT=3D~/build/mi=
ps
generic_defconfig

cd ~/build/mips

make ARCH=3Dmips CROSS_COMPILE=3Dmips-linux-gnu- -j 13 vmlinux

> ---
>  drivers/clocksource/mips-gic-timer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/m=
ips-gic-timer.c
> index e31e08326024..17b861ea2626 100644
> --- a/drivers/clocksource/mips-gic-timer.c
> +++ b/drivers/clocksource/mips-gic-timer.c
> @@ -167,10 +167,11 @@ static int __init gic_clocksource_of_init(struct de=
vice_node *node)
> =20
>  	clk =3D of_clk_get(node, 0);
>  	if (!IS_ERR(clk)) {
> -		if (clk_prepare_enable(clk) < 0) {
> +		ret =3D clk_prepare_enable(clk);
> +		if (ret < 0) {
>  			pr_err("GIC failed to enable clock\n");
>  			clk_put(clk);
> -			return PTR_ERR(clk);
> +			return ret;
>  		}
> =20
>  		gic_frequency =3D clk_get_rate(clk);
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
