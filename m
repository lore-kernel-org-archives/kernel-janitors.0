From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Oct 2019 11:46:01 +0000
Subject: Re: [PATCH] pinctrl: rzn1: array reg_drive static, makes object smaller
Message-Id: <CAMuHMdUYvNaCYHDK_=HnyyAKa4Zqr+0xe0QnO0KzKpZws4YsCw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191007140559.11840-1-colin.king@canonical.com>
In-Reply-To: <20191007140559.11840-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Colin,

On Mon, Oct 7, 2019 at 4:06 PM Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate the array reg_drive on the stack but instead make it
> static. Makes the object code smaller by 32 bytes.
>
> Before:
>    text    data     bss     dec     hex filename
>   31991   15696       0   47687    ba47 drivers/pinctrl/pinctrl-rzn1.o
>
> After:
>    text    data     bss     dec     hex filename
>   31863   15792       0   47655    ba27 drivers/pinctrl/pinctrl-rzn1.o
>
> (gcc version 9.2.1, amd64)
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v5.5.

FTR, on arm32, it saves 64 bytes:

   8594     148       0    8742    2226 drivers/pinctrl/pinctrl-rzn1.o.before
   8530     148       0    8678    21e6 drivers/pinctrl/pinctrl-rzn1.o.after

BTW, what debug options do you have enabled, to get a binary that's
more than 5x as large? Amd64 code generation can't be that bad...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
