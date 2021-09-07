Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2A7C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:28:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 219F260F25
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhIGJaC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 05:30:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29177 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229827AbhIGJaC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 05:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631006935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c+ELEzoQ4QAn8Ie286H/WnwUwtKE7bF9TZ17FSYZ65E=;
        b=U0QR3nU3SKXfWCXAXdl4zqvmdw0mdwDDU7n9SxfNhhuqFPLE9EcV+ePUn5n6eBaiGnALZp
        E0J4vLd49/WzhKnmHiqOPUmJZ4jwIekpO9YrmpxFKbS0D/Np5XYAY8P5CEU3rFqNCcPmum
        tBBqJ6Ws9jKPDkpTnYalP2f5QGmDycY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-_CxqfQWFP2mNJ0UToUntuA-1; Tue, 07 Sep 2021 05:28:54 -0400
X-MC-Unique: _CxqfQWFP2mNJ0UToUntuA-1
Received: by mail-ed1-f69.google.com with SMTP id g4-20020a056402180400b003c2e8da869bso4964442edy.13
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Sep 2021 02:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c+ELEzoQ4QAn8Ie286H/WnwUwtKE7bF9TZ17FSYZ65E=;
        b=OKgdMUz82HGn29zPnKrcZlZFL+FjbcICBLg3SO/hsctbt5hcZ5cWR6YJMCJL+dTSuu
         +MWBs6o+2/C2L8tYWxTucuVnJI7GPGlXkqzW2cvv76XSuz98tv8Da7F4V1XL/IounNJ4
         x9VJuQwyYFi4GNMiWJR/A/xf+sQuEo5wN1uqxQZW1P8aHEtmObZWBlqU9D/HJMRPPMXC
         m/BMVzLL6F4B/88kSi9kOPLKHX3/8dTOQv9EwbntXNziX9JRnx5ZJ/xcW4zm+4F269OS
         sQl5aHzVhPPMshznWgvpHg6XLpkDZTCoIyn5P8lAYARxa1mE/LSRNEDwnWNOnt8KSopi
         RVYA==
X-Gm-Message-State: AOAM532CjAS/bIkYZhaYteTYV2I6ayMD0tUQX5zxW07BbXLKHKj2UqeZ
        67eUBgLTMj98nngVqS/D6Ne79pxvo8RUDyCdWgW4FECjSXwbLQ3KzjHFmmq2uuP/WA9MFjosrcA
        sFmgIibNmhBIFfSRZyIzStI8wkCWL
X-Received: by 2002:a17:906:abcd:: with SMTP id kq13mr17989143ejb.195.1631006933043;
        Tue, 07 Sep 2021 02:28:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMcKctpuayKd5CoMXMfA26llSiCRSTKNXTGJGOGy4mjgRMoo81oyolso+1R0iv2oiVG325ww==
X-Received: by 2002:a17:906:abcd:: with SMTP id kq13mr17989132ejb.195.1631006932878;
        Tue, 07 Sep 2021 02:28:52 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it. [79.51.2.59])
        by smtp.gmail.com with ESMTPSA id 8sm5362506ejy.65.2021.09.07.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 02:28:52 -0700 (PDT)
Date:   Tue, 7 Sep 2021 11:28:49 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Xie Yongji <xieyongji@bytedance.com>,
        kernel-janitors@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] vdpa: potential uninitialized return in
 vhost_vdpa_va_map()
Message-ID: <20210907092849.hl56jaog7pouwxdn@steredhat>
References: <20210907073253.GB18254@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210907073253.GB18254@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Sep 07, 2021 at 10:32:53AM +0300, Dan Carpenter wrote:
>The concern here is that "ret" can be uninitialized if we hit the
>"goto next" condition on every iteration through the loop.
>
>Fixes: 41ba1b5f9d4b ("vdpa: Support transferring virtual addressing during DMA mapping")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
> drivers/vhost/vdpa.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>index d0c0fedf2c09..170166806714 100644
>--- a/drivers/vhost/vdpa.c
>+++ b/drivers/vhost/vdpa.c
>@@ -640,7 +640,7 @@ static int vhost_vdpa_va_map(struct vhost_vdpa *v,
> 	u64 offset, map_size, map_iova = iova;
> 	struct vdpa_map_file *map_file;
> 	struct vm_area_struct *vma;
>-	int ret;
>+	int ret = 0;
>
> 	mmap_read_lock(dev->mm);
>
>-- 
>2.20.1
>
>_______________________________________________
>Virtualization mailing list
>Virtualization@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/virtualization
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

