Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606ABC07E9C
	for <kernel-janitors@archiver.kernel.org>; Mon,  5 Jul 2021 19:58:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AB646198F
	for <kernel-janitors@archiver.kernel.org>; Mon,  5 Jul 2021 19:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbhGEUBd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 5 Jul 2021 16:01:33 -0400
Received: from einhorn.in-berlin.de ([192.109.42.8]:32835 "EHLO
        einhorn-mail-out.in-berlin.de" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229963AbhGEUBc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 5 Jul 2021 16:01:32 -0400
X-Greylist: delayed 713 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Jul 2021 16:01:32 EDT
X-Envelope-From: stefanr@s5r6.in-berlin.de
Received: from authenticated.user (localhost [127.0.0.1]) by einhorn.in-berlin.de  with ESMTPSA id 165JkjlC005959
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 5 Jul 2021 21:46:45 +0200
Date:   Mon, 5 Jul 2021 21:46:45 +0200
From:   Stefan Richter <stefanr@s5r6.in-berlin.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     greg@kroah.com, linux1394-devel@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] firewire: nosy: switch from 'pci_' to 'dma_' API
Message-ID: <20210705214645.04bca11a@kant>
In-Reply-To: <e1d7fa558f31abf294659a9d4edcc1e4fc065fab.1623590706.git.christophe.jaillet@wanadoo.fr>
References: <e1d7fa558f31abf294659a9d4edcc1e4fc065fab.1623590706.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Jun 13 Christophe JAILLET wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'add_card()', GFP_KERNEL can be used because
> this flag is already used a few lines above and no lock is taken in the
> between.
> 
> While at it, also remove some useless casting.
[...]
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks.
Committed to linux1394.git.

> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> ---
>  drivers/firewire/nosy.c | 43 +++++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/firewire/nosy.c b/drivers/firewire/nosy.c
> index 88ed971e32c0..b0d671db178a 100644
> --- a/drivers/firewire/nosy.c
> +++ b/drivers/firewire/nosy.c
> @@ -511,12 +511,12 @@ remove_card(struct pci_dev *dev)
>  		wake_up_interruptible(&client->buffer.wait);
>  	spin_unlock_irq(&lynx->client_list_lock);
>  
> -	pci_free_consistent(lynx->pci_device, sizeof(struct pcl),
> -			    lynx->rcv_start_pcl, lynx->rcv_start_pcl_bus);
> -	pci_free_consistent(lynx->pci_device, sizeof(struct pcl),
> -			    lynx->rcv_pcl, lynx->rcv_pcl_bus);
> -	pci_free_consistent(lynx->pci_device, PAGE_SIZE,
> -			    lynx->rcv_buffer, lynx->rcv_buffer_bus);
> +	dma_free_coherent(&lynx->pci_device->dev, sizeof(struct pcl),
> +			  lynx->rcv_start_pcl, lynx->rcv_start_pcl_bus);
> +	dma_free_coherent(&lynx->pci_device->dev, sizeof(struct pcl),
> +			  lynx->rcv_pcl, lynx->rcv_pcl_bus);
> +	dma_free_coherent(&lynx->pci_device->dev, PAGE_SIZE, lynx->rcv_buffer,
> +			  lynx->rcv_buffer_bus);
>  
>  	iounmap(lynx->registers);
>  	pci_disable_device(dev);
> @@ -532,7 +532,7 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
>  	u32 p, end;
>  	int ret, i;
>  
> -	if (pci_set_dma_mask(dev, DMA_BIT_MASK(32))) {
> +	if (dma_set_mask(&dev->dev, DMA_BIT_MASK(32))) {
>  		dev_err(&dev->dev,
>  		    "DMA address limits not supported for PCILynx hardware\n");
>  		return -ENXIO;
> @@ -564,12 +564,16 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
>  		goto fail_deallocate_lynx;
>  	}
>  
> -	lynx->rcv_start_pcl = pci_alloc_consistent(lynx->pci_device,
> -				sizeof(struct pcl), &lynx->rcv_start_pcl_bus);
> -	lynx->rcv_pcl = pci_alloc_consistent(lynx->pci_device,
> -				sizeof(struct pcl), &lynx->rcv_pcl_bus);
> -	lynx->rcv_buffer = pci_alloc_consistent(lynx->pci_device,
> -				RCV_BUFFER_SIZE, &lynx->rcv_buffer_bus);
> +	lynx->rcv_start_pcl = dma_alloc_coherent(&lynx->pci_device->dev,
> +						 sizeof(struct pcl),
> +						 &lynx->rcv_start_pcl_bus,
> +						 GFP_KERNEL);
> +	lynx->rcv_pcl = dma_alloc_coherent(&lynx->pci_device->dev,
> +					   sizeof(struct pcl),
> +					   &lynx->rcv_pcl_bus, GFP_KERNEL);
> +	lynx->rcv_buffer = dma_alloc_coherent(&lynx->pci_device->dev,
> +					      RCV_BUFFER_SIZE,
> +					      &lynx->rcv_buffer_bus, GFP_KERNEL);
>  	if (lynx->rcv_start_pcl == NULL ||
>  	    lynx->rcv_pcl == NULL ||
>  	    lynx->rcv_buffer == NULL) {
> @@ -667,14 +671,15 @@ add_card(struct pci_dev *dev, const struct pci_device_id *unused)
>  
>  fail_deallocate_buffers:
>  	if (lynx->rcv_start_pcl)
> -		pci_free_consistent(lynx->pci_device, sizeof(struct pcl),
> -				lynx->rcv_start_pcl, lynx->rcv_start_pcl_bus);
> +		dma_free_coherent(&lynx->pci_device->dev, sizeof(struct pcl),
> +				  lynx->rcv_start_pcl,
> +				  lynx->rcv_start_pcl_bus);
>  	if (lynx->rcv_pcl)
> -		pci_free_consistent(lynx->pci_device, sizeof(struct pcl),
> -				lynx->rcv_pcl, lynx->rcv_pcl_bus);
> +		dma_free_coherent(&lynx->pci_device->dev, sizeof(struct pcl),
> +				  lynx->rcv_pcl, lynx->rcv_pcl_bus);
>  	if (lynx->rcv_buffer)
> -		pci_free_consistent(lynx->pci_device, PAGE_SIZE,
> -				lynx->rcv_buffer, lynx->rcv_buffer_bus);
> +		dma_free_coherent(&lynx->pci_device->dev, PAGE_SIZE,
> +				  lynx->rcv_buffer, lynx->rcv_buffer_bus);
>  	iounmap(lynx->registers);
>  
>  fail_deallocate_lynx:



-- 
Stefan Richter
-======--=-= -=== --=-=
http://arcgraph.de/sr/
