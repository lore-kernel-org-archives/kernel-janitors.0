Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15709C004C0
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 11:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbjJWLTf (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 07:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233766AbjJWLTd (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 07:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AB18102
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698059927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jnC1GGwxL9Zbpu28wAk0w4sz4UIRk93Qqt6FyBIuiIY=;
        b=OsjJLnhxtfNjxWFuC4XYDgCUrHf/ImAbRRK/QL3tppXdntq5mdVfUM4/YjfnGm8dunV1se
        ualDDRBIfocyC0meOVROirs1rW1MVX6QifYKj8j7oyPtHYeO8g7TSZCjCIr6EBFSmESx7g
        Enz/mEtztGVcG/ytRM/TPMkB2CHcQ4Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-r8ZVKkoWMYW6hcZ5gZnqvA-1; Mon, 23 Oct 2023 07:18:45 -0400
X-MC-Unique: r8ZVKkoWMYW6hcZ5gZnqvA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f41a04a297so20281765e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 04:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059925; x=1698664725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnC1GGwxL9Zbpu28wAk0w4sz4UIRk93Qqt6FyBIuiIY=;
        b=v/tmeKxtMEVFWTd+agWjWaaj9K6sek7RFzULZ6dEFHp0/Drr1w6oLhQvlC2Y16yXwy
         65GVBFp1sPHSKNbKMUD+lOXOuHehxmRRZ0ey6WqD3GaFVWYdej27yAHASKGG56IFCECE
         GCMa1naf60CSzcpmyAYv4zBK1oEtXcU9Q5N4qkAbDoNdALWYmRAeVIeSCal/8hOaT3GO
         6CHDLGVDk29PJIOr7xSO/suHwemGOR0aWffDTewVicBAe3ye1tSbQaMYBaZnS82pul8U
         JlfQ6iM6b+K3Z/IKIna91Pbijs8+NtWQBoWauoz6bNFSs2FzCHEMekgzFR0QzWJJXQQD
         v3gA==
X-Gm-Message-State: AOJu0YyaxW9FNhO/MsGRflca2oImvglsQwSgVIaBleLnEAN+W+LVIA8I
        KE0zEe8A48/orW+Q2d/SAyJ050Q82uIwLUW8yCGsLOZK7NFcnqXXO1RcHJ9zyW7N5gn51mt0IIh
        2U4z8lNAFLF+u8FuWbaGXkiHS52YZ
X-Received: by 2002:a05:600c:3b17:b0:405:39c1:a98b with SMTP id m23-20020a05600c3b1700b0040539c1a98bmr6781856wms.20.1698059924732;
        Mon, 23 Oct 2023 04:18:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlNOSbGZV0psNxYVAdk0xozr8uaYafLwOEKQtbvzrUCUXDsWv/S3FBPkSASbIRrVthMSMMVg==
X-Received: by 2002:a05:600c:3b17:b0:405:39c1:a98b with SMTP id m23-20020a05600c3b1700b0040539c1a98bmr6781844wms.20.1698059924402;
        Mon, 23 Oct 2023 04:18:44 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f2:e88f:2c2c:db43:583d:d30e])
        by smtp.gmail.com with ESMTPSA id c39-20020a05600c4a2700b0040588d85b3asm13601617wmp.15.2023.10.23.04.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 04:18:43 -0700 (PDT)
Date:   Mon, 23 Oct 2023 07:18:38 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Message-ID: <20231023071752-mutt-send-email-mst@kernel.org>
References: <1697795422.0986886-1-xuanzhuo@linux.alibaba.com>
 <20231020055943-mutt-send-email-mst@kernel.org>
 <1698028017.8052797-1-xuanzhuo@linux.alibaba.com>
 <d4aa3f76-3e08-a852-a948-b88226a37fdd@nfschina.com>
 <1698029596.5404413-3-xuanzhuo@linux.alibaba.com>
 <46aee820-6c01-ed8a-613b-5c57258d749e@nfschina.com>
 <1698040004.5365264-4-xuanzhuo@linux.alibaba.com>
 <6a7d1006-0988-77ea-0991-9c7b422d78e1@nfschina.com>
 <1698054722.2894735-1-xuanzhuo@linux.alibaba.com>
 <1698058354.8316164-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1698058354.8316164-2-xuanzhuo@linux.alibaba.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2023 at 06:52:34PM +0800, Xuan Zhuo wrote:
