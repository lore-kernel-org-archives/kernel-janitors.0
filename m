Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42554CDB474
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 09:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376717AbjJTJf3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 05:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376690AbjJTJf0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 05:35:26 -0400
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9440AD5E;
        Fri, 20 Oct 2023 02:35:21 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VuWtWLk_1697794515;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0VuWtWLk_1697794515)
          by smtp.aliyun-inc.com;
          Fri, 20 Oct 2023 17:35:16 +0800
Message-ID: <1697794128.4297402-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Date:   Fri, 20 Oct 2023 17:28:48 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     Su Hui <suhui@nfschina.com>
Cc:     Su Hui <suhui@nfschina.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        mst@redhat.com, jasowang@redhat.com
References: <20231020092320.209234-1-suhui@nfschina.com>
In-Reply-To: <20231020092320.209234-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

If any error happens, this function should restore to the old status.

So, whether the err is true, we should goto the virtqueue_enable_after_reset().

If the err is true, that mean the resize new quuee failed, but the queue
status has restored to the old status.

We should ignore the return value of the virtuqueue_resize_xxx().

Do you find other error in the virtuqueue_resize_xxx().

Thanks.


On Fri, 20 Oct 2023 17:23:21 +0800, Su Hui <suhui@nfschina.com> wrote:
> virtqueue_resize_packed() or virtqueue_resize_split() can return
> error code if failed, so add a check for this.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>
> I'm not sure that return directly is right or not,
> maybe there are some process should do before return.
>
>  drivers/virtio/virtio_ring.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 51d8f3299c10..cf662c3a755b 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2759,6 +2759,9 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
>  	else
>  		err = virtqueue_resize_split(_vq, num);
>
> +	if (err)
> +		return err;
> +
>  	return virtqueue_enable_after_reset(_vq);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_resize);
> --
> 2.30.2
>
