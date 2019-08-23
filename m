From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2019 10:02:57 +0000
Subject: Re: [PATCH] gpio: ftgpio: Fix an error handling path in 'ftgpio_gpio_probe()'
Message-Id: <CACRpkdacDZTnT2myMrsPLMZYkonGbFu27nr_A1hgw1AKozMMgQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190822204538.4791-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 10:45 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If 'devm_kcalloc()' fails, we should go through the error handling path,
> should some clean-up be needed.
>
> Fixes: 42d9fc7176eb ("gpio: ftgpio: Pass irqchip when adding gpiochip")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied, thanks!

Yours,
Linus Waleij
