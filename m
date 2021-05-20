Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A29C433ED
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 07:05:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D69A66124C
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 May 2021 07:05:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhETHHF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 May 2021 03:07:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24900 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229547AbhETHHE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 May 2021 03:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621494343;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KaliF5eDoHyShQ6pVk6nswV0QmddLwdx+Te1ge1ipyU=;
        b=EJy833z/OS0DN4fNa0ISFYTp82wigHe5/PgOlw2aQqdeg1I36YfMz44qHTON6E7DeGTSdD
        0+/bDKkbO9OS/g5FM6iNViKyUaLZW73E34avway0ND9Gvcm34i1jNFyOFIQ/HJJz1KxQwb
        QrfJqugR4whwg5p6MZVakXevup/O0A8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-qTqN3arkO7Ojq8XgIPUYdQ-1; Thu, 20 May 2021 03:05:42 -0400
X-MC-Unique: qTqN3arkO7Ojq8XgIPUYdQ-1
Received: by mail-ej1-f72.google.com with SMTP id la2-20020a170906ad82b02903d4bcc8de3bso4590847ejb.4
        for <kernel-janitors@vger.kernel.org>; Thu, 20 May 2021 00:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KaliF5eDoHyShQ6pVk6nswV0QmddLwdx+Te1ge1ipyU=;
        b=ZlZf8BrbDmANcWGkwq3I1E+UN9Dge0GcbrqfLXcFoZK0u2vr8vp5frCD5LaOw+6Ijh
         Sl4Qm3KjUAjy1rcOiUvrflzDpE1V8l45l35OHDQyHTX7pD2oXo0wCaaNyCsfSFky/Xxp
         Q4CM9w3ngXWnI1XOIffnU5jRRT+pGoqsq5ay6SZ/n7XX6SvmsiRV4VEHqNPkxC49RmMc
         hVcMWUyAniNXMTnqoMV8oajJyFEhtpHSndMMZgBDe6Edf55qRHrmcvhT6EQB19TATSvj
         z4Qnw/zkydNO3NHnRNnP1l/Lf886VBz25b19E4v/9EomPvHrrX2Ipdyjp2/FUn92DDWh
         EHFQ==
X-Gm-Message-State: AOAM533LQqQNI4x/cXDxmV9AmGz4fGbUkDKc6K5xX7smOtBaQihmzLXc
        RDmFzrKhDErIOLsTZzMN8hrEMePUhU/Zg+xBvmsVnhASWog9gR2Eh9fRpAcgm5PypnSCjNtI7Mn
        gPqXxeUb+QpM+/iOzEfEtMgHpnwVH
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr3445598eds.166.1621494340875;
        Thu, 20 May 2021 00:05:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv5JoSB/zlPpuQMN8GuzvFJPHkuHmpfxSZN0QQJmqGyUr9a1onbpIw9MzbZAOgIOc+t4fM8A==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr3445576eds.166.1621494340688;
        Thu, 20 May 2021 00:05:40 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it. [79.18.148.79])
        by smtp.gmail.com with ESMTPSA id m10sm987322edp.48.2021.05.20.00.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 00:05:40 -0700 (PDT)
Date:   Thu, 20 May 2021 09:05:38 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, Eli Cohen <elic@nvidia.com>,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] vp_vdpa: fix error return code in vp_vdpa_probe()
Message-ID: <20210520070538.jniunk2rr3nyttuw@steredhat>
References: <20210519141646.3057093-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210519141646.3057093-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 19, 2021 at 02:16:46PM +0000, Wei Yongjun wrote:
>Fix to return negative error code -ENOMEM from the error handling
>case instead of 0, as done elsewhere in this function.
>
>Fixes: 11d8ffed00b2 ("vp_vdpa: switch to use vp_modern_map_vq_notify()")
>Reported-by: Hulk Robot <hulkci@huawei.com>
>Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>---
> drivers/vdpa/virtio_pci/vp_vdpa.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
>index c76ebb531212..e5d92db728d3 100644
>--- a/drivers/vdpa/virtio_pci/vp_vdpa.c
>+++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
>@@ -442,6 +442,7 @@ static int vp_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> 			vp_modern_map_vq_notify(mdev, i,
> 						&vp_vdpa->vring[i].notify_pa);
> 		if (!vp_vdpa->vring[i].notify) {
>+			ret = -ENOMEM;
> 			dev_warn(&pdev->dev, "Fail to map vq notify %d\n", i);
> 			goto err;
> 		}
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

