Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29B88C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu,  9 Dec 2021 02:12:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhLICPx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Dec 2021 21:15:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24609 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229835AbhLICPw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Dec 2021 21:15:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639015939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9XApc7myklo4XiTNzNFWuXpd9KaEiqqgHRFbQFqoZcI=;
        b=EreTlwpWntRYcDqwV7XSKMOscQ+TKik0jR+FFHes7D+XHT3rhIjZ2pxekJrD7OtINZYi5K
        O0RNBZr/ci10hn0E0hwrUBWkg2fWniMj0Y6qhqz8aShEbhawfpXOts4BRaxg4JHZbZmQK+
        OjG83i8p+mBbp/RV3kZI2BNnusU9pik=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-lWRKpuD7Oo-FFgGRsmiHNw-1; Wed, 08 Dec 2021 21:12:18 -0500
X-MC-Unique: lWRKpuD7Oo-FFgGRsmiHNw-1
Received: by mail-lj1-f200.google.com with SMTP id h18-20020a05651c159200b0021cf7c089d0so1236905ljq.21
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Dec 2021 18:12:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9XApc7myklo4XiTNzNFWuXpd9KaEiqqgHRFbQFqoZcI=;
        b=Sd6ThZVrUuLSvPFtoXPqWKnhvNIKLfhAzwtLLnvS7JF0JUZ3pxjZgYl6yY1ER+mU+F
         7A3h4jxoHl3A2MUumayOwf0NE7lNjiarhVXvCyDaZsJuH4C3EOu02nO9zCZUsdgG3OUP
         LkWTS0Sliwd8l7XzIZIZ05d8DE1p/7mxqr1Bd512YJlH4q8D6dqjqYyI/6bpoOD8Pe5T
         2YYX42ktrR9pRR5VXN86aOGd1kGhvg+ITpZCZzieGSstBSH3cOLfFMTgyjJgJ0WZCdVY
         g0RFFlB6KHMgqYFcoj7uJXv0jDY8r+BO2lHg+o/vYhEAi4qvVxGWtYQN81CUPU0IF/Uv
         mTGA==
X-Gm-Message-State: AOAM532OkWU+40VURDxQYZSoO61qEtGu7JwXSrsZEKFG2Tcr6uuevGaH
        8Ly9Wn9j45ZPWTGNUbHHtt3wIJISMgqwt1jjemQiYFtQEDMx8VH5pAsQ9CMoTj0wi+Lqm+v+g4q
        SyXwI7bRNA5DFLqlrcmPG0vL0HimQb+ElzviXKo6AuNiJ
X-Received: by 2002:a2e:3012:: with SMTP id w18mr3144428ljw.217.1639015937137;
        Wed, 08 Dec 2021 18:12:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXtbHy8Cyg+6tRAm842nb/vJ73lgpw102Pjv5lFmKNXXWGIvKX2qFahpjpjLZYMuOvd2hcvsZAGKOrXszvaCU=
X-Received: by 2002:a2e:3012:: with SMTP id w18mr3144417ljw.217.1639015936967;
 Wed, 08 Dec 2021 18:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20211208103307.GA3778@kili>
In-Reply-To: <20211208103307.GA3778@kili>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 9 Dec 2021 10:12:06 +0800
Message-ID: <CACGkMEusAkdm2io4nBvDSKuoKRt9A4FqKQFZhpk+pBsqOaJ_qQ@mail.gmail.com>
Subject: Re: [PATCH 1/2 v4] vduse: fix memory corruption in vduse_dev_ioctl()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Xie Yongji <xieyongji@bytedance.com>,
        Eli Cohen <elic@nvidia.com>, Parav Pandit <parav@nvidia.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 8, 2021 at 6:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The "config.offset" comes from the user.  There needs to a check to
> prevent it being out of bounds.  The "config.offset" and
> "dev->config_size" variables are both type u32.  So if the offset if
> out of bounds then the "dev->config_size - config.offset" subtraction
> results in a very high u32 value.  The out of bounds offset can result
> in memory corruption.
>
> Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: fix reversed if statement
> v3: fix vhost_vdpa_config_validate() as pointed out by Yongji Xie.
> v4: split the vhost_vdpa_config_validate() change into a separate path

Acked-by: Jason Wang <jasowang@redhat.com>

>
>  drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
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
> --
> 2.20.1
>

