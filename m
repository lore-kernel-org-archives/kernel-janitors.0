Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B03B7C4338F
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 14:57:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D77961214
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 Aug 2021 14:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237916AbhHXO6I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 Aug 2021 10:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238019AbhHXO6H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 Aug 2021 10:58:07 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32393C0613C1
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Aug 2021 07:57:23 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id j4so11279297lfg.9
        for <kernel-janitors@vger.kernel.org>; Tue, 24 Aug 2021 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MCU02vQPCVRgosx/P23fJfyqXhya+bGULRpnI6avmR0=;
        b=rdV9Y+oO+VdMGr5BqhX09UBghNWF/clEGIf27uALLkpJ5V4Zz28O9+CRNr/rI9fV3Q
         7G4wYcOxN67lJTrtmWxSlK37mKws2ZMSwvZnRhDUS3MBTF7UeBijAx2qkKIV+iCjbpXZ
         8PvY27yGjSKEsXZIMenQRqFlSiCdKWpfd/IgvO7EB0bLXMQIBtaOp4YTafzioQM/Nrk/
         slmHOcq28u70TjJbV43chsHgDR0YuI5McXGOvg0fWD5VXRGYEoazi33GXuC3JDRXx/TV
         tOzmowqFBtQ3SPFR8XfuvsPYJMcVE8kvgJn7ovCMcwmy/hEUJd7PL6aCkKkIp0Y6lvdv
         zuBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MCU02vQPCVRgosx/P23fJfyqXhya+bGULRpnI6avmR0=;
        b=DOBFKCjwLT0pqU0EWXjmz0SQP+YCl7QkHuzIs5KN/QRO3jumtbK+lgMg+F2G3X9icQ
         1WKa/JN9kKMJyggnd4+TsEEP/nwn5nTzMLLlHDhYDV2/qZvzyslMQc7FLwLQGy2dtOOo
         GlSKZOs77jFpB/WBlnI8gQdbv2OuA2WwUAZkGKyVwlq7BC6U2R8W3FR+9GSAYjSak69j
         qKG0j7rGGUnMSiKnzT+D0WC/VzYvUtlMi8yX2ic2niJH2qaJ4Xtlxok+60YOqwxJN+vU
         5zrC1mEBw2D952s4/nF8qW6790SdilC5oZ7sQLlY6dsonrQLssisuweOyMvCUMQ1UYNO
         AX8A==
X-Gm-Message-State: AOAM5303jinlGDiskdXCQnhXco4l+mqBtYe8G/PTEv15YjcWa6jOu6os
        wlsmhSGGbbuVEY1Pg3yYQxcAWvMhSWmYgvip9ZyINw==
X-Google-Smtp-Source: ABdhPJxRJla/SFQy/LavlYVBASTtA3qqzyQgbbFnID1BGsRI/uqwA5R5lVA2m9qSnDfHubRMYHK2MKsxWrFiRS7IaaE=
X-Received: by 2002:a05:6512:318e:: with SMTP id i14mr29774273lfe.113.1629817041551;
 Tue, 24 Aug 2021 07:57:21 -0700 (PDT)
MIME-Version: 1.0
References: <f6fe24f2372c8c627a08ace7187bfe60d35788b6.1629580314.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f6fe24f2372c8c627a08ace7187bfe60d35788b6.1629580314.git.christophe.jaillet@wanadoo.fr>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 24 Aug 2021 16:56:45 +0200
Message-ID: <CAPDyKFr5_MqtbXsk9JWf+oYSFW+uU+W4otq-hu+ZYKq_p+Bokw@mail.gmail.com>
Subject: Re: [PATCH] memstick: switch from 'pci_' to 'dma_' API
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Maxim Levitsky <maximlevitsky@gmail.com>,
        Alex Dubov <oakad@yahoo.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 21 Aug 2021 at 23:13, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The wrappers in include/linux/pci-dma-compat.h should go away.
