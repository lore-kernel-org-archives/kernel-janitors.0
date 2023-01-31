Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E27C38142
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Jan 2023 05:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjAaFYT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 31 Jan 2023 00:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjAaFYJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 31 Jan 2023 00:24:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D1B0E38C
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jan 2023 21:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675142599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tBuwpBVXvpFhXGcDe/LdMP61Sfzf57MnN//0wiFS4tA=;
        b=bknq3fgdbkDTwq1TVPDd65JuilgHInI9BT8Pf20onM44IZ9HT017XHk8C1K7RYCWhGReus
        vrWliDnMLT5LxlSrufweKT97nMIjbZiGu9JHMg11jE3QBjuNEh2396hVOhpXlRPyYEl/Gt
        p3j5LSc/LK3m41BDjLIa8Zpt5f22/gc=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-78-gdGBb-9EOk2GMENT0ew6ag-1; Tue, 31 Jan 2023 00:23:17 -0500
X-MC-Unique: gdGBb-9EOk2GMENT0ew6ag-1
Received: by mail-oo1-f72.google.com with SMTP id r5-20020a4ad4c5000000b0051754772eeaso904985oos.20
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Jan 2023 21:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBuwpBVXvpFhXGcDe/LdMP61Sfzf57MnN//0wiFS4tA=;
        b=zu90gAHabF2I9AwaJ2u5Q2TK5aZC8cRcuCFUDj54B3rzVUZipVKCmLwRgSON3d9Tgm
         1EUEuxFMTausQ/f7suM6jWICTCMC3phAg62QU3zHtdB+R4lTicfTe1sb2LdGXuSIz03A
         98n6xKnK6yC/3vJ/Ck3RFsxlNnofJN+gidWzH9+w238TNKhnUccLLfs4H2I/g5OYHL+u
         dyJkCfBorHNWpl8OymBQB9dYZ/5v1l6o+sqgLLlU+VNtwlho/4vix2e7SwAYZijB4ujk
         mxcJmiK9SDsveShwUNDGPdtCnJ9ovE3NhEu1wiQF7TRTZ2byjQ9h74z/yp+9fFa+8H3v
         OHhg==
X-Gm-Message-State: AFqh2kqmC6TO6jWPoWgY+XCCJ7RbHEzlrDTYikcONF6NCYRcvlY0SOQv
        nirpBoOTktsdbkF367+ukCa7OvfRIhR/NIzblrIkY8k+3H5L11eJYGrUSBfl5/G/59n+S8b+9Q3
        cUbkODTIGON4Ch0H8STJkS5+HRFE4sNr2bThmHTdQ7a3S
X-Received: by 2002:a05:6871:10e:b0:15b:96b5:9916 with SMTP id y14-20020a056871010e00b0015b96b59916mr4391884oab.280.1675142596876;
        Mon, 30 Jan 2023 21:23:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtz7jMxZSFLd+CNnOJpiqDKGvOYMcNJ6sBtUoRkm8qhoapPK42eBepYF1fhvcrqoTDubwtnrXBwROgRvtImXgM=
X-Received: by 2002:a05:6871:10e:b0:15b:96b5:9916 with SMTP id
 y14-20020a056871010e00b0015b96b59916mr4391882oab.280.1675142596696; Mon, 30
 Jan 2023 21:23:16 -0800 (PST)
MIME-Version: 1.0
References: <20230130092644.37002-1-colin.i.king@gmail.com>
In-Reply-To: <20230130092644.37002-1-colin.i.king@gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 31 Jan 2023 13:23:05 +0800
Message-ID: <CACGkMEu9eg3aem4a_Xu_uxn4HvifyQqe-JRfH0rdxXDmsMfDuw@mail.gmail.com>
Subject: Re: [PATCH][next] vdpa: Fix a couple of spelling mistakes in some messages
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     "Michael S . Tsirkin" <mst@redhat.com>,
        Stefano Garzarella <sgarzare@redhat.com>,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Jan 30, 2023 at 5:26 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There are two spelling mistakes in some literal strings. Fix them.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  drivers/vdpa/vdpa.c                  | 2 +-
>  drivers/vdpa/vdpa_sim/vdpa_sim_net.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> index 6821b2850bbb..a1bb5b92212d 100644
> --- a/drivers/vdpa/vdpa.c
> +++ b/drivers/vdpa/vdpa.c
> @@ -1016,7 +1016,7 @@ static int vdpa_dev_vendor_stats_fill(struct vdpa_device *vdev,
>         switch (device_id) {
>         case VIRTIO_ID_NET:
>                 if (index > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX) {
> -                       NL_SET_ERR_MSG_MOD(info->extack, "queue index excceeds max value");
> +                       NL_SET_ERR_MSG_MOD(info->extack, "queue index exceeds max value");
>                         err = -ERANGE;
>                         break;
>                 }
> diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> index e827708adcca..862f405362de 100644
> --- a/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> +++ b/drivers/vdpa/vdpa_sim/vdpa_sim_net.c
> @@ -324,7 +324,7 @@ static int vdpasim_net_get_stats(struct vdpasim *vdpasim, u16 idx,
>                                       rx_errors, VDPA_ATTR_PAD))
>                         break;
>                 if (nla_put_string(msg, VDPA_ATTR_DEV_VENDOR_ATTR_NAME,
> -                                 "rx overrunss"))
> +                                 "rx overruns"))
>                         break;
>                 if (nla_put_u64_64bit(msg, VDPA_ATTR_DEV_VENDOR_ATTR_VALUE,
>                                       rx_overruns, VDPA_ATTR_PAD))
> --
> 2.30.2
>

