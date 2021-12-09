Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10E3C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Dec 2021 02:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhLICQ0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Dec 2021 21:16:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23222 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229909AbhLICQ0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Dec 2021 21:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639015973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MEWVgWgffKxw4U2CvNG/Nz2R6p0InYBLy3bcY3R6wRg=;
        b=VAmx8YfYdFIoJkzi3E+aXeE+4Fkhvb2lUno+Nb4GNTpwcF9pHAXrM5xFP0EZxiFRNyQAfx
        Mpn/yvOy/86pvGsrucTCLCOzTiJwAo18ff+wmDrKaJEqQZ3UL8+L63X6Fy9bVLzE64gDio
        D+OpufV6sYjWqjU20Qt1VC5wadeqLyI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-399-9L2rL5NYNKiNPMHZfaMxwA-1; Wed, 08 Dec 2021 21:12:52 -0500
X-MC-Unique: 9L2rL5NYNKiNPMHZfaMxwA-1
Received: by mail-lj1-f199.google.com with SMTP id s16-20020a2ea710000000b0021b674e9347so1258084lje.8
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Dec 2021 18:12:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MEWVgWgffKxw4U2CvNG/Nz2R6p0InYBLy3bcY3R6wRg=;
        b=nxT/+azpykdxVvDDIy3rsujICE/o1JweHsnN8qOf4/KAVqEy/ZwDwF2kZDcInDmum3
         rcgPs8RZyCXyuIc/CiN48L4N8FefD1bnZ9y1hc5iFXy5cNiC1oJWqq9Mbbtx78eDWoh5
         /cN4L4A7YH+BAwfZc5ur8W+Aq8lVYvdlyJfPuyGjXqIaj8O26OcBRATChYSa/arixcUS
         wtA9J56vQoXOSKc9MYz0lutMs/mALbNOvHDUrXKZzDp09I6niksgoPwzpMyURGueP2qi
         pJxF3zzY3/2o1vS44Vw67LFWRDR/kMzkys03xrd7Rldm4ocv+fGIXS36m8rseJlOSvVM
         r9XA==
X-Gm-Message-State: AOAM531i8C6IsXYu+dKWJkF27oUhosE7RJvS7nI+No2Sb+Yna2potncl
        et25S9otvTskcePheJIeuRTzhnvgVEk9oYrE/WWhqS28YWzgHp/mPv0XXZpL1cD9TzQPxWGazkB
        heT7gZzfKBcBYiO7aMLmw/53apsEbdjoEQEJO4VhM6nA0
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr3180204lfe.84.1639015970655;
        Wed, 08 Dec 2021 18:12:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWSd19fYzNfzF0iKgDq8dz6O3KSiopO1bKJF9lx/YJwa4HcsU1ukxk7ZBqxihKr9YzOp/zGv6WN1NjNiAR38o=
X-Received: by 2002:a05:6512:685:: with SMTP id t5mr3180178lfe.84.1639015970369;
 Wed, 08 Dec 2021 18:12:50 -0800 (PST)
MIME-Version: 1.0
References: <20211208103307.GA3778@kili> <20211208103337.GA4047@kili>
In-Reply-To: <20211208103337.GA4047@kili>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 9 Dec 2021 10:12:39 +0800
Message-ID: <CACGkMEtp+29Y4zcUppakRmQLqKbkUfFN-dm6a70bvn9GUCrWRA@mail.gmail.com>
Subject: Re: [PATCH 2/2 v4] vdpa: check that offsets are within bounds
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Tiwei Bie <tiwei.bie@intel.com>,
        Xie Yongji <xieyongji@bytedance.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        kvm <kvm@vger.kernel.org>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 8, 2021 at 6:34 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> In this function "c->off" is a u32 and "size" is a long.  On 64bit systems
> if "c->off" is greater than "size" then "size - c->off" is a negative and
> we always return -E2BIG.  But on 32bit systems the subtraction is type
> promoted to a high positive u32 value and basically any "c->len" is
> accepted.
>
> Fixes: 4c8cf31885f6 ("vhost: introduce vDPA-based backend")
> Reported-by: Xie Yongji <xieyongji@bytedance.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
> v4: split into a separate patch
>
>  drivers/vhost/vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 29cced1cd277..e3c4f059b21a 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -197,7 +197,7 @@ static int vhost_vdpa_config_validate(struct vhost_vdpa *v,
>         struct vdpa_device *vdpa = v->vdpa;
>         long size = vdpa->config->get_config_size(vdpa);
>
> -       if (c->len == 0)
> +       if (c->len == 0 || c->off > size)
>                 return -EINVAL;
>
>         if (c->len > size - c->off)
> --
> 2.20.1
>

