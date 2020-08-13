From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 13 Aug 2020 21:40:29 +0000
Subject: Re: [PATCH] staging: media: ipu3: Replace depracated MSI API.
Message-Id: <20200813214028.GB24582@paasikivi.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200718133238.GA11982@blackclown>
In-Reply-To: <20200718133238.GA11982@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, bingbu.cao@intel.com, mchehab@kernel.org, tian.shu.qiu@intel.com, linux-media@vger.kernel.org

Hi Suraj,

Thanks for the patch.

On Sat, Jul 18, 2020 at 07:02:38PM +0530, Suraj Upadhyay wrote:
> Replace depracated psi_enable_msi with pci_alloc_irq_vectors.
> And as a result modify how the returned value is handled.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/staging/media/ipu3/ipu3.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
> index ee1bba6bdcac..54690e7442be 100644
> --- a/drivers/staging/media/ipu3/ipu3.c
> +++ b/drivers/staging/media/ipu3/ipu3.c
> @@ -602,9 +602,9 @@ static irqreturn_t imgu_isr(int irq, void *imgu_ptr)
>  static int imgu_pci_config_setup(struct pci_dev *dev)
>  {
>  	u16 pci_command;
> -	int r = pci_enable_msi(dev);
> +	int r = pci_alloc_irq_vectors(dev, 1, 1, PCI_IRQ_MSI);
>  
> -	if (r) {
> +	if (r < 0) {
>  		dev_err(&dev->dev, "failed to enable MSI (%d)\n", r);
>  		return r;
>  	}

I believe fixing this requires also releasing it, i.e. a call to
pci_free_irq_vectors(). This seems to have been missing.

-- 
Kind regards,

Sakari Ailus
