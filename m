From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 15 Dec 2019 15:07:11 +0000
Subject: Re: [PATCH] staging: comedi: drivers: Fix memory leak in gsc_hpdi_auto_attach
Message-Id: <69f03714-c10e-8ff9-ae64-7b35b6a5fae9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191215013306.18880-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191215013306.18880-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, devel@driverdev.osuosl.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ian Abbott <abbotti@mev.co.uk>, Navid Emamdoost <emamd001@umn.edu>

> In the implementation of gsc_hpdi_auto_attach(), the allocated dma
> description is leaks in case of alignment error, …

Please avoid a typo in this change message.


…
+++ b/drivers/staging/comedi/drivers/gsc_hpdi.c
…
> @@ -660,6 +661,15 @@ static int gsc_hpdi_auto_attach(struct comedi_device *dev,
>  	s->cancel	= gsc_hpdi_cancel;
>
>  	return gsc_hpdi_init(dev);
> +
> +release_dma_desc:
> +	if (devpriv->dma_desc)
> +		dma_free_coherent(&pcidev->dev,
> +				  sizeof(struct plx_dma_desc) *
> +				NUM_DMA_DESCRIPTORS,
> +				devpriv->dma_desc,
> +				devpriv->dma_desc_phys_addr);
> +	return retval;
>  }
>
>  static void gsc_hpdi_detach(struct comedi_device *dev)

I got the impression that return values from calls of the function “dma_alloc_coherent”
should be checked before.
* Would you like to add null pointer checks at other source code places?
* Should the jump targets be accordingly adjusted then for the completion
  of the desired exception handling?

Regards,
Markus
