From: Jeff Moyer <jmoyer@redhat.com>
Date: Thu, 07 Aug 2014 21:41:29 +0000
Subject: Re: [PATCH 1/4] umem: fix error return code
Message-Id: <x491tssasfq.fsf@segfault.boston.devel.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr>
	<1407445067-4044-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407445067-4044-3-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Thu, 7 Aug 2014 22:57:45 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

> diff --git a/drivers/block/umem.c b/drivers/block/umem.c
> index 4cf81b5..371e819 100644
> --- a/drivers/block/umem.c
> +++ b/drivers/block/umem.c
> @@ -881,6 +881,7 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	if (card->mm_pages[0].desc = NULL ||
>  	    card->mm_pages[1].desc = NULL) {
>  		dev_printk(KERN_ERR, &card->dev->dev, "alloc failed\n");
> +		ret = -ENOMEM;
>  		goto failed_alloc;
>  	}
>  	reset_page(&card->mm_pages[0]);
> @@ -891,8 +892,10 @@ static int mm_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	card->biotail = &card->bio;
>  
>  	card->queue = blk_alloc_queue(GFP_KERNEL);
> -	if (!card->queue)
> +	if (!card->queue) {
> +		ret = -ENOMEM;
>  		goto failed_alloc;
> +	}

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
