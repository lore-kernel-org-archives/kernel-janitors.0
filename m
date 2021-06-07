Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBECC47082
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 07:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC687611AE
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Jun 2021 07:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhFGHxF (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Jun 2021 03:53:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24282 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229436AbhFGHxE (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Jun 2021 03:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623052273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WZwPx+0mdB9vay+PeM7MPpH/J1hyyvQmU9gTmamKU2o=;
        b=N05uBuA4gGC2rKo1lAIfD/lQK0yBwP4qY2FGPYI2EWG0fUGnj3ySg82lPN/OgoNuFpMrW+
        sSiYuB9KHkLcRvIk1GkRSeFVyfokyO0Z53Mls0RWch9/rH5noTe/9DbOHGBTshjr47NmqR
        Rwj7vH/CZvX7t42SI1HPFbnjUEGNyQc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-x_931XDuPZK-7_igonHx3g-1; Mon, 07 Jun 2021 03:51:12 -0400
X-MC-Unique: x_931XDuPZK-7_igonHx3g-1
Received: by mail-ed1-f69.google.com with SMTP id c21-20020a0564021015b029038c3f08ce5aso8931946edu.18
        for <kernel-janitors@vger.kernel.org>; Mon, 07 Jun 2021 00:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WZwPx+0mdB9vay+PeM7MPpH/J1hyyvQmU9gTmamKU2o=;
        b=bbHc9wmOZTkIUgk+DV+DRFKFO5lWY1+L/4OpZpVU7sCjYxbyH9bP2DBz+Y/FFf6CtJ
         3pW80mFEkmaqvsV0GSoYGPfjwB2hM9E0o7/9WeM/Pt9PPi/urmmy+ytd8WZp6h5/+nkp
         GQda5MglvN5StWWPqzEEb/CI+lOKecd+BQE1kGQUVcJ4nqLMWWM/lBop2pBMGPVRCKIZ
         xrCmukW4szzurja0/jAIlfHjFZKm/P5b3b60Lmf8j3YhmX/HPLhe8luZxIM/TOME6WMk
         ZU3l0tbHmKTiEkM+GMbwlUo4LtrfObykjIFBitngo86kgGwTad6pJ4a70aqXqBEB3+ht
         o2pw==
X-Gm-Message-State: AOAM532j0/yTL1him9XPs8mbdHLSepVy2ZFqML+VCYPVbfuK3+S6xJid
        5N/L0INoJVcWToJkUFsu8ng0bgvy1ZXvGAav4woRaP/qU84IgEey/rTnC89Sk0aN8pEIl6QFVIz
        xpaF/ZktFf1zmCbaq4luT/jgYo4DD
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr18886317edd.104.1623052270897;
        Mon, 07 Jun 2021 00:51:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZPY7vqZq91osddVP7kT08CGyWsn3gu1ZzEt0v2pDJ1mKDFwYoa8lOXRspqGfqQB7sGlDKag==
X-Received: by 2002:a05:6402:26ce:: with SMTP id x14mr18886303edd.104.1623052270703;
        Mon, 07 Jun 2021 00:51:10 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it. [79.18.148.79])
        by smtp.gmail.com with ESMTPSA id q9sm7174628edw.51.2021.06.07.00.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jun 2021 00:51:10 -0700 (PDT)
Date:   Mon, 7 Jun 2021 09:51:08 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, Eli Cohen <elic@nvidia.com>,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vdpa: fix error code in vp_vdpa_probe()
Message-ID: <20210607075108.dujhjrt2anis252l@steredhat>
References: <YLtyYE8TinOl3IhO@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YLtyYE8TinOl3IhO@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, Jun 05, 2021 at 03:47:28PM +0300, Dan Carpenter wrote:
>Return -ENOMEM if vp_modern_map_vq_notify() fails.  Currently it
>returns success.
>
>Fixes: 11d8ffed00b2 ("vp_vdpa: switch to use vp_modern_map_vq_notify()")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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
>-- 
>2.30.2
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

