From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jul 2019 11:17:39 +0000
Subject: Re: [v4 2/3] treewide: Remove dev_err() usage after platform_get_irq()
Message-Id: <a69aeff9-338c-a763-3a25-3ff767e5401d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d3788cf.1c69fb81.44f27.5907@mx.google.com>
In-Reply-To: <5d3788cf.1c69fb81.44f27.5907@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Michal Marek <michal.lkml@markovi.net>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

> > > struct platform_device *E;

How much does this specification matter for the parameters
of the mentioned functions (in the SmPL script)?
Will the selection of function names be sufficient for the discussed
source code search pattern?


> > Can you teach it to remove curly braces when it's appropriate?
> > (see below for examples)
>
> I don't know if that works.

Such an adjustment depends on additional development efforts.


> Is there some sort of tidy script I can run on my patches to do this?

You can add corresponding case distinctions to your transformation approach
for the semantic patch language (on demand), can't you?

Regards,
Markus
