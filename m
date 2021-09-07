Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF56C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:06:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D8E66108D
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:06:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244339AbhIGJH4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 05:07:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51939 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243468AbhIGJHz (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 05:07:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631005609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=AoarMMFjAAFuhEbXWQAnXoDm5tBdzybtqAeK/tkz6ls=;
        b=Ge4DlR97oqZyuCdA6iJFZk5hsEOeqIMCXw5N9G1/L3axcQbya6nq6vA0oim9fcIVr5OOdZ
        E/m+OrQeXoKu8fqgcfjRHgXcqoHE/koTgeP12YOvZom2lNGRaJy6PsF7Aeum7Trrrpob8D
        OWzGN/qFimJ3/9O7JFB8ldW/bhvwSSA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-qAyecilmOwKM-UQ2fY3r2Q-1; Tue, 07 Sep 2021 05:06:47 -0400
X-MC-Unique: qAyecilmOwKM-UQ2fY3r2Q-1
Received: by mail-lj1-f197.google.com with SMTP id x10-20020a05651c024a00b001cf8e423d60so4598935ljn.12
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 02:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AoarMMFjAAFuhEbXWQAnXoDm5tBdzybtqAeK/tkz6ls=;
        b=hVeIT1TW7aFsq17Ojkaa8YkN39QTZ6oeyPxPJD0cnIvppHAw6VgSbfPF9+mz5mug5E
         4O2VOGJGwKsBu/j+em9vt9q1OfYWsvHxXk8xiyuybsiJD/VumLmMeFm4oNvnKnJhahvO
         sPH7t7bvrHKynVS+jrDOzb3UCPqcE0a7L2nAeQjax95tIP6LHTV1D71TT/rCo7B5zNaW
         etfRlsPFUoE2V/ptskGSjXYvcId+DFE+cwgSsgphl5C/rbpmnaLBttMJNro4ts2fRvO8
         L3KiLZg6BYAkjFVwgm/ngqze9WnJZu8Ja5JKxqMvMG/452SvA8SQlH/x7FgiJPTloLs+
         vmkg==
X-Gm-Message-State: AOAM5312zLgNOMiB/yF9xAVBqGLegPTqnh5TCMwq0ANQAl5rqcY564x1
        mNQQDans0BGGkspK3x5MnjAfB3UOlg+E/z286cLFEqngDQCtaD9qiRs0MDqmU5jcb+PnXT6sBYu
        491U3lggdFKOx94V2WhksRWWFa7vK/MnllLTDd5zZNQW4
X-Received: by 2002:a2e:7018:: with SMTP id l24mr13880500ljc.277.1631005606418;
        Tue, 07 Sep 2021 02:06:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEm+i4T+mdnjA50nS9WOjbAHu2OMjLubqpcwKwXTCbLGnGaWLWifUJq7PrZixyZ7smT5mY1EMNZu4R1wc9mNw=
X-Received: by 2002:a2e:7018:: with SMTP id l24mr13880490ljc.277.1631005606239;
 Tue, 07 Sep 2021 02:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210907073223.GA18254@kili>
In-Reply-To: <20210907073223.GA18254@kili>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 7 Sep 2021 17:06:35 +0800
Message-ID: <CACGkMEtziWuAF_iTqpL3SmgmM4TuELijMvRGMb0n+y9gpqV_=w@mail.gmail.com>
Subject: Re: [PATCH] vduse: missing error code in vduse_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Xie Yongji <xieyongji@bytedance.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 7, 2021 at 3:32 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This should return -ENOMEM if alloc_workqueue() fails.  Currently it
> returns success.
>
> Fixes: b66219796563 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index 5c25ff6483ad..fcd7de8dd1f2 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -1593,8 +1593,10 @@ static int vduse_init(void)
>
>         vduse_irq_wq = alloc_workqueue("vduse-irq",
>                                 WQ_HIGHPRI | WQ_SYSFS | WQ_UNBOUND, 0);
> -       if (!vduse_irq_wq)
> +       if (!vduse_irq_wq) {
> +               ret = -ENOMEM;
>                 goto err_wq;
> +       }
>
>         ret = vduse_domain_init();
>         if (ret)
> --
> 2.20.1
>

Acked-by: Jason Wang <jasowang@redhat.com>

