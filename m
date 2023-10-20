Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899FBC07480
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 10:09:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376872AbjJTKJD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 06:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376910AbjJTKI7 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 06:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB3F93
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697796492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8DPd11sc2uBsWrWlYeP8kGG0jI+Vgzqkk7sKu4E6ndQ=;
        b=KR/MT/5X8TwK4ISZ3vfxbnE19jVfRl+4C8kzii9MSRCc+AHsv5UgKCT0hEtHeotqD/37Lb
        tD7w2tE/WR0PBup9bqXoYCi8+hYNgrbJxah14l9g4jIqKxUiEorUcxGyiR1RwaA+NrKZ4n
        Ea2sUV7rC4u0J6OSw2dWZITKp2QAUIE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-Nw_syq4xNFSPbz2VsdN2Mw-1; Fri, 20 Oct 2023 06:08:11 -0400
X-MC-Unique: Nw_syq4xNFSPbz2VsdN2Mw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-408212415abso3973745e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 03:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697796490; x=1698401290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DPd11sc2uBsWrWlYeP8kGG0jI+Vgzqkk7sKu4E6ndQ=;
        b=oSbmVqsCXawvAZ+uAiD5tpi0PjE4kqquGTearFIzVL6Ji4b8Wisy/qWE24jqr1i444
         RCEpDAC8KIc1+hyYyva8e+5tRg/3oqDEKSZdXWVx5L5vBAVsvO/H7ToS3ukpQZrRBw4m
         AIkAVPO7bExFezMuE86hbK55/vvPRZQwvvzWTjLxKyG9yB4qr5FvfO1Fnp3y51IOqeng
         //kvSNnAzP7dUY0ivHzqOg913knXCdS1Fq4NHz7cMd6v3qUdJiFfRYcWc/Kbb65F27nH
         caU8Wtyr0Ysh5vOzgRCMUQ3eX6nIsGjetOr7s7vqfpwwxviFZ8MsBzpgWK09n+pN03pp
         d1Xw==
X-Gm-Message-State: AOJu0YwYu2loup64Z6Hpkcp+UVbl/xDya8XNX4p8qPHBxhW4Co+a30/c
        wvSNZLkcvWd6yrFWrPyNfiLYQiimGDRRU2TSd1M0mNoQALFuYNGq52igxKRrrJ8W9IpjfWrt2Q0
        Ixa7GreWa9MWpEf3DhGoCTlC6b1U3
X-Received: by 2002:a05:600c:4f12:b0:401:bdd7:49ae with SMTP id l18-20020a05600c4f1200b00401bdd749aemr1214855wmq.18.1697796489826;
        Fri, 20 Oct 2023 03:08:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNE9FiNbwpYdXqLcZIJ4/1YwoFZJFhOvQpn5AauT7Zhc0SVoOEu1TSydQNnfcIKDvas2A+cQ==
X-Received: by 2002:a05:600c:4f12:b0:401:bdd7:49ae with SMTP id l18-20020a05600c4f1200b00401bdd749aemr1214829wmq.18.1697796489458;
        Fri, 20 Oct 2023 03:08:09 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73d2:bf00:e379:826:5137:6b23])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b0040813e14b49sm6583115wmo.30.2023.10.20.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 03:08:08 -0700 (PDT)
Date:   Fri, 20 Oct 2023 06:08:06 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     jasowang@redhat.com, virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Message-ID: <20231020055943-mutt-send-email-mst@kernel.org>
References: <20231020092320.209234-1-suhui@nfschina.com>
 <20231020053047-mutt-send-email-mst@kernel.org>
 <1697794601.5857713-2-xuanzhuo@linux.alibaba.com>
 <20231020054140-mutt-send-email-mst@kernel.org>
 <1697795422.0986886-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1697795422.0986886-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2023 at 05:50:22PM +0800, Xuan Zhuo wrote:
> On Fri, 20 Oct 2023 05:42:14 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Fri, Oct 20, 2023 at 05:36:41PM +0800, Xuan Zhuo wrote:
> > > On Fri, 20 Oct 2023 05:34:32 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Fri, Oct 20, 2023 at 05:23:21PM +0800, Su Hui wrote:
> > > > > virtqueue_resize_packed() or virtqueue_resize_split() can return
> > > > > error code if failed, so add a check for this.
> > > > >
> > > > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > > > ---
> > > > >
> > > > > I'm not sure that return directly is right or not,
> > > > > maybe there are some process should do before return.
> > > >
> > > > yes - presizely what virtqueue_enable_after_reset does.
> > > >
> > > > Error handling in virtqueue_enable_after_reset is really weird BTW.
> > > > For some reason it overrides the error code returned.
> > > >
> > > >
> > > >
> > > >
> > > >
> > > > >  drivers/virtio/virtio_ring.c | 3 +++
> > > > >  1 file changed, 3 insertions(+)
> > > > >
> > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > index 51d8f3299c10..cf662c3a755b 100644
> > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > @@ -2759,6 +2759,9 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > > > >  	else
> > > > >  		err = virtqueue_resize_split(_vq, num);
> > > > >
> > > > > +	if (err)
> > > > > +		return err;
> > > > > +
> > > > >  	return virtqueue_enable_after_reset(_vq);
> > > >
> > > > So I think it should be something like:
> > > >
> > > > 	int err_reset = virtqueue_enable_after_reset(_vq);
> > > > 	BUG_ON(err_reset);
> > > >
> > > > 	return err;
> > > >
> > >
> > > How about WARN and vq->broken?
> > >
> > > Thanks.
> >
> > Well, what are the cases where it can happen practically?
> 
> Device error. Such as vp_active_vq()
> 
> Thanks.

Hmm interesting. OK. But do callers know to recover?

> 
> >
> > >
> > > >
> > > >
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(virtqueue_resize);
> > > > > --
> > > > > 2.30.2
> > > >
> >

