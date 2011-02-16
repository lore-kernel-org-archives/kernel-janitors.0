From: Sergei Shtylyov <sshtylyov@mvista.com>
Date: Wed, 16 Feb 2011 18:10:46 +0000
Subject: Re: [PATCH] ata: sata_dwc_460ex: fix error path
Message-Id: <4D5C1326.2010101@ru.mvista.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317830-5022-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284317830-5022-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>, Jeff Garzik <jgarzik@pobox.com>
Cc: kernel-janitors@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Rupjyoti Sarmah <rsarmah@appliedmicro.com>, Prodyut Hazarika <phazarika@appliedmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

Hello.

Vasiliy Kulikov wrote:

> Free all allocated resources on error path.

> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  I cannot compile this driver at all, so it is not tested.

    I can at least compile-test the patch...

>  drivers/ata/sata_dwc_460ex.c |   21 ++++++++++++++-------
>  1 files changed, 14 insertions(+), 7 deletions(-)

> diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
> index 6cf57c5..ad0535f 100644
> --- a/drivers/ata/sata_dwc_460ex.c
> +++ b/drivers/ata/sata_dwc_460ex.c
> @@ -727,11 +727,15 @@ static int dma_dwc_xfer_setup(struct scatterlist *sg, int num_elems,
>  static void dma_dwc_exit(struct sata_dwc_device *hsdev)
>  {
>  	dev_dbg(host_pvt.dwc_dev, "%s:\n", __func__);
> -	if (host_pvt.sata_dma_regs)
> +	if (host_pvt.sata_dma_regs) {
>  		iounmap(host_pvt.sata_dma_regs);
> +		host_pvt.sata_dma_regs = NULL;
> +	}
>  
> -	if (hsdev->irq_dma)
> +	if (hsdev->irq_dma) {
>  		free_irq(hsdev->irq_dma, hsdev);
> +		hsdev->irq_dma = 0;
> +	}
>  }

    Are those changes really necessary, i.e. is dma_dwc_exit() called more than 
once?

> @@ -1606,7 +1610,7 @@ static int sata_dwc_probe(struct platform_device *ofdev,
>  	if (hsdev = NULL) {
>  		dev_err(&ofdev->dev, "kmalloc failed for hsdev\n");
>  		err = -ENOMEM;
> -		goto error_out;
> +		goto error;

    Why not just:

		return err;

>  	}
>  	memset(hsdev, 0, sizeof(*hsdev));
>  
> @@ -1616,7 +1620,7 @@ static int sata_dwc_probe(struct platform_device *ofdev,
>  		dev_err(&ofdev->dev, "ioremap failed for SATA register"
>  			" address\n");
>  		err = -ENODEV;
> -		goto error_out;
> +		goto error_kmalloc;
>  	}
>  	hsdev->reg_base = base;
>  	dev_dbg(&ofdev->dev, "ioremap done for SATA register address\n");
> @@ -1629,7 +1633,7 @@ static int sata_dwc_probe(struct platform_device *ofdev,
>  	if (!host) {
>  		dev_err(&ofdev->dev, "ata_host_alloc_pinfo failed\n");
>  		err = -ENOMEM;
> -		goto error_out;
> +		goto error_iomap;
>  	}
>  
>  	host->private_data = hsdev;
> @@ -1697,8 +1701,11 @@ error_out:
>  	/* Free SATA DMA resources */
>  	dma_dwc_exit(hsdev);
>  
> -	if (base)
> -		iounmap(base);
> +error_iomap:
> +	iounmap(base);
> +error_kmalloc:
> +	kfree(hsdev);
> +error:
>  	return err;
>  }

    Jeff, what's become with this patch? Will you queue it? And will you queue 
my 4 fixes (and 1 cleanup)?

WBR, Sergei
