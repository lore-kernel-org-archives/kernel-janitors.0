Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319B9C678D5
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Mar 2023 14:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232191AbjCHOJX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Mar 2023 09:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231694AbjCHOIu (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Mar 2023 09:08:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D753D09F
        for <kernel-janitors@vger.kernel.org>; Wed,  8 Mar 2023 06:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678284438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V6cnINXPKnD2lG8vxbE8F7RlXvTWARojvYuwDfsphHk=;
        b=BEL3HnhhGNsNJip34h5tzYaq5nF1GZpWLvydqL0H0xIZhnawZWVk/boTfrU7UdAte7wdsq
        j2Pf1xfdGS/J55/erI6ZWHeTPyhVwMMw5ow9ydoBa0dmOYiS33Qj/OT+iNUiwFNVqEDRrq
        iphRIoSI5/o8nuJa7yvb6x3knSUQR8M=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-iwWCBKOUOhu-wfCZhSkuXA-1; Wed, 08 Mar 2023 09:07:16 -0500
X-MC-Unique: iwWCBKOUOhu-wfCZhSkuXA-1
Received: by mail-qk1-f198.google.com with SMTP id s21-20020a05620a0bd500b0074234f33f24so9335510qki.3
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Mar 2023 06:07:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678284429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6cnINXPKnD2lG8vxbE8F7RlXvTWARojvYuwDfsphHk=;
        b=Ip5VTkWBv2hwlUCWO5nuSOpnYsmGSbCrX0cI9KRbsxzUjRGpDVkwF2bGwXrFuFkhxl
         ZkJqPD5N6I3d0fV+HYpkyUjUVzvs2d8xU14oYz4qzuAssvcwDmmN1DU9EVA98aTDuDDf
         BKI3tyv3PkJWOQa2JbtqEV13ooDtuBrdisAHKykbsjwIMQXCWk/iLksRfuv0r3DhqBrD
         /xBdnqMLd+gHkTtK1RcbRUAHiBduYX+uQOyPD0QhmAZSAutZYZsnlGXz7svRSpCkQ+s+
         mX1bKQm0V9eewLxIIk44BQS2NexJNOamGtCeQzRwm9JpNWqcqjZXH/hBkULc1IEGLquk
         y1WQ==
X-Gm-Message-State: AO0yUKXVF4XetFSKr8XDQMbcLi/2Fwm3rYWFr7Tyvs4lT9ZLgKzmf5M8
        NjzEVuyZ6IOqxPLKy3Y0xo1BhEc4NbC/JDK0ajQMbtTemqV+s+NubP1951b8tpCzP/gwS7mHjsP
        v/s7DJv9Tz4XDgFqxiqL7lKtUXFWvcjhVWa0G
X-Received: by 2002:a05:622a:514:b0:3b9:bc8c:c213 with SMTP id l20-20020a05622a051400b003b9bc8cc213mr38252431qtx.30.1678284429137;
        Wed, 08 Mar 2023 06:07:09 -0800 (PST)
X-Google-Smtp-Source: AK7set+bnIm7lfXZMPMGp+YTM6UrwsXhtqFanRzxTP/WHmpltxuwqtKd97gRjNlbA6Fwv+mkWztPJw==
X-Received: by 2002:a05:622a:514:b0:3b9:bc8c:c213 with SMTP id l20-20020a05622a051400b003b9bc8cc213mr38252394qtx.30.1678284428852;
        Wed, 08 Mar 2023 06:07:08 -0800 (PST)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it. [82.57.51.170])
        by smtp.gmail.com with ESMTPSA id x185-20020a3763c2000000b0073baa5ec0besm11506824qkb.115.2023.03.08.06.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 06:07:08 -0800 (PST)
Date:   Wed, 8 Mar 2023 15:07:04 +0100
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] virtio: Reorder fields in 'struct virtqueue'
Message-ID: <20230308140704.jsggcp4g3tz7vhxu@sgarzare-redhat>
References: <8f3d2e49270a2158717e15008e7ed7228196ba02.1676707807.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <8f3d2e49270a2158717e15008e7ed7228196ba02.1676707807.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Feb 18, 2023 at 09:10:31AM +0100, Christophe JAILLET wrote:
>Group some variables based on their sizes to reduce hole and avoid padding.
>On x86_64, this shrinks the size of 'struct virtqueue'
>from 72 to 68 bytes.
>
>It saves a few bytes of memory.
>
>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>---

LGTM!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>Using pahole
>
>Before:
>======
>struct virtqueue {
>	struct list_head           list;                 /*     0    16 */
>	void                       (*callback)(struct virtqueue *); /*    16     8 */
>	const char  *              name;                 /*    24     8 */
>	struct virtio_device *     vdev;                 /*    32     8 */
>	unsigned int               index;                /*    40     4 */
>	unsigned int               num_free;             /*    44     4 */
>	unsigned int               num_max;              /*    48     4 */
>
>	/* XXX 4 bytes hole, try to pack */
>
>	void *                     priv;                 /*    56     8 */
>	/* --- cacheline 1 boundary (64 bytes) --- */
>	bool                       reset;                /*    64     1 */
>
>	/* size: 72, cachelines: 2, members: 9 */
>	/* sum members: 61, holes: 1, sum holes: 4 */
>	/* padding: 7 */
>	/* last cacheline: 8 bytes */
>};
>
>After:
>=====
>struct virtqueue {
>	struct list_head           list;                 /*     0    16 */
>	void                       (*callback)(struct virtqueue *); /*    16     8 */
>	const char  *              name;                 /*    24     8 */
>	struct virtio_device *     vdev;                 /*    32     8 */
>	unsigned int               index;                /*    40     4 */
>	unsigned int               num_free;             /*    44     4 */
>	unsigned int               num_max;              /*    48     4 */
>	bool                       reset;                /*    52     1 */
>
>	/* XXX 3 bytes hole, try to pack */
>
>	void *                     priv;                 /*    56     8 */
>
>	/* size: 64, cachelines: 1, members: 9 */
>	/* sum members: 61, holes: 1, sum holes: 3 */
>};
>---
> include/linux/virtio.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/include/linux/virtio.h b/include/linux/virtio.h
>index 6ac2655500dc..9439ae898310 100644
>--- a/include/linux/virtio.h
>+++ b/include/linux/virtio.h
>@@ -35,8 +35,8 @@ struct virtqueue {
> 	unsigned int index;
> 	unsigned int num_free;
> 	unsigned int num_max;
>-	void *priv;
> 	bool reset;
>+	void *priv;
> };
>
> int virtqueue_add_outbuf(struct virtqueue *vq,
>-- 
>2.34.1
>

