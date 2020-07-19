From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sun, 19 Jul 2020 04:48:38 +0000
Subject: Re: [PATCH] staging: media: atomisp: Replace depracated MSI API.
Message-Id: <20200719043638.GC28510@blackclown>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200718132632.GA11527@blackclown>
In-Reply-To: <20200718132632.GA11527@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

On Sat, Jul 18, 2020 at 06:56:32PM +0530, Suraj Upadhyay wrote:
> Replace depracated pci_enable_msi with pci_alloc_irq_vectors.
> And as a result modify how the returned value is handled.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Hii,
Please don't merge this patch.
It is still incomplete.
It doesn't replace pci_disable_msi.
I hope this wasn't an annoyance.

Thanks,

Suraj Upadhyay.

> diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> index d36809a0182c..b824c6f78a9c 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
> @@ -1735,8 +1735,8 @@ static int atomisp_pci_probe(struct pci_dev *dev,
>  	pci_set_master(dev);
>  	pci_set_drvdata(dev, isp);
>  
> -	err = pci_enable_msi(dev);
> -	if (err) {
> +	err = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
> +	if (err < 0) {
>  		dev_err(&dev->dev, "Failed to enable msi (%d)\n", err);
>  		goto enable_msi_fail;
>  	}
> -- 
> 2.17.1
> 
