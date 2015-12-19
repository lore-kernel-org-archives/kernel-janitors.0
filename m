From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 19 Dec 2015 20:40:27 +0000
Subject: Re: pinctrl-adi2: Use a signed return type for adi_gpio_irq_startup()
Message-Id: <5675C0BB.9020204@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56758D34.2070806@users.sourceforge.net>
 <20151219201213.GP5284@mwanda>
In-Reply-To: <20151219201213.GP5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> This introduces a compile warning.

How do you think about to show the exact message you get?


> These functions are supposed to return 1 if there is an IRQ pending.
> Change the -EINVAL to 0.

Is there any more source code clean-up needed around the comment "FIXME"
in the affected function?

Regards,
Markus
