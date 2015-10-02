From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 02 Oct 2015 21:48:49 +0000
Subject: Re: [PATCH] gpio: max730x: eliminate double free
Message-Id: <CACRpkda+YTx2pD7cXeYen+jXPxAYQWM0PNqOeJxJGfxLFG3mLA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1443298700-28079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1443298700-28079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Sep 26, 2015 at 1:18 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> The function __max730x_remove is called from the remove functions of
> drivers/gpio/gpio-max7300.c and drivers/gpio/gpio-max7301.c.  In both
> cases, the probe function allocates ts using devm_kzalloc.  Explicitly
> freeing such a value with kfree will cause a double free.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied with Alex' review-tag.

Yours,
Linus Walleij
