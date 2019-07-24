From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jul 2019 15:00:43 +0000
Subject: Re: [PATCH v4 1/3] driver core: platform: Add an error message to platform_get_irq*()
Message-Id: <d12a32e6-fd82-71f8-c320-ea6e844db3f4@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723181624.203864-2-swboyd@chromium.org>
In-Reply-To: <20190723181624.203864-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Stephen Boyd <swboyd@chromium.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>

> Let's consolidate all these error messages into the API itself,
> allowing us to get rid of the error messages in each driver.

Such information from the commit descriptions sounds positive.


> +++ b/drivers/base/platform.c
…
> @@ -163,6 +158,22 @@ int platform_get_irq(struct platform_device *dev, unsigned int num)
…
> +/**
> + * platform_get_irq - get an IRQ for a device
> + * @dev: platform device
> + * @num: IRQ number index
> + */

Do you find the provided description for the programming interface
really sufficient then?
Would it be more helpful to indicate the existence of an appropriate error message
also in this software documentation (besides the C source code)?

Regards,
Markus
