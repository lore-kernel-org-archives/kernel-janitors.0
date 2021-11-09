Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACC9AC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 02:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9646F6120A
	for <kernel-janitors@archiver.kernel.org>; Tue,  9 Nov 2021 02:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242095AbhKIC72 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 8 Nov 2021 21:59:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36685 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242090AbhKIC70 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 8 Nov 2021 21:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636426601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JHvu3XTSxpKAPKxPraFsC3ipd6AaaaqYJT0sjfs7xH0=;
        b=iocWGQV1Ec+Mpj9nv4Tdc+wig229FRhTyuOazCwFU8PibDvm75IOpR1+KqChEu8thZrSmc
        sFsnhvmGt56hWAGgKjLNmY8DkBnqNlvhrfjVGvvrSM9oy6maBHfZ6RO/38ppBU/wgnw/2f
        5UNGj0Ye9BqHWdWNBi3uECTWH/AL0fg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-lPp-OGhlNdWdSaDzFIWk_Q-1; Mon, 08 Nov 2021 21:56:40 -0500
X-MC-Unique: lPp-OGhlNdWdSaDzFIWk_Q-1
Received: by mail-lf1-f71.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso6004848lfv.7
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Nov 2021 18:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JHvu3XTSxpKAPKxPraFsC3ipd6AaaaqYJT0sjfs7xH0=;
        b=F56HtpdImUWPy7HAzGlXXGg0NnxukbqMjFNuiWokY5R7X8zOe/SD+Uqcg2jqjWJRs9
         Aeqb1vGJihySEdsUttm6eA9wl+FYF/Jxtt7i2BGKXZNbANqApGHR/jZrEZkexs2uXrxC
         N4qC2NEB433nyqsyeHfj0o5jA8LQQ1t2CZ/MsQqyJ2C1aNHD+s+6z9JGyVg3kVsX6Q86
         A3d1t3+ho9USvguKGWpxuM5Keo8WP/0hSCDooNfiGfzSpL0bLIHaYvnwFlBglGvb1G/C
         ZuHNqj+CqRhbi/7VeA0LNCIoWtUvhxMrEy5oo6PORexiN7x9hluNhI8+RaZYSN3Sfdu4
         IfNg==
X-Gm-Message-State: AOAM530ZrwiyJQRwgjpSJ3g1WWbt8seYWGQdSwwpsMV/UEtUa5UwUZTc
        25PyM1mOGUDRzLkA+x1bBBXYpBNiiBqMDa+R2JxLP9+1Pz+1fgg8cMnjI6wtbjHfgyekKkjl7AG
        imPNRarE279cFEGbOEalvJJMq6iSLJawEnqVr5ZOErMRP
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr4053536ljk.107.1636426598683;
        Mon, 08 Nov 2021 18:56:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS0xouPIEbcfGrEIA1f9+MGc01Gw65/pL0zQKLFQYgTcVajy8bhK7Y9nb5RTP7yGFat3VCFBGMoT19gfnMt34=
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr4053522ljk.107.1636426598529;
 Mon, 08 Nov 2021 18:56:38 -0800 (PST)
MIME-Version: 1.0
References: <f6b2d087ca3840604b4e711a208d35b5d6285cb4.1636301587.git.christophe.jaillet@wanadoo.fr>
 <02045bdcbbb25f79bae4827f66029cfcddc90381.1636301587.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <02045bdcbbb25f79bae4827f66029cfcddc90381.1636301587.git.christophe.jaillet@wanadoo.fr>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 9 Nov 2021 10:56:27 +0800
Message-ID: <CACGkMEuimP8dcWrBk01P-bU-L-xPH=gN4=qAY_tAqnMHqpW+rA@mail.gmail.com>
Subject: Re: [PATCH 2/2] eni_vdpa: Simplify 'eni_vdpa_probe()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     mst <mst@redhat.com>, Wu Zongyong <wuzongyong@linux.alibaba.com>,
        Arnd Bergmann <arnd@arndb.de>,
        virtualization <virtualization@lists.linux-foundation.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Nov 8, 2021 at 12:15 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> When 'pcim_enable_device()' is used, some resources become automagically
> managed.
> There is no need to call 'pci_free_irq_vectors()' when the driver is
> removed. The same will already be done by 'pcim_release()'.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
> Leaving the 'pci_free_irq_vectors()' call is harmless.
> ---
>  drivers/vdpa/alibaba/eni_vdpa.c | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
> index 12b3db6b4517..3db686436628 100644
> --- a/drivers/vdpa/alibaba/eni_vdpa.c
> +++ b/drivers/vdpa/alibaba/eni_vdpa.c
> @@ -450,11 +450,6 @@ static u16 eni_vdpa_get_num_queues(struct eni_vdpa *eni_vdpa)
>         return num;
>  }
>
> -static void eni_vdpa_free_irq_vectors(void *data)
> -{
> -       pci_free_irq_vectors(data);
> -}
> -
>  static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>         struct device *dev = &pdev->dev;
> @@ -488,13 +483,6 @@ static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>         eni_vdpa->vdpa.dma_dev = &pdev->dev;
>         eni_vdpa->queues = eni_vdpa_get_num_queues(eni_vdpa);
>
> -       ret = devm_add_action_or_reset(dev, eni_vdpa_free_irq_vectors, pdev);
> -       if (ret) {
> -               ENI_ERR(pdev,
> -                       "failed for adding devres for freeing irq vectors\n");
> -               goto err;
> -       }
> -
>         eni_vdpa->vring = devm_kcalloc(&pdev->dev, eni_vdpa->queues,
>                                       sizeof(*eni_vdpa->vring),
>                                       GFP_KERNEL);
> --
> 2.30.2
>

