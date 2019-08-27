From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2019 11:36:52 +0000
Subject: Re: [PATCH -next] pinctrl: sh-pfc: Fix missing unlock on error in sh_pfc_func_set_mux()
Message-Id: <CAMuHMdUobaBZOZjVY7=rvJq=NCqsX6aQwbT9f81HM45wbTjNaA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827113527.99831-1-weiyongjun1@huawei.com>
In-Reply-To: <20190827113527.99831-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2019 at 1:32 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Add the missing unlock before return from function sh_pfc_func_set_mux()
> in the error handling case.
>
> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, but this is a duplicate of
https://lore.kernel.org/linux-gpio/20190827093927.GB8443@mwanda/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
