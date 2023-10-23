Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3321CDB474
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 02:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbjJWCzA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 22 Oct 2023 22:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjJWCy7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Oct 2023 22:54:59 -0400
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA13119;
        Sun, 22 Oct 2023 19:54:55 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vud3pcY_1698029691;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0Vud3pcY_1698029691)
          by smtp.aliyun-inc.com;
          Mon, 23 Oct 2023 10:54:52 +0800
Message-ID: <1698029596.5404413-3-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Date:   Mon, 23 Oct 2023 10:53:16 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     Su Hui <suhui@nfschina.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        "Michael S. Tsirkin" <mst@redhat.com>
References: <20231020092320.209234-1-suhui@nfschina.com>
 <20231020053047-mutt-send-email-mst@kernel.org>
 <1697794601.5857713-2-xuanzhuo@linux.alibaba.com>
 <20231020054140-mutt-send-email-mst@kernel.org>
 <1697795422.0986886-1-xuanzhuo@linux.alibaba.com>
 <20231020055943-mutt-send-email-mst@kernel.org>
 <1698028017.8052797-1-xuanzhuo@linux.alibaba.com>
 <d4aa3f76-3e08-a852-a948-b88226a37fdd@nfschina.com>
In-Reply-To: <d4aa3f76-3e08-a852-a948-b88226a37fdd@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, 23 Oct 2023 10:51:59 +0800, Su Hui <suhui@nfschina.com> wrote:
> On 2023/10/23 10:26, Xuan Zhuo wrote:
> >>>> Well, what are the cases where it can happen practically?
> >>> Device error. Such as vp_active_vq()
> >>>
> >>> Thanks.
> >> Hmm interesting. OK. But do callers know to recover?
> >
> > No.
> >
> > So I think WARN + broken is suitable.
> >
> > Thanks.
> Sorry for the late, is the following code okay?
>
> @@ -2739,7 +2739,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
>                       void (*recycle)(struct virtqueue *vq, void *buf))
>   {
>          struct vring_virtqueue *vq = to_vvq(_vq);
> -       int err;
> +       int err, err_reset;
>
>          if (num > vq->vq.num_max)
>                  return -E2BIG;
> @@ -2759,7 +2759,15 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
>          else
>                  err = virtqueue_resize_split(_vq, num);
>
> -       return virtqueue_enable_after_reset(_vq);
> +       err_reset = virtqueue_enable_after_reset(_vq);
> +
> +       if (err) {

No err.

err is not important.
You can remove that.

Thanks.


> +               vq->broken = true;
> +               WARN_ON(err_reset);
> +               return err;
> +       }
> +
> +       return err_reset;
>   }
>
> Thanks.
> Su Hui
>
