Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4912DC433EF
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Oct 2021 02:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2998060E75
	for <kernel-janitors@archiver.kernel.org>; Tue, 26 Oct 2021 02:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234189AbhJZCcN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 25 Oct 2021 22:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29415 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234021AbhJZCcM (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 25 Oct 2021 22:32:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635215389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bK/ePsOXvnwATuPJ538FYYy/I3va7wErG+x6S0m8LPc=;
        b=Q36tLKepzd3J0S5Q+d4NHzg4le38tLEMEgU1YPTi9fQ8HlkDJ7u1Xo6ZnBoq3sxQMMD3H2
        Gr59T568yDfb1XdolfVGx2Cl2/aDNxNa8NvOv0MH8AUkpcdi1SNc81Y179bEbZM9ZuEiAq
        +PKH5xsk/QiOzscpEJy/vxRjf6S0//E=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-UK5ECvIrMI2j5DF80MI89w-1; Mon, 25 Oct 2021 22:29:48 -0400
X-MC-Unique: UK5ECvIrMI2j5DF80MI89w-1
Received: by mail-lj1-f197.google.com with SMTP id z21-20020a2e8e95000000b0021191daf2aaso31015ljk.10
        for <kernel-janitors@vger.kernel.org>; Mon, 25 Oct 2021 19:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bK/ePsOXvnwATuPJ538FYYy/I3va7wErG+x6S0m8LPc=;
        b=SAfglP3yKWSBZY6l7Y8cgHkp6KcI1N7fnjkvbomNxDgLwLp6TdiIOiWOn5T94BpGPv
         wszg8tlwGMjbomiujfXAlrhi7Am01rOofN0oK9T3IbvBgCxbVYemZkIxJDXqc84P3JL7
         wGJozLQ2m5wS6lc3g43QmCGXNKCaFe2/u88jaPhb6MNYDRJ1qjfDWcjYJiFgUI7syJX9
         PCfqC93duUF9bd2T/SBjwIfszfGUW2AdCPgm+wkNla5UgE7DE7XTQJscZ9r2LDwnCuYt
         Zp/Z/KO58Ssl2Gygm6mkdxmAl6ZQwKTHbtrMJeOUjGSlA5cmaNMMUimNkEtbMh5MSwrW
         ppNQ==
X-Gm-Message-State: AOAM5332ig+Ru0QBl0NiCzyqP7+sOWMyxcEyYjCjj1nqIUWBTVZxoZby
        R4b5gctfUrht1uOvNJBBlW7RPW0Rvy+tSF1cMmns46FU7ZXyFWy7+9Zq51vMQR5WPkQppuPAOcL
        GZfYgbGxdO3Rz2CJI/fsxjT1qHp1JV8QKDdWsxeue5RZ5
X-Received: by 2002:a2e:8846:: with SMTP id z6mr1572340ljj.277.1635215386598;
        Mon, 25 Oct 2021 19:29:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynH2p5Q/d3q8po75eyLScuoBHurmQzxoMQYZvDuVwpXkiyjRKbg3lG4lyNps31IP9RfRnyLeR+hJ3uxAAQOeI=
X-Received: by 2002:a2e:8846:: with SMTP id z6mr1572308ljj.277.1635215386353;
 Mon, 25 Oct 2021 19:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211025102240.22801-1-colin.i.king@gmail.com>
In-Reply-To: <20211025102240.22801-1-colin.i.king@gmail.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Tue, 26 Oct 2021 10:29:35 +0800
Message-ID: <CACGkMEv2UOaf0phkXYsV=L3fn3BCxXUj-Vx3o1MeYQhvY_B-wg@mail.gmail.com>
Subject: Re: [PATCH][next] virtio_blk: Fix spelling mistake: "advertisted" -> "advertised"
To:     Colin Ian King <colin.i.king@googlemail.com>
Cc:     "Michael S . Tsirkin" <mst@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        virtualization <virtualization@lists.linux-foundation.org>,
        linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 25, 2021 at 6:22 PM Colin Ian King
<colin.i.king@googlemail.com> wrote:
>
> There is a spelling mistake in a dev_err error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index c336d9bb9105..9dd0099d2bd2 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -560,7 +560,7 @@ static int init_vq(struct virtio_blk *vblk)
>         if (err)
>                 num_vqs = 1;
>         if (!err && !num_vqs) {
> -               dev_err(&vdev->dev, "MQ advertisted but zero queues reported\n");
> +               dev_err(&vdev->dev, "MQ advertised but zero queues reported\n");
>                 return -EINVAL;
>         }
>
> --
> 2.32.0
>