> On Mon, 23 Oct 2023 17:52:02 +0800, Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > On Mon, 23 Oct 2023 17:50:46 +0800, Su Hui <suhui@nfschina.com> wrote:
> > > On 2023/10/23 13:46, Xuan Zhuo wrote:
> > > >>>>>>>> Well, what are the cases where it can happen practically?
> > > >>>>>>> Device error. Such as vp_active_vq()
> > > >>>>>>>
> > > >>>>>>> Thanks.
> > > >>>>>> Hmm interesting. OK. But do callers know to recover?
> > > >>>>> No.
> > > >>>>>
> > > >>>>> So I think WARN + broken is suitable.
> > > >>>>>
> > > >>>>> Thanks.
> > > >>>> Sorry for the late, is the following code okay?
> > > >>>>
> > > >>>> @@ -2739,7 +2739,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > > >>>>                         void (*recycle)(struct virtqueue *vq, void *buf))
> > > >>>>     {
> > > >>>>            struct vring_virtqueue *vq = to_vvq(_vq);
> > > >>>> -       int err;
> > > >>>> +       int err, err_reset;
> > > >>>>
> > > >>>>            if (num > vq->vq.num_max)
> > > >>>>                    return -E2BIG;
> > > >>>> @@ -2759,7 +2759,15 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > > >>>>            else
> > > >>>>                    err = virtqueue_resize_split(_vq, num);
> > > >>>>
> > > >>>> -       return virtqueue_enable_after_reset(_vq);
> > > >>>> +       err_reset = virtqueue_enable_after_reset(_vq);
> > > >>>> +
> > > >>>> +       if (err) {
> > > >>> No err.
> > > >>>
> > > >>> err is not important.
> > > >>> You can remove that.
> > > >> Emm, I'm a little confused that which code should I remove ?
> > > >>
> > > >>
> > > >> like this:
> > > >> 	if (vq->packed_ring)
> > > >> 		virtqueue_resize_packed(_vq, num);
> > > >> 	else
> > > >> 		virtqueue_resize_split(_vq, num);
> > > >>
> > > >> And we should set broken and warn inside virtqueue_enable_after_reset()?
> > >
> > > In my opinion, we should return the error code of virtqueue_resize_packed() / virtqueue_resize_split().
> > > But if this err is not important, this patch makes no sense.
> > > Maybe I misunderstand somewhere...
> > > If you think it's worth sending a patch, you can send it :).(I'm not familiar with this code).
> >
> > OK.
> 
> Hi Michael,
> 
> The queue reset code is wrote with the CONFIG_VIRTIO_HARDEN_NOTIFICATION.
> 
> When we disable the vq, the broken is true until we re-enable it.
> 
> So when we re-enable it fail, the vq is broken status.
> 
> Normally, this just happens on the buggy device.
> So I think that is enough.
> 
> Thanks.

I don't know what to do about CONFIG_VIRTIO_HARDEN_NOTIFICATION.
It's known to be broken and it does not look like there's
active effort to revive it - should we just drop it for now?


> 
> 	static int vp_modern_disable_vq_and_reset(struct virtqueue *vq)
> 	{
> 		[...]
> 
> 		vp_modern_set_queue_reset(mdev, vq->index);
> 
> 		[...]
> 
> 	#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> ->>		__virtqueue_break(vq);
> 	#endif
> 
> 		[...]
> 	}
> 
> 	static int vp_modern_enable_vq_after_reset(struct virtqueue *vq)
> 	{
> 		[...]
> 
> 		if (vp_modern_get_queue_reset(mdev, index))
> 			return -EBUSY;
> 
> 		if (vp_modern_get_queue_enable(mdev, index))
> 			return -EBUSY;
> 
> 		err = vp_active_vq(vq, info->msix_vector);
> 		if (err)
> 			return err;
> 
> 		}
> 
> 		[...]
> 
> 	#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> ->>		__virtqueue_unbreak(vq);
> 	#endif
> 
> 		[...]
> 	}
> 
> 
> 
> 
> >
> > Thanks.
> >
> >
> > >
> > > Thanks,
> > > Su Hui
> > >

