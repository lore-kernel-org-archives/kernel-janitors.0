From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 06:42:17 +0000
Subject: Re: [PATCH -next] regulator: bd9571mwv: Make symbol 'dev_attr_backup_mode' static
Message-Id: <CAMuHMdXUAyn-SF5j3EeA5xvm-BhYAmK4eegEyCEf9vdPhejaUA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532413979-187684-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532413979-187684-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jul 24, 2018 at 8:24 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Fixes the following sparse warning:
>
> drivers/regulator/bd9571mwv-regulator.c:220:1: warning:
>  symbol 'dev_attr_backup_mode' was not declared. Should it be static?
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
