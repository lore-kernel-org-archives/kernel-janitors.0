Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20A64C433DB
	for <kernel-janitors@archiver.kernel.org>; Sat, 20 Feb 2021 09:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC80064ED7
	for <kernel-janitors@archiver.kernel.org>; Sat, 20 Feb 2021 09:40:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbhBTJkY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 20 Feb 2021 04:40:24 -0500
Received: from ciao.gmane.io ([116.202.254.214]:47148 "EHLO ciao.gmane.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229490AbhBTJkU (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 20 Feb 2021 04:40:20 -0500
Received: from list by ciao.gmane.io with local (Exim 4.92)
        (envelope-from <glkj-kernel-janitors-2@m.gmane-mx.org>)
        id 1lDOjf-0001Vf-JD
        for kernel-janitors@vger.kernel.org; Sat, 20 Feb 2021 10:39:35 +0100
X-Injected-Via-Gmane: http://gmane.org/
To:     kernel-janitors@vger.kernel.org
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] scsi: pm80xx: switch from 'pci_' to 'dma_' API
Date:   Sat, 20 Feb 2021 10:39:31 +0100
Message-ID: <38b0fe52-879c-7609-9cdf-cae7812ed534@wanadoo.fr>
References: <20210220083159.904990-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210220083159.904990-1-christophe.jaillet@wanadoo.fr>
Content-Language: fr
Cc:     linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Please ignore.

This one has already been applied, I'va attached the wrong patch.
Sorry for the noise.

CJ

Le 20/02/2021 à 09:31, Christophe JAILLET a écrit :
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below and has been
> hand modified to replace GFP_ with a correct flag.
> It has been compile tested.
> 
> When memory is allocated in 'pm8001_init_ccb_tag()' GFP_KERNEL can be used
> because this function already uses this flag a few lines above.
> 
> While at it, remove "pm80xx: " in a debug message. 'pm8001_dbg()' already
> add the driver name in the message.
> 
> 
> @@
> @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
> 
> @@
> @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
> 
> @@
> @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
> 
> @@
> @@
> -    PCI_DMA_NONE
> +    DMA_NONE
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_alloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3;
> @@
> -    pci_zalloc_consistent(e1, e2, e3)
> +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_free_consistent(e1, e2, e3, e4)
> +    dma_free_coherent(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_single(e1, e2, e3, e4)
> +    dma_map_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_single(e1, e2, e3, e4)
> +    dma_unmap_single(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4, e5;
> @@
> -    pci_map_page(e1, e2, e3, e4, e5)
> +    dma_map_page(&e1->dev, e2, e3, e4, e5)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_page(e1, e2, e3, e4)
> +    dma_unmap_page(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_map_sg(e1, e2, e3, e4)
> +    dma_map_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_unmap_sg(e1, e2, e3, e4)
> +    dma_unmap_sg(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2, e3, e4;
> @@
> -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
> 
> @@
> expression e1, e2;
> @@
> -    pci_dma_mapping_error(e1, e2)
> +    dma_mapping_error(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_dma_mask(e1, e2)
> +    dma_set_mask(&e1->dev, e2)
> 
> @@
> expression e1, e2;
> @@
> -    pci_set_consistent_dma_mask(e1, e2)
> +    dma_set_coherent_mask(&e1->dev, e2)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>     https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> ---
>   drivers/scsi/pm8001/pm8001_init.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/scsi/pm8001/pm8001_init.c b/drivers/scsi/pm8001/pm8001_init.c
> index d21078ca7fb3..bd626ef876da 100644
> --- a/drivers/scsi/pm8001/pm8001_init.c
> +++ b/drivers/scsi/pm8001/pm8001_init.c
> @@ -423,7 +423,7 @@ static int pm8001_alloc(struct pm8001_hba_info *pm8001_ha,
>   err_out_nodev:
>   	for (i = 0; i < pm8001_ha->max_memcnt; i++) {
>   		if (pm8001_ha->memoryMap.region[i].virt_ptr != NULL) {
> -			pci_free_consistent(pm8001_ha->pdev,
> +			dma_free_coherent(&pm8001_ha->pdev->dev,
>   				(pm8001_ha->memoryMap.region[i].total_len +
>   				pm8001_ha->memoryMap.region[i].alignment),
>   				pm8001_ha->memoryMap.region[i].virt_ptr,
> @@ -1197,12 +1197,13 @@ pm8001_init_ccb_tag(struct pm8001_hba_info *pm8001_ha, struct Scsi_Host *shost,
>   		goto err_out_noccb;
>   	}
>   	for (i = 0; i < ccb_count; i++) {
> -		pm8001_ha->ccb_info[i].buf_prd = pci_alloc_consistent(pdev,
> +		pm8001_ha->ccb_info[i].buf_prd = dma_alloc_coherent(&pdev->dev,
>   				sizeof(struct pm8001_prd) * PM8001_MAX_DMA_SG,
> -				&pm8001_ha->ccb_info[i].ccb_dma_handle);
> +				&pm8001_ha->ccb_info[i].ccb_dma_handle,
> +				GFP_KERNEL);
>   		if (!pm8001_ha->ccb_info[i].buf_prd) {
>   			pm8001_dbg(pm8001_ha, FAIL,
> -				   "pm80xx: ccb prd memory allocation error\n");
> +				   "ccb prd memory allocation error\n");
>   			goto err_out;
>   		}
>   		pm8001_ha->ccb_info[i].task = NULL;
> 


