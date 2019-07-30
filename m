From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 30 Jul 2019 12:30:44 +0000
Subject: Re: [PATCH v5 1/3] driver core: platform: Add an error message to platform_get_irq*()
Message-Id: <3197785f-91df-21d3-72f4-97ca73681bc8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190730053845.126834-1-swboyd@chromium.org>
 <20190730053845.126834-2-swboyd@chromium.org>
In-Reply-To: <20190730053845.126834-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>

…
> +++ b/drivers/base/platform.c
…
> @@ -163,6 +158,33 @@ int platform_get_irq(struct platform_device *dev, unsigned int num)
>  	return -ENXIO;
>  #endif
>  }
> +
> +/**
> + * platform_get_irq - get an IRQ for a device
> + * @dev: platform device
> + * @num: IRQ number index
> + *
> + * Gets an IRQ for a platform device and prints an error message if finding the
> + * IRQ fails. Device drivers should check the return value for errors so as to
> + * not pass a negative integer value to the request_irq() APIs.
> + *
> + * Example:
> + *		int irq = platform_get_irq(pdev, 0);
> + *		if (irq < 0)
> + *			return irq;
> + *
> + * Return: IRQ number on success, negative error number on failure.
> + */
…

Thanks for your extension of the description for this programming interface.

I imagine that adjustments for this software documentation format can make it
safer to extract desired API properties.
Would you like to improve provided information any further?

Regards,
Markus
