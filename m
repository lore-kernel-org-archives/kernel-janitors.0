From: Seth Forshee <seth.forshee@canonical.com>
Date: Mon, 29 Jun 2020 12:35:04 +0000
Subject: Re: [PATCH] MAINTAINERS: remove obsolete entry after file renaming
Message-Id: <20200629123504.GA10686@ubuntu-x1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200628180229.5068-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200628180229.5068-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 28, 2020 at 08:02:29PM +0200, Lukas Bulwahn wrote:
> Commit f16861b12fa0 ("regulator: rename da903x to da903x-regulator") missed
> to adjust the DIALOG SEMICONDUCTOR DRIVERS section in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/regulator/da903x.c
> 
> The da903x-regulator.c file is already covered by the pattern
> drivers/regulator/da9???-regulator.[ch] in the section.
> 
> So, simply remove the non-matching file entry in MAINTAINERS.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

I didn't think to check MAINTAINERS when renaming the file. This makes
sense to me.

Acked-by: Seth Forshee <seth.forshee@canonical.com>

> ---
> applies cleanly on next-20200626
> 
> Seth, please ack.
> Mark, please pick this minor non-urgent patch into your -next tree.
> 
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 04fceaee5200..970136e262c2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5021,7 +5021,6 @@ F:	drivers/mfd/da91??-*.c
>  F:	drivers/pinctrl/pinctrl-da90??.c
>  F:	drivers/power/supply/da9052-battery.c
>  F:	drivers/power/supply/da91??-*.c
> -F:	drivers/regulator/da903x.c
>  F:	drivers/regulator/da9???-regulator.[ch]
>  F:	drivers/regulator/slg51000-regulator.[ch]
>  F:	drivers/rtc/rtc-da90??.c
> -- 
> 2.17.1
> 
