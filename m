From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 30 Jul 2019 10:00:40 +0000
Subject: Re: [v5 2/3] treewide: Remove dev_err() usage after platform_get_irq()
Message-Id: <328b98da-7e76-145f-0684-a8623efe2cc4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190730053845.126834-1-swboyd@chromium.org>
 <20190730053845.126834-3-swboyd@chromium.org>
In-Reply-To: <20190730053845.126834-3-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>

> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.

Will the current patch review result in adjustments for the SmPL code
in the commit description?


> While we're here, remove braces on if statements that only have one
> statement (manually).

Would you like to reduce manual change efforts any further for the shown
source code transformation approach?

Regards,
Markus
