From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 30 Jul 2019 09:44:29 +0000
Subject: Re: [PATCH v5 1/3] driver core: platform: Add an error message to platform_get_irq*()
Message-Id: <314f06fe-fbc9-c2f5-72bf-657c04cce4b0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190730053845.126834-1-swboyd@chromium.org>
 <20190730053845.126834-2-swboyd@chromium.org>
In-Reply-To: <20190730053845.126834-2-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Stephen Boyd <swboyd@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Andy Shevchenko <andy.shevchenko@gmail.com>

…
> +++ b/drivers/base/platform.c
> @@ -99,12 +99,7 @@ void __iomem *devm_platform_ioremap_resource(struct platform_device *pdev,
…
> -int platform_get_irq(struct platform_device *dev, unsigned int num)
> +static int __platform_get_irq(struct platform_device *dev, unsigned int num)
>  {
…

I suggest to avoid the usage of double underscores in such identifiers.
Will an other function name be more appropriate here?

Regards,
Markus
