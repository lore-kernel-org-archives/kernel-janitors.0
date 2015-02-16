From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Feb 2015 09:04:08 +0000
Subject: Re: [PATCH 1/2] [media] mantis: Move jump label to activate dead code
Message-Id: <20150216090408.GW5206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424002265-16865-1-git-send-email-s.jegen@gmail.com>
 <1424002265-16865-2-git-send-email-s.jegen@gmail.com>
In-Reply-To: <1424002265-16865-2-git-send-email-s.jegen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Silvan Jegen <s.jegen@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Feb 15, 2015 at 01:11:04PM +0100, Silvan Jegen wrote:
> diff --git a/drivers/media/pci/mantis/mantis_cards.c b/drivers/media/pci/mantis/mantis_cards.c
> index 801fc55..e566061 100644
> --- a/drivers/media/pci/mantis/mantis_cards.c
> +++ b/drivers/media/pci/mantis/mantis_cards.c
> @@ -215,10 +215,11 @@ static int mantis_pci_probe(struct pci_dev *pdev,
>  		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis DVB initialization failed <%d>", err);
>  		goto fail4;
>  	}
> +
>  	err = mantis_uart_init(mantis);
>  	if (err < 0) {
>  		dprintk(MANTIS_ERROR, 1, "ERROR: Mantis UART initialization failed <%d>", err);
> -		goto fail6;
> +		goto fail5;
>  	}
>  
>  	devs++;
> @@ -226,10 +227,10 @@ static int mantis_pci_probe(struct pci_dev *pdev,
>  	return err;
>  
>  
> +fail5:
>  	dprintk(MANTIS_ERROR, 1, "ERROR: Mantis UART exit! <%d>", err);
>  	mantis_uart_exit(mantis);
>  
> -fail6:
>  fail4:
>  	dprintk(MANTIS_ERROR, 1, "ERROR: Mantis DMA exit! <%d>", err);
>  	mantis_dma_exit(mantis);

This patch isn't right, I'm afraid.  The person who wrote this driver
deliberately added some dead error handling code in case we change it
later and need to activate it.  It's an ugly thing to do because it
causes static checker warnings, and confusion, and, in real life, then
we are not ever going to need to activate it.  It's defensive
programming but we don't do defensive programming.
http://lwn.net/Articles/604813/  Just delete this dead code.

Also this code uses GW-BASIC style numbered gotos.  So ugly!  The label
names should be based on what the label location does.  Eg
"err_uart_exit", "err_dma_exit".  I have written an essay about label
names:  https://plus.google.com/106378716002406849458/posts/dnanfhQ4mHQ

In theory, we should be calling mantis_dvb_exit() if mantis_uart_init()
fails.  In reality, it can't fail but it's still wrong to leave that
out.

These patches would be easier to review if you just folded them into one
patch.  Call it "fix error error handling" or something.

regards,
dan carpenter
