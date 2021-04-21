Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72551C433ED
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 18:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EE99613D3
	for <kernel-janitors@archiver.kernel.org>; Wed, 21 Apr 2021 18:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245131AbhDUSYH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 21 Apr 2021 14:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235518AbhDUSYD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 21 Apr 2021 14:24:03 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4F84C06138A
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Apr 2021 11:23:29 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id h15so10975251qvu.4
        for <kernel-janitors@vger.kernel.org>; Wed, 21 Apr 2021 11:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pEe5PZRzotHXF6wvwpO5vYTFWnCReMX6MPr0QZ7yo2Y=;
        b=PxvdwZasfsEE7Ys0Fr9ySM8GWmuUf2u+2EyoJ6NAv5FaU2hoGu0bM8Nj6+n4uc1naD
         7XibpmiOJrLxC34f9eoERq737OUpXbwZ4FHodlyJcOJ6nhzTAuIOA5zFWYfYn6sibrkz
         jvf2/3gx3WYa3215trShhZsNHe7l/EB6ymSrdEukHu83D5Ge/BSc6GM7DSqFfLmzw2m3
         /PCEwmDm6j0kHaZiRTKAS1brgWZcKeZ7TtMXKzfR1F956IG01WQc8CxYtuTGz/j0dREc
         S6l8RMHLefAjkUBTKqNCzTD+K1vfyt8u++9iHPU7/QU9RX+2p3QoR1H7rJ+yTjYex4cC
         IJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pEe5PZRzotHXF6wvwpO5vYTFWnCReMX6MPr0QZ7yo2Y=;
        b=RWAb/Uk/Cunt8PA9DixrJBinm4qNRuXvthwwyVfRnzUCNRYYNT/vjxScJNRbX5c+Zn
         ZVi9qq1SPo1/nVllkghudPKt0XfbdvhrMeVFne4qr5DFLyi2OPYHZU9mYGeIEI/XDyWw
         wzS1EMyP6ZVeO4h+cRFhN6dymBZ4gtCsltHE/lYZsLnYUCLoTgdKD7WLHdPJr0evjo6e
         YQKAHvS1ysCaBBZpPXO/1lILYXFfcfQHdkfm0c7twsgItVWMOiJ9SC2XUoQHcxG/ps8Z
         jIDfGiozRzFjBTykf3LiPNRhgwcL/TlWWl3UMl7VR4nb/sRTUPJ4DFx2DpQbeyBwykCm
         3yzQ==
X-Gm-Message-State: AOAM530wowC6aEC4g9f4XC05d98Rtu9pXA2F8MjBEecQkMb9Ls/zd1EG
        ob4pnXwZV32zLj2pwNsZ1xVugQ==
X-Google-Smtp-Source: ABdhPJyvgzHXAL+BJgPHqwuJ96KHMgfl6lKvi2GyMh+7Nct0M1SLmRqnQK0pMm6W+xYvE0uczx9r7Q==
X-Received: by 2002:a05:6214:725:: with SMTP id c5mr17652898qvz.54.1619029409070;
        Wed, 21 Apr 2021 11:23:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-115-133.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.115.133])
        by smtp.gmail.com with ESMTPSA id x204sm109847qkb.97.2021.04.21.11.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 11:23:28 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1lZHVX-009bey-Ix; Wed, 21 Apr 2021 15:23:27 -0300
Date:   Wed, 21 Apr 2021 15:23:27 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kirti Wankhede <kwankhede@nvidia.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        kvm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] vfio/mdev: remove unnecessary NULL check in
 mbochs_create()
Message-ID: <20210421182327.GD2047089@ziepe.ca>
References: <YIAowNYCOCNu+xhm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YIAowNYCOCNu+xhm@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Apr 21, 2021 at 04:29:36PM +0300, Dan Carpenter wrote:
> This NULL check is no longer required because "type" now points to
> an element in a non-NULL array.
> 
> Fixes: 3d3a360e570616 ("vfio/mbochs: Use mdev_get_type_group_id()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  samples/vfio-mdev/mbochs.c | 2 --
>  samples/vfio-mdev/mdpy.c | 3 +--
>  2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks,
Jason
