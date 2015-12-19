From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Dec 2015 20:12:13 +0000
Subject: Re: [PATCH] pinctrl-adi2: Use a signed return type for adi_gpio_irq_startup()
Message-Id: <20151219201213.GP5284@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56758D34.2070806@users.sourceforge.net>
In-Reply-To: <56758D34.2070806@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

This introduces a compile warning.  These functions are supposed to
return 1 if there is an IRQ pending.  Change the -EINVAL to 0.

regards,
dan carpenter

