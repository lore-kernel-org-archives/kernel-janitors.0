From: Suraj Upadhyay <usuraj35@gmail.com>
Date: Sat, 18 Jul 2020 15:40:26 +0000
Subject: Re: [PATCH] staging: rts5208: rtsx: Replace depracated MSI API
Message-Id: <20200718152826.GE26780@blackclown>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200718131856.GA10837@blackclown>
In-Reply-To: <20200718131856.GA10837@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 18, 2020 at 06:48:56PM +0530, Suraj Upadhyay wrote:
> Replace depracated pci_enable_msi with pci_alloc_irq_vectors.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/staging/rts5208/rtsx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
> index e28e162d004e..adc80e766412 100644
> --- a/drivers/staging/rts5208/rtsx.c
> +++ b/drivers/staging/rts5208/rtsx.c
> @@ -310,7 +310,7 @@ static int __maybe_unused rtsx_resume(struct device *dev_d)
>  	pci_set_master(pci);
>  
>  	if (chip->msi_en) {
> -		if (pci_enable_msi(pci) < 0)
> +		if (pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI) < 0)
The conversion is buggy, It changes variable name.

>  			chip->msi_en = 0;
>  	}
>  
> @@ -881,7 +881,7 @@ static int rtsx_probe(struct pci_dev *pci,
>  	dev_info(&pci->dev, "pci->irq = %d\n", pci->irq);
>  
>  	if (dev->chip->msi_en) {
> -		if (pci_enable_msi(pci) < 0)
> +		if (pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI) < 0)

This has the same mistake.

>  			dev->chip->msi_en = 0;
>  	}
>  
> -- 
> 2.17.1
> 

Resending this patch.
I hope this wasn't an annoyance.

Thanks,

Suraj Upadhyay
