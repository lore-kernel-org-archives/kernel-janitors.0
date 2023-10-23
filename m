Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C7CC001E0
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Oct 2023 11:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233758AbjJWLSk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Oct 2023 07:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233738AbjJWLSi (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Oct 2023 07:18:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B01DC
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698059867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FRvwFPWkQbIxAzQKKTcIQ5FvgRLAZ9CwY2jeSsJtJyI=;
        b=FIVTcmcrZSvc1YMm2YTGE+utPp9c34+F2NRD+CWr605JyJ2jKE2sJCU3880SS3ndbvS6t3
        pfBE5IA69+QI+uSjuGZv8R2+Y8NZbl3/n7x3qE/3vZDDF2vP/uevhc+qOw0+xNvNFN61eW
        9X4fisaDUJi4GglCRJb1rz0enko5rCo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-3hKuoNdHPrCOIxE1sH18rg-1; Mon, 23 Oct 2023 07:17:40 -0400
X-MC-Unique: 3hKuoNdHPrCOIxE1sH18rg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32da47641b5so1386153f8f.0
        for <kernel-janitors@vger.kernel.org>; Mon, 23 Oct 2023 04:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698059859; x=1698664659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRvwFPWkQbIxAzQKKTcIQ5FvgRLAZ9CwY2jeSsJtJyI=;
        b=JvMuWthI8zxgt+MntoiSJC7gCq33+61zLtpnfKQZv9Mr5zWCa5RyiO3BV9fpPoYmPq
         qbZ+32+ljPX3381favDzby6BTqltqqKFcUrvmmeAi3TZfhQGKS1ys6VuFWXLFOXwJlj9
         T7PqUTswysySui4TW2HqXMAa6Of11P/tKER9kW/QkclXkCHD68lgeARoTwMkgXdsWVq5
         oJJIWW7nY+aMHwxZm6p8zuZ9W6CIw322k4OJNfS7130/kaaWmxSBz6J9EpxCmH0WGc+9
         8980bx+l8lVRB2wGri7WqFHAYa4floka/pBwxvJyluYj+J3hbraBv0Q1FJHRefSQ8dxp
         yzLA==
X-Gm-Message-State: AOJu0YwTCxtAu/tdXAvQmrEpR4bFewpQgEnjUt/QftwYbf+KiwvRIHXn
        g1GuDFiLHYy8lKXJAes3XMDug2s7XxwTRJ5nHACsw+1xCoWupNVJ9eqFVTUxIGoGyqjDDFWvgKi
        T/ggW7ITMqyLyGzUQwRd7VpsYY04/
X-Received: by 2002:adf:e5c8:0:b0:32d:6891:f819 with SMTP id a8-20020adfe5c8000000b0032d6891f819mr6249182wrn.41.1698059859683;
        Mon, 23 Oct 2023 04:17:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3YM+O+5Ir2R/imQr9O2Lyuez5zl/LJuvoKLWz1oCP1WKa/8vgH0KWzIiS0y5qulyw5jOYDA==
X-Received: by 2002:adf:e5c8:0:b0:32d:6891:f819 with SMTP id a8-20020adfe5c8000000b0032d6891f819mr6249168wrn.41.1698059859310;
        Mon, 23 Oct 2023 04:17:39 -0700 (PDT)
Received: from redhat.com ([2a02:14f:1f2:e88f:2c2c:db43:583d:d30e])
        by smtp.gmail.com with ESMTPSA id c17-20020a5d4151000000b0032d87b13240sm7629863wrq.73.2023.10.23.04.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 04:17:38 -0700 (PDT)
Date:   Mon, 23 Oct 2023 07:17:30 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     Su Hui <suhui@nfschina.com>, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Message-ID: <20231023071548-mutt-send-email-mst@kernel.org>
References: <20231020054140-mutt-send-email-mst@kernel.org>
 <1697795422.0986886-1-xuanzhuo@linux.alibaba.com>
 <20231020055943-mutt-send-email-mst@kernel.org>
 <1698028017.8052797-1-xuanzhuo@linux.alibaba.com>
 <d4aa3f76-3e08-a852-a948-b88226a37fdd@nfschina.com>
 <1698029596.5404413-3-xuanzhuo@linux.alibaba.com>
 <46aee820-6c01-ed8a-613b-5c57258d749e@nfschina.com>
 <1698040004.5365264-4-xuanzhuo@linux.alibaba.com>
 <6a7d1006-0988-77ea-0991-9c7b422d78e1@nfschina.com>
 <1698054722.2894735-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1698054722.2894735-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 23, 2023 at 05:52:02PM +0800, Xuan Zhuo wrote:
> On Mon, 23 Oct 2023 17:50:46 +0800, Su Hui <suhui@nfschina.com> wrote:
> > On 2023/10/23 13:46, Xuan Zhuo wrote:
> > >>>>>>>> Well, what are the cases where it can happen practically?
> > >>>>>>> Device error. Such as vp_active_vq()
> > >>>>>>>
> > >>>>>>> Thanks.
> > >>>>>> Hmm interesting. OK. But do callers know to recover?
> > >>>>> No.
> > >>>>>
> > >>>>> So I think WARN + broken is suitable.
> > >>>>>
> > >>>>> Thanks.
> > >>>> Sorry for the late, is the following code okay?
> > >>>>
> > >>>> @@ -2739,7 +2739,7 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > >>>>                         void (*recycle)(struct virtqueue *vq, void *buf))
> > >>>>     {
> > >>>>            struct vring_virtqueue *vq = to_vvq(_vq);
> > >>>> -       int err;
> > >>>> +       int err, err_reset;
> > >>>>
> > >>>>            if (num > vq->vq.num_max)
> > >>>>                    return -E2BIG;
> > >>>> @@ -2759,7 +2759,15 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > >>>>            else
> > >>>>                    err = virtqueue_resize_split(_vq, num);
> > >>>>
> > >>>> -       return virtqueue_enable_after_reset(_vq);
> > >>>> +       err_reset = virtqueue_enable_after_reset(_vq);
> > >>>> +
> > >>>> +       if (err) {
> > >>> No err.
> > >>>
> > >>> err is not important.
> > >>> You can remove that.
> > >> Emm, I'm a little confused that which code should I remove ?
> > >>
> > >>
> > >> like this:
> > >> 	if (vq->packed_ring)
> > >> 		virtqueue_resize_packed(_vq, num);
> > >> 	else
> > >> 		virtqueue_resize_split(_vq, num);
> > >>
> > >> And we should set broken and warn inside virtqueue_enable_after_reset()?
> >
> > In my opinion, we should return the error code of virtqueue_resize_packed() / virtqueue_resize_split().
> > But if this err is not important, this patch makes no sense.
> > Maybe I misunderstand somewhere...
> > If you think it's worth sending a patch, you can send it :).(I'm not familiar with this code).
> 
> OK.
> 
> Thanks.

I would first try to recover by re-enabling.
If that fails we can set broken.


> 
> >
> > Thanks,
> > Su Hui
> >

