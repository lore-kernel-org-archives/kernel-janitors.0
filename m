From: Al Viro <viro@zeniv.linux.org.uk>
Date: Sun, 07 Jul 2019 00:52:53 +0000
Subject: Re: [PATCH] mfd: asic3: One function call less in asic3_irq_probe()
Message-Id: <20190707005251.GQ17978@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
In-Reply-To: <01f6a8cd-0205-8d34-2aa3-e4b691e7eb95@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 05, 2019 at 08:30:08PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 20:22:26 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement.

Which is a good thing, because...?

> This issue was detected by using the Coccinelle software.

Oh, I see - that answers all questions.  "Software has detected an issue",
so of course an issue it is.

> -		if (irq < asic->irq_base + ASIC3_NUM_GPIOS)
> -			irq_set_chip(irq, &asic3_gpio_irq_chip);
> -		else
> -			irq_set_chip(irq, &asic3_irq_chip);
> -
> +		irq_set_chip(irq,
> +			     (irq < asic->irq_base + ASIC3_NUM_GPIOS)
> +			     ? &asic3_gpio_irq_chip
> +			     : &asic3_irq_chip);

... except that the result is not objectively better by any real
criteria.  It's not more readable, it conveys _less_ information
to reader (the fact that calls differ only by the last argument
had been visually obvious already, and logics used to be easier
to see), it (obviously) does not generate better (or different)
code.  What the hell is the point?

May I politely inquire what makes you so determined to avoid any
not-entirely-mechanical activity?
