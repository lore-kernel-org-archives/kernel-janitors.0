From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 05 Oct 2018 06:55:23 +0000
Subject: Re: [PATCH -next] eeprom: at25: remove unneeded 'at25_remove'
Message-Id: <CAMuHMdU1U7izR23KYdP6W912ZKLtb=UuyRu4hZv0OWkxithuEQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538720352-85691-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538720352-85691-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: yuehaibing@huawei.com
Cc: Arnd Bergmann <arnd@arndb.de>, Greg KH <gregkh@linuxfoundation.org>, devang.panchal@softnautics.com, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, gustavo@embeddedor.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 5, 2018 at 8:08 AM YueHaibing <yuehaibing@huawei.com> wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/misc/eeprom/at25.c: In function 'at25_remove':
> drivers/misc/eeprom/at25.c:384:20: warning:
>  variable 'at25' set but not used [-Wunused-but-set-variable]
>
> Since commit 96d08fb43e30 ("eeprom: at25: use devm_nvmem_register()"),
> at25_remove is do nothing, so can be removed.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
