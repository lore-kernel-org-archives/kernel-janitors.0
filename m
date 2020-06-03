From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 03 Jun 2020 22:05:56 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <CACRpkdax2rFLnqY2pBEjfV6GH+wCHOrc4bQ7iYZEzWo=Fmi0NA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Sun, May 31, 2020 at 9:37 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> Commit 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")
> has turned a 'pinctrl_register()' into 'devm_pinctrl_register()' in
> 'pxa2xx_pinctrl_init()'.
> However, the corresponding 'pinctrl_unregister()' call in
> 'pxa2xx_pinctrl_exit()' has not been removed.
>
> This is not an issue, because 'pxa2xx_pinctrl_exit()' is unused.
> Remove it now to avoid some wondering in the future and save a few LoC.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
