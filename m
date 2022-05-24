Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0139BC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 24 May 2022 05:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232801AbiEXF6I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 24 May 2022 01:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234710AbiEXF6G (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 24 May 2022 01:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7C44424975
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 22:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653371884;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iRsHIOR007k/L1XQpNezvwZ0qtxHfPjrnmZz0DariKE=;
        b=Dc2BKNdjFKZKCEwvTdATLoIXX4JwCBnUFFjjqoXjMV1bS1V17R3EHojohhPSDZQX5pec3F
        v6hfzmLpx6KF9rMRmAGttIfltt1Eg44s7w96eNUP0VtotZ4Ai2tTRR7CkJDfMvRG1DFf1E
        1yoC9//BrdL8CM5GdpEM6iqnVTSCR6g=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-hl9tqK0EM6KYlfJPPYEnJw-1; Tue, 24 May 2022 01:58:00 -0400
X-MC-Unique: hl9tqK0EM6KYlfJPPYEnJw-1
Received: by mail-lj1-f199.google.com with SMTP id y20-20020a05651c021400b00253f0227639so744639ljn.0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 May 2022 22:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iRsHIOR007k/L1XQpNezvwZ0qtxHfPjrnmZz0DariKE=;
        b=MrmacuWJ5jrbEYZ6tzaKUbEy5xNWbZKe+vHti+AAi+JLThdLIHvjSkOcV7euRZkO4k
         JkcM8OxTiGGEVRM1UWplHcwqc8Q6cZwoH1TEcApHpg5eJwMcXaEWXd+JEfX5SG/nfdsc
         jkZMeAM8EE1ntGMmZ/TELrh6x6DUYcfGbQ12cx45GHLoZfXUGJSznj1rCcQyHy5e4Lup
         sxnZbCQj5cgrbTFJqYJv63XerVYdhQzN0itMttWlwNj/c+WSjGmaoVz3tgQyWYL/XOhO
         15IKmUsy9UzOEI7ppKsK4AaL5U3jw3pfO8U+Ko/lqXjv0pSv7zJ7k/YotSY9QiiYP1Bg
         clAA==
X-Gm-Message-State: AOAM530EV9/GS62GGcwPtY7qY9OrfqixAj40+c8p/JfdL5dj1xh1Bpnp
        5wSbpnNqID8/BU/Jh2uAhFE+CHSIlzjNwZsfGEu1v6Nq9IKhnmMC1n2M+lAtB2WbUFPhzQL283x
        AJw5R8aBplQ06DpjB30zQM6GwS0I9bjesFeRxatzOqtJa
X-Received: by 2002:a05:6512:a95:b0:478:82fb:7783 with SMTP id m21-20020a0565120a9500b0047882fb7783mr2719317lfu.471.1653371878643;
        Mon, 23 May 2022 22:57:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdIOa1D3s+m3Tp1eQDuX1Gh0Mpm9SPH0wyM3HX3XlwtkdZpXZEMGlf2l4NS4ke0tLB60DGtq+EgfSWK3afyAE=
X-Received: by 2002:a05:6512:a95:b0:478:82fb:7783 with SMTP id
 m21-20020a0565120a9500b0047882fb7783mr2719307lfu.471.1653371878497; Mon, 23
 May 2022 22:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <YotGQU1q224RKZR8@kili>
In-Reply-To: <YotGQU1q224RKZR8@kili>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 24 May 2022 13:57:47 +0800
Message-ID: <CACGkMEsgkTWsCsNa+igLCoKm0uVNV=RywB_nVOKiXb3Hu4yUQg@mail.gmail.com>
Subject: Re: [PATCH] vdpasim: Off by one in vdpasim_set_group_asid()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Gautam Dawar <gautam.dawar@xilinx.com>,
        Xie Yongji <xieyongji@bytedance.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        Eli Cohen <elic@nvidia.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 23, 2022 at 4:31 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The > comparison needs to be >= to prevent an out of bounds access
> of the vdpasim->iommu[] array.  The vdpasim->iommu[] is allocated in
> vdpasim_create() and it has vdpasim->dev_attr.nas elements.
>
> Fixes: 87e5afeac247 ("vdpasim: control virtqueue support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  drivers/vdpa/vdpa_sim/vdpa_sim.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> index 50d721072beb..0f2865899647 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
> @@ -567,7 +567,7 @@ static int vdpasim_set_group_asid(struct vdpa_device *vdpa, unsigned int group,
>         if (group > vdpasim->dev_attr.ngroups)
>                 return -EINVAL;
>
> -       if (asid > vdpasim->dev_attr.nas)
> +       if (asid >= vdpasim->dev_attr.nas)
>                 return -EINVAL;
>
>         iommu = &vdpasim->iommu[asid];
> --
> 2.35.1
>

