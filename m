Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56D2C32771
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Sep 2022 00:46:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIPAqC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 15 Sep 2022 20:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiIPAqB (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 15 Sep 2022 20:46:01 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70AED857D3
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Sep 2022 17:45:59 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id w28so5409267edi.7
        for <kernel-janitors@vger.kernel.org>; Thu, 15 Sep 2022 17:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=fgvuqsUTyWyuOvAIEgrlM+1FJPr0CKG3fXPQsUY/0fA=;
        b=cLx8a1wYzET6txnhpQe08LOWhlT2HAaOoEZ6Xivw5dltqJhG5nNtCsQ0KD4vzbdN/N
         M82otOxiqyjLzN6gYqig2MI5FbZiP8z/0epchRNXhz2xKF3VEO1kQL63JnCk2PL1qzA5
         u+z6KZrKuPKZBB2U97Xd4bX1iduraXZLJTgpCJi9YqQywjVI4rFnF3emhLFEJZGYHZkK
         N4d8835lZypHOoMBHcS7ibvuIYSsuk7Oh325nGuCtxDtjHnyoq6VjbC63Gi5hgNGISxP
         gM//Fi7GrxIdxZOyYkYFViPXPlR8mQ6+TPCywflwoun6XLbrkoGSgD55COpAvGSOUudr
         +adg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=fgvuqsUTyWyuOvAIEgrlM+1FJPr0CKG3fXPQsUY/0fA=;
        b=LyPrUKp70NUryke2yya+mB0/e+bHzl30buaKUSB6da/zX/LDn51uxnkRz9BTQvrJZq
         ++3LiyXQdWBh1glYkXE4IIzD1TLUBmL9+k9kaKv0HqtAgVRP53XhzXHyqpNS7Dib3sTw
         WwHUCWrcBxdPxmNP0seGt8uy244QfqA68AoB2QxdGUxpSR96TlHy971B4ljO/5YN0Y1L
         NNwkQpPNBjcQEy+67mHbXKPLDEreTmRhDvUj9q+FKfUWAbm0FM3ERn8+Zh4TXhwjLk6l
         cJlWD1Iy2cZz4B3BrN0xhgZPNMS2BNDgeuZSzEYO+8Adm0iICGwH/j4pOjb+ETaTdwqQ
         BnBQ==
X-Gm-Message-State: ACrzQf1qjxZu/kdQldQWEXT3XHFA3rVNQkvC2W37GrSsfdQd9AmQwjMw
        dPN5OHFeqFbU5Ts6TGOYTEutdx/Ht+/bs3pxxUo=
X-Google-Smtp-Source: AMsMyM765GVM5HcFPB43/QMjNSuBYxWMcW2k/CHvmEVg52f2dnJANqGDzrkFWPFpWGtgqCTEqMLOAuL9dBQOLX2/gkY=
X-Received: by 2002:a05:6402:194e:b0:452:5f30:7b03 with SMTP id
 f14-20020a056402194e00b004525f307b03mr1990017edz.124.1663289157743; Thu, 15
 Sep 2022 17:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <YyMJBkId0c1lvrrO@kili>
In-Reply-To: <YyMJBkId0c1lvrrO@kili>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Thu, 15 Sep 2022 17:45:46 -0700
Message-ID: <CAPaKu7SCZuX_agp3WUWkra63w6=+ZMyLSSqk9tZyB+B75sVo7w@mail.gmail.com>
Subject: Re: [PATCH] virtio-gpu: fix shift wrapping bug in virtio_gpu_fence_event_create()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     David Airlie <airlied@linux.ie>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 15, 2022 at 4:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The ->ring_idx_mask variable is a u64 so static checkers, Smatch in
> this case, complain if the BIT() is not also a u64.
>
> drivers/gpu/drm/virtio/virtgpu_ioctl.c:50 virtio_gpu_fence_event_create()
> warn: should '(1 << ring_idx)' be a 64 bit type?
>
> Fixes: cd7f5ca33585 ("drm/virtio: implement context init: add virtio_gpu_fence_event")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> index 3b1701607aae..14eedb75f8a8 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
> @@ -47,7 +47,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
>         struct virtio_gpu_fence_event *e = NULL;
>         int ret;
>
> -       if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
> +       if (!(vfpriv->ring_idx_mask & (1ULL << ring_idx)))
BIT_ULL(ring_indx)?

>                 return 0;
>
>         e = kzalloc(sizeof(*e), GFP_KERNEL);
> --
> 2.35.1
>
