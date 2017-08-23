From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Aug 2017 07:35:42 +0000
Subject: Re: [PATCH] pinctrl: rza1: off by one in rza1_parse_gpiochip()
Message-Id: <CAMuHMdWu3rpXMwKe3KLPHo+Cmg25uCOFJjd_zdQCoLT3qi-f9A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170818103248.ddguatdt5jhm5zx7@mwanda>
In-Reply-To: <20170818103248.ddguatdt5jhm5zx7@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Fri, Aug 18, 2017 at 12:32 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:
> The rza1_pctl->ports[] array has RZA1_NPORTS (12) elements.  The > here
> should be >= to prevent an out of bounds access.
>
> Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
