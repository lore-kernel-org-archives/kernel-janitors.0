From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 09:49:59 +0000
Subject: Re: [PATCH] pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()
Message-Id: <CAMuHMdWEXPWhtx12PZwk+6CC_KQm2APmhkZzpobesN5EASaLng@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827093927.GB8443@mwanda>
In-Reply-To: <20190827093927.GB8443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2019 at 11:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We need to unlock and enable IRQs before we return on this error path.

Wow, how could we have missed that?!?
Thanks!

> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Linus: As we're already past rc6, I don't plan to send another pull
       request for v5.4.
       Hence can you please take this one directly?
       Thanks!

> --- a/drivers/pinctrl/sh-pfc/pinctrl.c
> +++ b/drivers/pinctrl/sh-pfc/pinctrl.c
> @@ -361,8 +361,10 @@ static int sh_pfc_func_set_mux(struct pinctrl_dev *pctldev, unsigned selector,
>                  * This driver cannot manage both gpio and mux when the gpio
>                  * pin is already enabled. So, this function fails.
>                  */
> -               if (cfg->gpio_enabled)
> -                       return -EBUSY;
> +               if (cfg->gpio_enabled) {
> +                       ret = -EBUSY;
> +                       goto done;
> +               }
>
>                 ret = sh_pfc_config_mux(pfc, grp->mux[i], PINMUX_TYPE_FUNCTION);
>                 if (ret < 0)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
