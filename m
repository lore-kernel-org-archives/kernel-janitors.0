Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30CD1C4332F
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Dec 2022 22:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiLHWQt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Dec 2022 17:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiLHWQq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Dec 2022 17:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A0A9DF20
        for <kernel-janitors@vger.kernel.org>; Thu,  8 Dec 2022 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670537748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FFucKqZ5g4RYQZgbVFZF1v5fxQZ2+gEQUrOtWvEcYuA=;
        b=SmFGnAW3FEMbX18jPm4j2wn7xk0DlXq59JY6CS5if7KLUUHw4HyHDs/TZWFomTvppw/QVP
        z4ZXsNbgNMnKopL3EoOV/BzoACwJLdTy/nsWyvPrDxH+aChPdeUdvYy9fJCZZcDr57MOPw
        E81bb+JuGDnGP0oaRL6yrlvLPBQ4+Rg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-x6Q2p-uDMOmaEg7i98mSJw-1; Thu, 08 Dec 2022 17:15:47 -0500
X-MC-Unique: x6Q2p-uDMOmaEg7i98mSJw-1
Received: by mail-io1-f70.google.com with SMTP id o16-20020a056602225000b006e032e361ccso1054600ioo.13
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Dec 2022 14:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FFucKqZ5g4RYQZgbVFZF1v5fxQZ2+gEQUrOtWvEcYuA=;
        b=3xW0ghSr2HcY9sN2/j+F+yKl4KkmVUF7RBUY4Gug0JzrvMGFCfCDAI3PUkzyTbijwT
         gwgAL2ivKXw//Zu5dEzulbyIMu5iR0TIf3aNQgoXDO9cbfUefsD1HiYaysoj1rLB5jST
         I599nqiTA9EGS9DQ8nYPiUal/tXnB4bEyT8ZmLl864IalkwzCuMuyn6+IA803sU01BSg
         Z7bKxE3aWTBmMmXaS67+N3EsudcupPC5VVnOOgug7MI48sq32g69QT1biuAjKi/B6uWu
         sf6Y2opLXYoEuZFD2kEwp8YFaV8CRKCaEHHX+j9SsP8q363SbNcwnG0xiJcnD6eGd9Z/
         zZTA==
X-Gm-Message-State: ANoB5pkq2IESkssjBJmdlAec8+HDbzuwSNIgqGsb97EstMchSyTIPgkG
        zCcQH5a/tgD60WXKWVHgYfiN0Db6RPtUtT2JJ6XrgSxNpHcGD9e2EeOSRHZDKjj31CeZ0gxjZnL
        tZ0nNDpPQ1qvw2ABQQ46+4yAItod6
X-Received: by 2002:a05:6e02:542:b0:303:7c99:eb78 with SMTP id i2-20020a056e02054200b003037c99eb78mr4210625ils.88.1670537746664;
        Thu, 08 Dec 2022 14:15:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7fGLYEQgxoER97yecG8lw8y51v2EHG1rR/2NisBDARU6wasAHEg9IAkNOG+qXw7WJABOfSuQ==
X-Received: by 2002:a05:6e02:542:b0:303:7c99:eb78 with SMTP id i2-20020a056e02054200b003037c99eb78mr4210621ils.88.1670537746464;
        Thu, 08 Dec 2022 14:15:46 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id y10-20020a056638228a00b00363781b6bccsm1686691jas.49.2022.12.08.14.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:15:45 -0800 (PST)
Date:   Thu, 8 Dec 2022 15:15:44 -0700
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>,
        Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Shay Drory <shayd@nvidia.com>, kvm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 1/2] vfio/mlx5: fix error code in mlx5vf_precopy_ioctl()
Message-ID: <20221208151544.488c575d.alex.williamson@redhat.com>
In-Reply-To: <Y5IKVknlf5Z5NPtU@kili>
References: <Y5IKVknlf5Z5NPtU@kili>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, 8 Dec 2022 19:01:26 +0300
Dan Carpenter <error27@gmail.com> wrote:

> The copy_to_user() function returns the number of bytes remaining to
> be copied but we want to return a negative error code here.
> 
> Fixes: 0dce165b1adf ("vfio/mlx5: Introduce vfio precopy ioctl implementation")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/vfio/pci/mlx5/main.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied both to vfio next branch for v6.2.  Thanks,

Alex

