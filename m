From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Sep 2012 15:45:28 +0000
Subject: Re: [PATCH] gpio: pcf857x: fixup smatch WARNING
Message-Id: <CACRpkdYagWXN4zOEVNK==kR96R2x7qjM7UX-NmUhtPwEyx=L_A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120912031131.GA22076@localhost>
	<87fw6nn7gx.wl%kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fw6nn7gx.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 12, 2012 at 7:19 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:

> 6e20a0a429bd4dc07d6de16d9c247270e04e4aa0
> (gpio: pcf857x: enable gpio_to_irq() support)
> added new smatch warnings
>
> drivers/gpio/gpio-pcf857x.c:288 pcf857x_probe() error: we previously \
>         assumed 'pdata' could be null (see line 277)
> drivers/gpio/gpio-pcf857x.c:364 pcf857x_probe() warn: variable dereferenced\
>          before check 'pdata' (see line 292)
> drivers/gpio/gpio-pcf857x.c:421 pcf857x_remove() error: we previously\
>          assumed 'pdata' could be null (see line 410)
>
> This patch fixes it
>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Applied, thanks!
Linus Walleij
