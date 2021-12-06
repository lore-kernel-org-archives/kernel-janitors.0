Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AA0C433F5
	for <kernel-janitors@archiver.kernel.org>; Mon,  6 Dec 2021 08:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238770AbhLFIEk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:04:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30274 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238716AbhLFIEk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 6 Dec 2021 03:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638777671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wH8kwnz+ewHmU1AaRG71G1mumKaBP21RSNN+TDzU+jU=;
        b=VvYVhrtMoNkV1cJiAZeizN29L8Uk+z0Yrfjy5ze85fgGcKlcYV0pv00XjvdNyOaejHV8b/
        vf9XFhVbL6aSY9pm4juUN6VDn5T1U+UVUJw2Xh2SaxjeyW30bUlkA2IAzEhmSAi8ob8Mbt
        ktwzGERYbar31xWmF7gtLP5nlDb5Mdc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-x_HQ8QTiN8O3WlE8R93pEw-1; Mon, 06 Dec 2021 03:01:10 -0500
X-MC-Unique: x_HQ8QTiN8O3WlE8R93pEw-1
Received: by mail-lf1-f69.google.com with SMTP id s11-20020a195e0b000000b0041c0a47fb77so791231lfb.20
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Dec 2021 00:01:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wH8kwnz+ewHmU1AaRG71G1mumKaBP21RSNN+TDzU+jU=;
        b=NZFrewHS8GEyaq5XYSSOlogBZOFDrHi+rOmP1fAyHSNfspi6dxn6HMHxqvgkN3tPvu
         tDbZIdpD8Eblj3qH+j0kXN4+jJIkOTZIhch6KgFuBXpnLwvZ3voPKahjYgIznUFV1mMi
         5PFFeyphuk1D7Yzkx6HkGjGvAXUkSj5fChlcA7qKHOtwcDJ3ZqoWVmEG3cqyRD+mhFhl
         T88wCuVhKLr2KMD7+KQsCM/uiHJ7cgG1So2xoskPy/lGxbWzk6ncvFU2jDTg8ETOjP/i
         nfSbgmrFIR1eatSWptWsBwct85lQIU+uf1gu1LwDGXWZmKU4oN6CWoHC6c1BVHZONb0o
         6RXg==
X-Gm-Message-State: AOAM530/NYK8k3X6YO4nxodS0+VlOwf2kO8jVG0gpDzo3AzyMu7esi/M
        8auSC55FhtchBhVuF/cDv+ogBXPNbd0Nllg2dz/2TpfG0ow3jQP2IIBfqUWdxtk+Kzi2fvGa2Ir
        wKY28rP6vBhMVPo9Rf4DO/GTAKFHvPyFWepu9OHyRu7/i
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr34211647ljp.362.1638777668624;
        Mon, 06 Dec 2021 00:01:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYfODCzAWEqMnMLn2tkI2pq1dE/G0Dew/Pmcpji5W/rXtHJLqZjo3c5XqwSdykVkg+nYS0G8Z980ScmvpQAlI=
X-Received: by 2002:a2e:b88d:: with SMTP id r13mr34211635ljp.362.1638777668440;
 Mon, 06 Dec 2021 00:01:08 -0800 (PST)
MIME-Version: 1.0
References: <1638776941-34156-1-git-send-email-guanjun@linux.alibaba.com>
In-Reply-To: <1638776941-34156-1-git-send-email-guanjun@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Mon, 6 Dec 2021 16:00:57 +0800
Message-ID: <CACGkMEtNj_CyqV01MCKn6xa01d4FHscCZ9dgt3JCqrQYWaHpMA@mail.gmail.com>
Subject: Re: [PATCH 1/1] vduse: moving kvfree into caller
To:     Guanjun <guanjun@linux.alibaba.com>
Cc:     mst <mst@redhat.com>, Yongji Xie <xieyongji@bytedance.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Dec 6, 2021 at 3:54 PM Guanjun <guanjun@linux.alibaba.com> wrote:
>
> From: Guanjun <guanjun@linux.alibaba.com>
>
> This free action should be moved into caller 'vduse_ioctl' in
> concert with the allocation.
>
> No functional change.
>
> Fixes: c8a6153b6c59 ("vduse: Introduce VDUSE - vDPA Device in Userspace")

Does this fix a real problem? If not, let's try not using fixes tags here.

Thanks

> Signed-off-by: Guanjun <guanjun@linux.alibaba.com>
> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index c9204c62f339..477a5a592002 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -1355,7 +1355,6 @@ static int vduse_create_dev(struct vduse_dev_config *config,
>  err_str:
>         vduse_dev_destroy(dev);
>  err:
> -       kvfree(config_buf);
>         return ret;
>  }
>
> @@ -1406,6 +1405,8 @@ static long vduse_ioctl(struct file *file, unsigned int cmd,
>                 }
>                 config.name[VDUSE_NAME_MAX - 1] = '\0';
>                 ret = vduse_create_dev(&config, buf, control->api_version);
> +               if (ret)
> +                       kvfree(buf);
>                 break;
>         }
>         case VDUSE_DESTROY_DEV: {
> --
> 2.27.0
>

