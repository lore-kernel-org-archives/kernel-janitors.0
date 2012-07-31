From: Lars-Peter Clausen <lars@metafoo.de>
Date: Tue, 31 Jul 2012 12:36:24 +0000
Subject: Re: [PATCH] drivers/iio/adc/at91_adc.c: use devm_ functions
Message-Id: <5017D148.6030006@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1343729383-30073-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1343729383-30073-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, kernel-janitors@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 07/31/2012 12:09 PM, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> @@ -720,20 +698,14 @@ error_ret:
>  static int __devexit at91_adc_remove(struct platform_device *pdev)
>  {
>  	struct iio_dev *idev = platform_get_drvdata(pdev);
> -	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	struct at91_adc_state *st = iio_priv(idev);
>  
>  	iio_device_unregister(idev);
> [...]
> -	free_irq(st->irq, idev);
> [...]
>  	iio_device_free(idev);

I think we have to be careful here. The interrupted is now freed after the
device has been freed, which means that it could trigger after the device
has been freed. And since we use the device in the interrupt handler we'll
get a use after free.

- Lars