>
> The patch has been generated with the coccinelle script below.
> It has been compile tested.
>
> No memory allocation in involved in this patch, so no GFP_ tweak is needed.
>
> @@ @@
> -    PCI_DMA_BIDIRECTIONAL
> +    DMA_BIDIRECTIONAL
>
> @@ @@
> -    PCI_DMA_TODEVICE
> +    DMA_TO_DEVICE
>
> @@ @@
> -    PCI_DMA_FROMDEVICE
> +    DMA_FROM_DEVICE
>
> @@ @@
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

Applied for next, thanks!

Kind regards
Uffe


> ---
> If needed, see post from Christoph Hellwig on the kernel-janitors ML:
>    https://marc.info/?l=kernel-janitors&m=158745678307186&w=4
> ---
>  drivers/memstick/host/r592.c    |  5 ++---
>  drivers/memstick/host/tifm_ms.c | 12 ++++++------
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/memstick/host/r592.c b/drivers/memstick/host/r592.c
> index 615a83782e55..7ed984360349 100644
> --- a/drivers/memstick/host/r592.c
> +++ b/drivers/memstick/host/r592.c
> @@ -293,7 +293,7 @@ static int r592_transfer_fifo_dma(struct r592_device *dev)
>
>         /* TODO: hidden assumption about nenth beeing always 1 */
>         sg_count = dma_map_sg(&dev->pci_dev->dev, &dev->req->sg, 1, is_write ?
> -               PCI_DMA_TODEVICE : PCI_DMA_FROMDEVICE);
> +                             DMA_TO_DEVICE : DMA_FROM_DEVICE);
>
>         if (sg_count != 1 || sg_dma_len(&dev->req->sg) < R592_LFIFO_SIZE) {
>                 message("problem in dma_map_sg");
> @@ -310,8 +310,7 @@ static int r592_transfer_fifo_dma(struct r592_device *dev)
>         }
>
>         dma_unmap_sg(&dev->pci_dev->dev, &dev->req->sg, 1, is_write ?
> -               PCI_DMA_TODEVICE : PCI_DMA_FROMDEVICE);
> -
> +                    DMA_TO_DEVICE : DMA_FROM_DEVICE);
>
>         return dev->dma_error;
>  }
> diff --git a/drivers/memstick/host/tifm_ms.c b/drivers/memstick/host/tifm_ms.c
> index 57145374f6ac..c272453670be 100644
> --- a/drivers/memstick/host/tifm_ms.c
> +++ b/drivers/memstick/host/tifm_ms.c
> @@ -279,8 +279,8 @@ static int tifm_ms_issue_cmd(struct tifm_ms *host)
>         if (host->use_dma) {
>                 if (1 != tifm_map_sg(sock, &host->req->sg, 1,
>                                      host->req->data_dir == READ
> -                                    ? PCI_DMA_FROMDEVICE
> -                                    : PCI_DMA_TODEVICE)) {
> +                                    ? DMA_FROM_DEVICE
> +                                    : DMA_TO_DEVICE)) {
>                         host->req->error = -ENOMEM;
>                         return host->req->error;
>                 }
> @@ -350,8 +350,8 @@ static void tifm_ms_complete_cmd(struct tifm_ms *host)
>         if (host->use_dma) {
>                 tifm_unmap_sg(sock, &host->req->sg, 1,
>                               host->req->data_dir == READ
> -                             ? PCI_DMA_FROMDEVICE
> -                             : PCI_DMA_TODEVICE);
> +                             ? DMA_FROM_DEVICE
> +                             : DMA_TO_DEVICE);
>         }
>
>         writel((~TIFM_CTRL_LED) & readl(sock->addr + SOCK_CONTROL),
> @@ -607,8 +607,8 @@ static void tifm_ms_remove(struct tifm_dev *sock)
>                 if (host->use_dma)
>                         tifm_unmap_sg(sock, &host->req->sg, 1,
>                                       host->req->data_dir == READ
> -                                     ? PCI_DMA_TODEVICE
> -                                     : PCI_DMA_FROMDEVICE);
> +                                     ? DMA_TO_DEVICE
> +                                     : DMA_FROM_DEVICE);
>                 host->req->error = -ETIME;
>
>                 do {
> --
> 2.30.2
>
