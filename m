From: Marc Zyngier <maz@kernel.org>
Date: Sat, 19 Oct 2019 20:43:05 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <868spgzcti.wl-maz@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
In-Reply-To: <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, Linus Torvalds <torvalds@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

On Sat, 19 Oct 2019 12:35:49 +0100,
Markus Elfring <Markus.Elfring@web.de> wrote:
> 
> > I think part of the issue is that the script reports a WARNING
> 
> How much does this information influence really the stress tolerance
> and change resistance (or acceptance) for the presented collateral evolution?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/scripts/coccinelle/api/devm_platform_ioremap_resource.cocci

-ENOPARSE.

> > for something that is definitely correct code,
> 
> Can related software improvement possibilities be taken into account
> again under other circumstances?

These patches provide no improvement whatsoever. As pointed out, they
mostly introduce bugs.

> > and could instead be simply toned down.
> 
> Does this view mean that the mentioned script for the semantic patch language
> should get another chance for integration?

Providing Coccinelle scripts that scream about perfectly valid code is
pointless, and the result is actively harmful.

If said script was providing a correct semantic patch instead of being
an incentive for people to churn untested patches that span the whole
tree, that'd be a different story. But that's not what this is about.

> > Anyway, FWIW:
> >
> > Acked-by: Marc Zyngier <maz@kernel.org>
> 
> Would you like to share any more constructive feedback?

No.

> Will similar source file mass updates be better picked up
> by other well-known Linux developers?

Certainly not for the subsystems I maintain.

	M.

-- 
Jazz is not dead, it just smells funny.
