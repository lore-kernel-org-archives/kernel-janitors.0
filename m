Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08165CDB474
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 09:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376720AbjJTJfo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 05:35:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376757AbjJTJfj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 05:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12CC3D51
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697794488;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tAB7Iz32RgXSddcXY/V5m8QJyFvIuwe2gAktuOJNjXM=;
        b=hGAUjgDUN4f3W053A6yHz5fbsb2NGXv60/0oLgTvCaCUGZ7dxUr41RTUXNaOnmTij61MgY
        uOwiaFZxZ2cI8lCxsc4AsI3sWiNze3596OISGuSnJw/pQEx1ZZaXeahMUtjVUWeSQwYNIm
        HQ5V2BrOajstXPWmOQZwo3lJ/9M5DA0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-wf1r3yCTPG65Y86hgID2VA-1; Fri, 20 Oct 2023 05:34:37 -0400
X-MC-Unique: wf1r3yCTPG65Y86hgID2VA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-408508aa81cso3233655e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 02:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794476; x=1698399276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAB7Iz32RgXSddcXY/V5m8QJyFvIuwe2gAktuOJNjXM=;
        b=uerg1PdRcwwGtzE/7gvDsFRbgHjpW5dU+htc4AJl3New4GEXCBioLfdjLMoEODYS15
         DuL303I5yMVAz8sLFJBSwi7txwc3TO+TaC//eeW70gUUieSDof+wo+TaCoAMu+JTcc81
         rZkCJ9X6ZaA6f5PvVy65qzHpa5Y3EcqAGp+TYfmeS2LWHPMGd+EzsMJjcyna9rTeQk70
         F6tA5BumbyY4uTPu4Vb0btTc3Xkxpe5A5tsMU+Bla/PacFhS1g8xAckwdlLjWNaLEhjB
         f1ODldCFOIt9bdf0de4B9O+djLSpOvx+MU+D6yBa7tA8sw84AvuxorfN04JZcEeYaLRv
         uVGA==
X-Gm-Message-State: AOJu0YwVUTFbJ+/9TfM9DiTvK+EqwQO6N3/ajq1qrW9s+EbxMAYFq1nP
        L3k01pehKjY3gXgIWw6TQIBLw4bi4v7b2Hs32NqLYD1dXI1Zh0lnWvJShlWmkeG9+bU7hrOCcvN
        f+RKkV+Q22p5LaMKdTGMH2scUN+QY
X-Received: by 2002:a05:600c:3111:b0:406:8491:ec2 with SMTP id g17-20020a05600c311100b0040684910ec2mr958412wmo.15.1697794476060;
        Fri, 20 Oct 2023 02:34:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4API/mXl60/J/SzspOM0lDrt9ZQKAaYMDD+MpiY1h5LWvzInLOfYWTEBlY+tciVYRMLzAyQ==
X-Received: by 2002:a05:600c:3111:b0:406:8491:ec2 with SMTP id g17-20020a05600c311100b0040684910ec2mr958402wmo.15.1697794475694;
        Fri, 20 Oct 2023 02:34:35 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73d2:bf00:e379:826:5137:6b23])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm6420179wmf.5.2023.10.20.02.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:34:35 -0700 (PDT)
Date:   Fri, 20 Oct 2023 05:34:32 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Su Hui <suhui@nfschina.com>
Cc:     jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Message-ID: <20231020053047-mutt-send-email-mst@kernel.org>
References: <20231020092320.209234-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020092320.209234-1-suhui@nfschina.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Oct 20, 2023 at 05:23:21PM +0800, Su Hui wrote:
> virtqueue_resize_packed() or virtqueue_resize_split() can return
> error code if failed, so add a check for this.
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> 
> I'm not sure that return directly is right or not,
> maybe there are some process should do before return.

yes - presizely what virtqueue_enable_after_reset does.

Error handling in virtqueue_enable_after_reset is really weird BTW.
For some reason it overrides the error code returned.





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

So I think it should be something like:

	int err_reset = virtqueue_enable_after_reset(_vq);
	BUG_ON(err_reset);

	return err;



>  }
>  EXPORT_SYMBOL_GPL(virtqueue_resize);
> -- 
> 2.30.2

