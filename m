Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D52CDB474
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 02:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbjJWCwM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 22 Oct 2023 22:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjJWCwL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 22 Oct 2023 22:52:11 -0400
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 68A01119;
        Sun, 22 Oct 2023 19:52:02 -0700 (PDT)
Received: from [172.30.11.106] (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id B6310604889C4;
        Mon, 23 Oct 2023 10:51:59 +0800 (CST)
Message-ID: <d4aa3f76-3e08-a852-a948-b88226a37fdd@nfschina.com>
Date:   Mon, 23 Oct 2023 10:51:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        "Michael S. Tsirkin" <mst@redhat.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
In-Reply-To: <1698028017.8052797-1-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2023/10/23 10:26, Xuan Zhuo wrote:
>>>> Well, what are the cases where it can happen practically?
>>> Device error. Such as vp_active_vq()
>>>
>>> Thanks.
>> Hmm interesting. OK. But do callers know to recover?
>
> No.
>
> So I think WARN + broken is suitable.
>
> Thanks.
Sorry for the late, is the following code okay?

@@ -2739,7 +2739,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
                      void (*recycle)(struct virtqueue *vq, void *buf))
  {
         struct vring_virtqueue *vq = to_vvq(_vq);
-       int err;
+       int err, err_reset;
  
         if (num > vq->vq.num_max)
                 return -E2BIG;
@@ -2759,7 +2759,15 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
         else
                 err = virtqueue_resize_split(_vq, num);

-       return virtqueue_enable_after_reset(_vq);
+       err_reset = virtqueue_enable_after_reset(_vq);
+
+       if (err) {
+               vq->broken = true;
+               WARN_ON(err_reset);
+               return err;
+       }
+
+       return err_reset;
  }

Thanks.
Su Hui

