From: Dominik Brodowski <linux@dominikbrodowski.net>
Date: Sat, 07 Aug 2010 11:29:18 +0000
Subject: Re: [PATCH 11/18] pcmcia: pd6729: call disable_pci_device() if
Message-Id: <20100807112918.GB17845@isilmar-3.linta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281124366-13716-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281124366-13716-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Komuro <komurojun-mbn@nifty.com>, Wolfram Sang <w.sang@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Tejun Heo <tj@kernel.org>, linux-pcmcia@lists.infradead.org, linux-kernel@vger.kernel.org

On Fri, Aug 06, 2010 at 11:52:44PM +0400, Kulikov Vasiliy wrote:
> Driver should call disable_pci_device() if it returns from pci_probe()
> with error. Also it must not be called if pci_request_region() fails as
> it means that somebody uses device resources and rules the device.

But that would mean that a driver first enables a device, then fails to make
use of it, and then can't disable it? This doesn't look right to me. The
first part of the patch looks fine, though.

Best,
	Dominik


> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/pcmcia/pd6729.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
> index b8a869a..1858c3a 100644
> --- a/drivers/pcmcia/pd6729.c
> +++ b/drivers/pcmcia/pd6729.c
> @@ -646,7 +646,7 @@ static int __devinit pd6729_pci_probe(struct pci_dev *dev,
>  	if (!pci_resource_start(dev, 0)) {
>  		dev_warn(&dev->dev, "refusing to load the driver as the "
>  			"io_base is NULL.\n");
> -		goto err_out_free_mem;
> +		goto err_out_disable;
>  	}
>  
>  	dev_info(&dev->dev, "Cirrus PD6729 PCI to PCMCIA Bridge at 0x%llx "
> @@ -666,7 +666,7 @@ static int __devinit pd6729_pci_probe(struct pci_dev *dev,
>  	ret = pci_request_regions(dev, "pd6729");
>  	if (ret) {
>  		dev_warn(&dev->dev, "pci request region failed.\n");
> -		goto err_out_disable;
> +		goto err_out_free_mem;
>  	}
>  
>  	if (dev->irq = NO_IRQ)
> -- 
> 1.7.0.4
> 
