Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAA3C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Dec 2021 03:43:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbhLHDrE (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Dec 2021 22:47:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44523 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232748AbhLHDrD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Dec 2021 22:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638935011;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sffol2sjF3kR5DyO351++++uXmiYwv8fKQzdh/YzKIo=;
        b=JGADhgx/O23CWEHfOiTMXykGM53dClWgZqcI/z2hIhe+132/WFgxbfs+DDhlXreIyWNrMJ
        vJLGFi1sBqsUnynL9bRKMCbkcCqntUcZCoicff27fuxeHZL+nuwuOtRiAR4eK7ekqbMMjN
        6Br6YHEB2GrWmWIlqwB4vGCtqd1C88E=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-BwkK75kLONmAoU6BLCUkHA-1; Tue, 07 Dec 2021 22:43:27 -0500
X-MC-Unique: BwkK75kLONmAoU6BLCUkHA-1
Received: by mail-lj1-f199.google.com with SMTP id i123-20020a2e2281000000b0021cfde1fa8eso375079lji.7
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Dec 2021 19:43:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sffol2sjF3kR5DyO351++++uXmiYwv8fKQzdh/YzKIo=;
        b=RWWSk1ro2/eEmAPSs5PEN/2r8Eu/F9k8eEy+EfeMOGjXaQIcRzEcbmzFlCxFQgozqY
         qUUiXnMYFKDa1QoOXBct+i/He56G6FuuC59j/Y7bWy95pJfp6uLRrJKlw8+QicP5ze/r
         wk/vgsBkjxvKIhhlNjfHhFuMu+CVgkyhi2eSOurFoSDKQ5ahb81MMSMn6W8Cs7sLavvi
         6uPyHqN06wex0RWKbDpLHMUU1Eg0/LxMzZzIwSiRVZMa14GrFNGJho2PejYoNbnmIavd
         uJi0J+Ayuqa6BgtBP0pP9xdIxgZH+sqFdV1yNMaBFaI6QKeW+ySzTY8SfqQBdz+VU4uM
         cNkA==
X-Gm-Message-State: AOAM531FuFFQFKffeRMtnPL3Taw0933kKN9uBTa3BAXWWwQ5XcCUV+RP
        cwcxNM2T6i6hLo0ma1WHps0LfxLS4HWUa5Hzf02u6otvBsLoBS7rTCNZsPvY4YsjQ3tFQe0Usmr
        jAzLGsoWjaDcjC6ygbQSRjQB02QP3P+A0PmqrAJyqVsrQ
X-Received: by 2002:ac2:518b:: with SMTP id u11mr44956674lfi.498.1638935006319;
        Tue, 07 Dec 2021 19:43:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwifyGeIctLq/WSdi2cAyKfVee7XdSfSCq6roNZPyfverU2yuaLd4tEDEZgqNhNbHIML6RhXCXYaXAxVT6/rSw=
X-Received: by 2002:ac2:518b:: with SMTP id u11mr44956640lfi.498.1638935006028;
 Tue, 07 Dec 2021 19:43:26 -0800 (PST)
MIME-Version: 1.0
References: <20211207114835.GA31153@kili>
In-Reply-To: <20211207114835.GA31153@kili>
From:   Jason Wang <jasowang@redhat.com>
Date:   Wed, 8 Dec 2021 11:43:15 +0800
Message-ID: <CACGkMEsvLwSb_DexsQ8JLGF02AidOY0cMkfxuGK0QjKDkwP3UA@mail.gmail.com>
Subject: Re: [PATCH v3] vduse: vduse: check that offsets are within bounds
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Xie Yongji <xieyongji@bytedance.com>,
        Tiwei Bie <tiwei.bie@intel.com>, Eli Cohen <elic@nvidia.com>,
        Parav Pandit <parav@nvidia.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kvm <kvm@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Dec 7, 2021 at 7:49 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> In vduse_dev_ioctl(), the "config.offset" comes from the user.  There
> needs to a check to prevent it being out of bounds.  The "config.offset"
> and "dev->config_size" variables are both type u32.  So if the offset is
> out of bounds then the "dev->config_size - config.offset" subtraction
> results in a very high u32 value.
>
> The vhost_vdpa_config_validate() function has a similar issue, but there
> the "size" is long type so the subtraction works on 64bit system and
> this change only affects 32bit systems.
>
> Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
> Fixes: 4c8cf31885f6 ("vhost: introduce vDPA-based backend")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Stable candidate.

Patch looks good to me but I think we need to use separate patches to
ease the backporting.

Thanks

> ---
> v2: the first version had a reversed if statement
> v3: fix vhost_vdpa_config_validate() as pointed out by Yongji Xie.
>
>  drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
>  drivers/vhost/vdpa.c               | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index c9204c62f339..1a206f95d73a 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -975,7 +975,8 @@ static long vduse_dev_ioctl(struct file *file, unsigned int cmd,
>                         break;
>
>                 ret = -EINVAL;
> -               if (config.length == 0 ||
> +               if (config.offset > dev->config_size ||
> +                   config.length == 0 ||
>                     config.length > dev->config_size - config.offset)
>                         break;
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

