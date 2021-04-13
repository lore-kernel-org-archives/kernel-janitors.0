Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCD7C433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 07:29:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A43BA613B2
	for <kernel-janitors@archiver.kernel.org>; Tue, 13 Apr 2021 07:29:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239680AbhDMHaG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:30:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35742 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239357AbhDMHaA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Apr 2021 03:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618298980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=YudAFqILa3mOOE+t1TyWZ2gFUm2V6rY++OIJXhuuw1I=;
        b=GVFECx12o1HxFMFDi+vKfUZpJyldeRU3GqaOaZAL33IlUdEti5n+MXWu9OP0hh7u7wRhe8
        TB8ZofjrRkF6FcQSlnJUO2g9FK9lwOVnOr3FnNZk5s3TUTklLDzdmz1ChdAeugi9dHyrkZ
        1l0++xy5yXZAO5soWr6+JhPspJXAABU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-tcCYl-qhPQuei3ZINSPvrw-1; Tue, 13 Apr 2021 03:29:38 -0400
X-MC-Unique: tcCYl-qhPQuei3ZINSPvrw-1
Received: by mail-ed1-f72.google.com with SMTP id bm19-20020a0564020b13b02903789d6e74b5so792374edb.21
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Apr 2021 00:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YudAFqILa3mOOE+t1TyWZ2gFUm2V6rY++OIJXhuuw1I=;
        b=nYE2B8WUgN91slx0Tmtq8r0TZB34Bd7zLhAJdZOcyIW7CSWOMbH3sgcqVfMkNR2a31
         ZEZ5VqrelM3aN2E0smpQoDPuNGo2yrdD344MT3TTxjxBu7zrI5GgqtS6KAIS9lz0Mrbf
         /nZ2P9ScVpyQfmsS3DSg3pni+j8aCfeWw0hTU9GbiAroGN6gmRBCIe+SjUg9CUGvYTIq
         g6pJA6AvrXYIRG3yrduQHxbVNlZrAcAssLQJvqBr7BJIRKxY77s7DA+rlzGA3IUrrvcH
         e8zSpM0s/B09Ea6LhHFlV0IqRM1hPiirQn8swqU3gO34XREGzX4RpiIutlyBVuURPBsM
         pCCA==
X-Gm-Message-State: AOAM530wvxBYU8M+hInCS9VvY+6b8PABELS2vOb9XC0aCXM0EOtWUEwX
        JK7OIyYeB6l7gA9bQLwc5GBVx8o9NBm3j7H9qOQosqgC9yL7x1nD/3LdZa8LPVkn/G7WTuYlnhg
        KfYs6Gymve4jS9zrnoPledmqkvOWc
X-Received: by 2002:a05:6402:3445:: with SMTP id l5mr33576462edc.27.1618298977497;
        Tue, 13 Apr 2021 00:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQrY+VYWzozoHawW7aNAan46NiQL9riVrwylV8GXb98pXD2+8ryZFNg9lKT4PGXF62dZbE/g==
X-Received: by 2002:a05:6402:3445:: with SMTP id l5mr33576447edc.27.1618298977323;
        Tue, 13 Apr 2021 00:29:37 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it. [79.34.249.199])
        by smtp.gmail.com with ESMTPSA id gt37sm7169639ejc.12.2021.04.13.00.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 00:29:37 -0700 (PDT)
Date:   Tue, 13 Apr 2021 09:29:34 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Colin King <colin.king@canonical.com>
Cc:     "Michael S . Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Parav Pandit <parav@nvidia.com>,
        virtualization@lists.linux-foundation.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] vdpa/mlx5: Fix resource leak of mgtdev due to
 incorrect kfree
Message-ID: <20210413072934.ibz7iersn5byad3h@steredhat>
References: <20210412162804.1628738-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210412162804.1628738-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Apr 12, 2021 at 05:28:04PM +0100, Colin King wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>Static analysis is reporting a memory leak on mgtdev, it appears
>that the wrong object is being kfree'd. Fix this by kfree'ing
>mgtdev rather than mdev.
>
>Addresses-Coverity: ("Resource leak")
>Fixes: c8a2d4c73e70 ("vdpa/mlx5: Enable user to add/delete vdpa device")
>Signed-off-by: Colin Ian King <colin.king@canonical.com>
>---
> drivers/vdpa/mlx5/net/mlx5_vnet.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
>index 10c5fef3c020..25533db01f5f 100644
>--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
>+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
>@@ -2089,7 +2089,7 @@ static int mlx5v_probe(struct auxiliary_device *adev,
> 	return 0;
>
> reg_err:
>-	kfree(mdev);
>+	kfree(mgtdev);
> 	return err;
> }
>
>-- 
>2.30.2
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

