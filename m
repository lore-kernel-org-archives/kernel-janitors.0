Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4A4C433EF
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 May 2022 23:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347879AbiEZXZS (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 May 2022 19:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231516AbiEZXZP (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 May 2022 19:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5849CE64EA
        for <kernel-janitors@vger.kernel.org>; Thu, 26 May 2022 16:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1653607514;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9X8JUoVO3ItYFMP0lxBdt9F+7PIN+J/Kt3iw5v3WE2U=;
        b=dZ7Y55I9CLlkM5+NaoGTHwxVzuDlOGbf3lpo4/P+MqpSmvF3F4lwuDtcN1hMSzozc5SscX
        Rj/IiQP7uwxE+c8jtHyKIe0ad3YN79egjxXW+pZ40I23VNMYknD1dfn2POdtvWvaK9co02
        WgbIOEYQTxeqfJyJcDe36iGocIVkU1I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-JLQJ28vNMVKl5cuB1M4Fig-1; Thu, 26 May 2022 19:25:07 -0400
X-MC-Unique: JLQJ28vNMVKl5cuB1M4Fig-1
Received: by mail-wm1-f70.google.com with SMTP id o23-20020a05600c511700b0039743cd8093so1724444wms.6
        for <kernel-janitors@vger.kernel.org>; Thu, 26 May 2022 16:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9X8JUoVO3ItYFMP0lxBdt9F+7PIN+J/Kt3iw5v3WE2U=;
        b=Nd3jdaLMa0I178MugVbb4cxz9RQqza1OT5ftLXp5e4O2o2dEoLXnncx9nG+gy/azQh
         Ag7OHveDujCXm07p5YLrfMI4nbFzVO+g6jEVr06e5lgHDnRPQjkcgUYLcpk+rSm0/5CP
         VqD+fNhM7I32nregDw2YEWSMM3PFRlzZj1VTiyEpUvZLsbGCZ7sbx6KEgCcfjca2ZIB0
         1Y7j1jUeBgbxOGluk2qecBiqpuVbBnFpNVt/L1XNm8kOXWh9GsJkWeBWRrS3yhAzIJPD
         6buNHqGMzcLU1S3ySXLiXmxyF/hE5BYNBHjPaavivb+ed/dkAY3ku0b6pwQ902Q6LUTX
         qByA==
X-Gm-Message-State: AOAM531w2jCqcHtrS5SW6XTZ37xk2GlErCkeHLI3qa/BdTW5Ck2ff2Sq
        6vgwm7NOD96mSpdZJr0PxWQb/7TVE6IdIp3gjz+RxmR0rOEzrK3MPVQJC+WnAN3kCTz5gVLfHLY
        bqATSRElzOET6XrFbmNpaq+kV9LVs
X-Received: by 2002:a5d:6d8c:0:b0:20e:72ce:c9d9 with SMTP id l12-20020a5d6d8c000000b0020e72cec9d9mr29002639wrs.598.1653607505623;
        Thu, 26 May 2022 16:25:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6jLtwn+a7vihIpXB+X9zxsi4oW40VzxI37oPu2ky+U6YhL+3ESFEOquhhiPVK7ZSiEhjghw==
X-Received: by 2002:a5d:6d8c:0:b0:20e:72ce:c9d9 with SMTP id l12-20020a5d6d8c000000b0020e72cec9d9mr29002625wrs.598.1653607505366;
        Thu, 26 May 2022 16:25:05 -0700 (PDT)
Received: from redhat.com ([2.55.29.191])
        by smtp.gmail.com with ESMTPSA id 8-20020a1c0208000000b003942a244ed1sm466085wmc.22.2022.05.26.16.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 16:25:04 -0700 (PDT)
Date:   Thu, 26 May 2022 19:25:00 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     dan.carpenter@oracle.com, Jason Wang <jasowang@redhat.com>,
        Gautam Dawar <gautam.dawar@xilinx.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH] vhost-vdpa: Fix some error handling path in
 vhost_vdpa_process_iotlb_msg()
Message-ID: <20220526192401-mutt-send-email-mst@kernel.org>
References: <89ef0ae4c26ac3cfa440c71e97e392dcb328ac1b.1653227924.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89ef0ae4c26ac3cfa440c71e97e392dcb328ac1b.1653227924.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sun, May 22, 2022 at 03:59:01PM +0200, Christophe JAILLET wrote:
> In the error paths introduced by the commit in the Fixes tag, a mutex may
> be left locked.
> Add the correct goto instead of a direct return.
> 
> Fixes: a1468175bb17 ("vhost-vdpa: support ASID based IOTLB API")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> WARNING: This patch only fixes the goto vs return mix-up in this function.
> However, the 2nd hunk looks really spurious to me. I think that the:
> -		return -EINVAL;
> +		r = -EINVAL;
> +		goto unlock;
> should be done only in the 'if (!iotlb)' block.
> 
> As I don't know this code, I just leave it as-is but draw your attention
> in case this is another bug lurking.
> ---
>  drivers/vhost/vdpa.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 1f1d1c425573..3e86080041fc 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -1000,7 +1000,8 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev, u32 asid,
>  		if (!as) {
>  			dev_err(&v->dev, "can't find and alloc asid %d\n",
>  				asid);
> -			return -EINVAL;
> +			r = -EINVAL;
> +			goto unlock;
>  		}
>  		iotlb = &as->iotlb;
>  	} else
> @@ -1013,7 +1014,8 @@ static int vhost_vdpa_process_iotlb_msg(struct vhost_dev *dev, u32 asid,
>  		}
>  		if (!iotlb)
>  			dev_err(&v->dev, "no iotlb for asid %d\n", asid);
> -		return -EINVAL;
> +		r = -EINVAL;
> +		goto unlock;
>  	}
>  
>  	switch (msg->type) {
> -- 
> 2.34.1

