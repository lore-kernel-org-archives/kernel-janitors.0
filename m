From: Marc Zyngier <maz@kernel.org>
Date: Sun, 20 Oct 2019 09:34:52 +0000
Subject: Re: coccinelle: api/devm_platform_ioremap_resource: remove useless script
Message-Id: <867e4zzrnn.wl-maz@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e895d04ef5a282b5b48fcb21cbc175d2@www.loen.fr>
 <693a3b68-a0f1-81fe-40ce-2b6ba189450c@web.de>
 <868spgzcti.wl-maz@kernel.org>
 <alpine.DEB.2.21.1910200735400.3689@hadrien>
In-Reply-To: <alpine.DEB.2.21.1910200735400.3689@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Michal Marek <michal.lkml@markovi.net>, YueHaibing <yuehaibing@huawei.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Nicolas Palix <nicolas.palix@imag.fr>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Torvalds <torvalds@linuxfoundation.org>, Markus Elfring <Markus.Elfring@web.de>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Coccinelle <cocci@systeme.lip6.fr>

On Sun, 20 Oct 2019 06:38:30 +0100,
Julia Lawall <julia.lawall@lip6.fr> wrote:
> 
> > If said script was providing a correct semantic patch instead of being
> > an incentive for people to churn untested patches that span the whole
> > tree, that'd be a different story. But that's not what this is about.
> 
> What is the actual incorrectness with the script?

The first thing is that it spits out a "WARNING", which is almost
universally interpreted as something that needs addressing. In this
case, it really doesn't. The suggested helper is only icing sugar, and
the original code is perfectly fine.

The second thing is that it results in people posting patches they
don't even compile, let alone test. There would be a good chance for
these patches to be correct if the script was directly generating
them, but that's unfortunately not the case.

> An option could be to adjust the rule such that it can be run with an
> extra command line option, like -D developer but is not run by default by
> make coccicheck.

Maybe. I'm not sure this will deter people from running these scripts
and sending broken patches anyway. No matter how many safeguards you
put, people will still post broken patches just because they can.

	M.

-- 
Jazz is not dead, it just smells funny.
