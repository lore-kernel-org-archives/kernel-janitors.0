Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B684C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:07:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0830F610FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:07:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244339AbhIGJIl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 05:08:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54548 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243468AbhIGJIk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 05:08:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631005654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=qAbrajUImQsNbl+54xKWY1HmrI2rlWAF0jAOLQ+Wpp0=;
        b=RsIfrasbUTi6NjG5ploafVG1iViS6oZPPz3r5taRr5Le1pmtDQXUS65DMR6BH0S9NS0nYk
        fzLQLgaMR32+cT1sU/oLv34lnPcwgFFeaJhuiPwTeoxvvxmKFyItzGTClecX7NaCS+PI0v
        d+cR0I/iMGUbkPDcCRomPMfpaRyjvxw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-Ffs4_7ExOzyYPO7EfkOaOw-1; Tue, 07 Sep 2021 05:07:33 -0400
X-MC-Unique: Ffs4_7ExOzyYPO7EfkOaOw-1
Received: by mail-lj1-f197.google.com with SMTP id m10-20020a2e97ca000000b001bb5da17f7dso4453456ljj.19
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 02:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qAbrajUImQsNbl+54xKWY1HmrI2rlWAF0jAOLQ+Wpp0=;
        b=i9VeJNNi+9nS2IXerZt5iF8polPEV9cpSE3jjze/Gp/2h9OBCwg+c00oCn2Ucr87Mv
         gpBR/F/NRRVGPKGzwB5M40Cg7OgT7CTOKUajY4Jzz/leoZC4bFWyLqIvn79u2N9I/f8v
         tg2YEZgYE12SCneWpkWpedf+WIo6wtuo6kp29w1ptMezmrF9GcnLbCf43FP4UsPouhiu
         z3D8afVWuaZGtS91+KWK2Z/+KcONKELTip9M32FoK/AaZryGLP2EeFI0INDj1bA5sezu
         iFQfSDfevV1RoxeA8yjLX6QW5FGJ64eoKcRtnUEdp+GQsafXpugXNRsC7MnZCGNNqbAL
         miOA==
X-Gm-Message-State: AOAM533vKfpnT7QcCWRm2Es3KmyrqHQpzrZEIAggIwOnppIjfyAv+1Aj
        iLJsojfp3tijgjsPx2YeshMHxYHickDpKFd2aeDCRd2tTCmYwrTjLks+zslRwEcaF5rUt+RdwUd
        nA5S3zQs55ANJ4I6Kq0HNzLayf/jcgzYKX+QCm/OYj/FW
X-Received: by 2002:a05:651c:b09:: with SMTP id b9mr13632670ljr.307.1631005651617;
        Tue, 07 Sep 2021 02:07:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyA6rmhH92bvEWu5eHDzbTkJhlWL/S7ozNl5daqqIyvMCYBZW0fhd4JHi1HidLOXMM7y8Jq3TpJyu7x5JjY70=
X-Received: by 2002:a05:651c:b09:: with SMTP id b9mr13632654ljr.307.1631005651422;
 Tue, 07 Sep 2021 02:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210907073253.GB18254@kili>
In-Reply-To: <20210907073253.GB18254@kili>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 7 Sep 2021 17:07:20 +0800
Message-ID: <CACGkMEux1WRD_9kWhvUXThwWo7DUPCM==eXAj9PO6mqcAvVtQQ@mail.gmail.com>
Subject: Re: [PATCH] vdpa: potential uninitialized return in vhost_vdpa_va_map()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Xie Yongji <xieyongji@bytedance.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 7, 2021 at 3:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The concern here is that "ret" can be uninitialized if we hit the
> "goto next" condition on every iteration through the loop.
>
> Fixes: 41ba1b5f9d4b ("vdpa: Support transferring virtual addressing during DMA mapping")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/vhost/vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index d0c0fedf2c09..170166806714 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -640,7 +640,7 @@ static int vhost_vdpa_va_map(struct vhost_vdpa *v,
>         u64 offset, map_size, map_iova = iova;
>         struct vdpa_map_file *map_file;
>         struct vm_area_struct *vma;
> -       int ret;
> +       int ret = 0;
>
>         mmap_read_lock(dev->mm);
>
> --
> 2.20.1
>

Acked-by: Jason Wang <jasowang@redhat.com>

