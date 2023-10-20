Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75580CDB47E
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 09:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376751AbjJTJnR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 05:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376734AbjJTJnQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 05:43:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92518C0
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697794945;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=B8zhNyoPjCzPI6JP3Ig1aNei31DQ1+NDAezu4yisodc=;
        b=F4bJzlM0hgWYlZxaf2WSARFma4Zz/kXadXEp1bdBPxgyad2XN4uzldCd9+RKNh2Fnz7lub
        3B+IkdZLXVgppkPJJ92eyG4hZomiaZtUmOZMsjTSHnMLfUNkUiqA9C61Ag7c5i+FXbCRkK
        xOSxoNwJ8Ilb8BryRK4hrOzdPP/6H7o=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-iPViYSdjMZ6-xCO_4vScsw-1; Fri, 20 Oct 2023 05:42:18 -0400
X-MC-Unique: iPViYSdjMZ6-xCO_4vScsw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-407f9d07b41so3934485e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 02:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794937; x=1698399737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8zhNyoPjCzPI6JP3Ig1aNei31DQ1+NDAezu4yisodc=;
        b=YTYeZ0FN4s1RbZ/sJLQj0gfq8Ot0fHfcneBP5+N79IG2ZCZZJjETlp4H9fXwVKT8Hj
         BYmjIN0oY+TqyBjpwsxUWA0MysmnoaVibuFu8/87VCb4DJU6tEGsYaNN+PBwvDxXmpDl
         0wqqVT5HzCmh5/dZ3WK4+QVzZ9FYlu9/O4Cz4WBrKLMEINXQ9+X0nmNEiXXrUoFiQh9K
         Z08HJWAB0ABA71HV0wV7wLWYqvsRAzJH4C4XZgUxI6/NZjqa4Tr01mi1ksbFGzfjg+LK
         7dN8iTVyRzkZLsy37Tt64Gw/3YZSCD/cLagkM5Xo47kyI3DkQeq/TpJA90e5mv3J15VS
         VB/A==
X-Gm-Message-State: AOJu0YzjKhrBTpQThbz0jNV1hoE9H7EQwBhvrQzdlMy+nOF8iHOiM3BS
        V5LivVuqammpYadRpR+0mcL6Fxo//CAFRddiMhZ6/nZ6DbEFObwWokrV44/4Sk3zowlkDWWGl6q
        Dl4SpAxJmJohRHLqa1cTRQneaonj0
X-Received: by 2002:a05:600c:5010:b0:401:b652:b6cf with SMTP id n16-20020a05600c501000b00401b652b6cfmr1071105wmr.13.1697794937695;
        Fri, 20 Oct 2023 02:42:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHM1EM6T+wMVFzF33cC7Y8KaN3eWcPR5dXbra2BbI2AyJPoDU5x0TqLATbg4eiyQEcfWjjlHA==
X-Received: by 2002:a05:600c:5010:b0:401:b652:b6cf with SMTP id n16-20020a05600c501000b00401b652b6cfmr1071091wmr.13.1697794937447;
        Fri, 20 Oct 2023 02:42:17 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73d2:bf00:e379:826:5137:6b23])
        by smtp.gmail.com with ESMTPSA id f18-20020a05600c155200b00402ff8d6086sm1734198wmg.18.2023.10.20.02.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:42:16 -0700 (PDT)
Date:   Fri, 20 Oct 2023 05:42:14 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     jasowang@redhat.com, virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Message-ID: <20231020054140-mutt-send-email-mst@kernel.org>
References: <20231020092320.209234-1-suhui@nfschina.com>
 <20231020053047-mutt-send-email-mst@kernel.org>
 <1697794601.5857713-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1697794601.5857713-2-xuanzhuo@linux.alibaba.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2023 at 05:36:41PM +0800, Xuan Zhuo wrote:
> On Fri, 20 Oct 2023 05:34:32 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Fri, Oct 20, 2023 at 05:23:21PM +0800, Su Hui wrote:
> > > virtqueue_resize_packed() or virtqueue_resize_split() can return
> > > error code if failed, so add a check for this.
> > >
> > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > ---
> > >
> > > I'm not sure that return directly is right or not,
> > > maybe there are some process should do before return.
> >
> > yes - presizely what virtqueue_enable_after_reset does.
> >
> > Error handling in virtqueue_enable_after_reset is really weird BTW.
> > For some reason it overrides the error code returned.
> >
> >
> >
> >
> >
> > >  drivers/virtio/virtio_ring.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > index 51d8f3299c10..cf662c3a755b 100644
> > > --- a/drivers/virtio/virtio_ring.c
> > > +++ b/drivers/virtio/virtio_ring.c
> > > @@ -2759,6 +2759,9 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > >  	else
> > >  		err = virtqueue_resize_split(_vq, num);
> > >
> > > +	if (err)
> > > +		return err;
> > > +
> > >  	return virtqueue_enable_after_reset(_vq);
> >
> > So I think it should be something like:
> >
> > 	int err_reset = virtqueue_enable_after_reset(_vq);
> > 	BUG_ON(err_reset);
> >
> > 	return err;
> >
> 
> How about WARN and vq->broken?
> 
> Thanks.

Well, what are the cases where it can happen practically?

> 
> >
> >
> > >  }
> > >  EXPORT_SYMBOL_GPL(virtqueue_resize);
> > > --
> > > 2.30.2
> >

