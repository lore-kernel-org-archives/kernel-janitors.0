From: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 01 Jun 2020 08:58:36 +0000
Subject: Re: [PATCH] pinctrl: pxa: pxa2xx: Remove 'pxa2xx_pinctrl_exit()' which is unused and broken
Message-Id: <87h7vvb1s3.fsf@belgarion.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200531073716.593343-1-christophe.jaillet@wanadoo.fr>
 (Christophe JAILLET's message of "Sun, 31 May 2020 09:37:16 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, haojian.zhuang@gmail.com, linux-gpio@vger.kernel.org, daniel@zonque.org, linux-arm-kernel@lists.infradead.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

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
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Would be even a better patch with a :
Fixes: 6d33ee7a0534 ("pinctrl: pxa: Use devm_pinctrl_register() for pinctrl registration")

Cheers.

--
Robert
