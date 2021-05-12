Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9BAC43462
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 16:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25E5861C96
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 May 2021 16:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236511AbhELQVy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 May 2021 12:21:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235276AbhELP7Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 May 2021 11:59:24 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6933AC08C5E5
        for <kernel-janitors@vger.kernel.org>; Wed, 12 May 2021 08:31:01 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id bf4so27577633edb.11
        for <kernel-janitors@vger.kernel.org>; Wed, 12 May 2021 08:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=foMbcJ9t/jw1PCF1w8ZLUJQPw4LhtMPOdZ9n9vc+2JY=;
        b=OSx+Ho0M1jKEBkXetkktVDTXudOBNAtPrBVu1YzuVKuTEL1/sS15FPlFFafNV89tco
         NJmlEchhll3j8ZSNq0vnDjLSrR6IeXopJ2aWzzibU3P5McgiEBSg5oZxObnFBtfCd5Q5
         MUSFdOM78SjxcxNUdfhiDx2preN2CamXZg+uo8TvF38qyhemUE1xaDY9JJhz31VE0hBq
         K1KZmg8t3QdmgxzE860qpEhIS/YHtJ8T9mMzATy5C+kQxhq8AwfncXGJMrwPI8/zAtdk
         vL28ba67Her9n6wZeYU5P+AljnG59cHjN91Wp36UCB8Yy//g85zmJIMFF4CgTUdtadqX
         dP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=foMbcJ9t/jw1PCF1w8ZLUJQPw4LhtMPOdZ9n9vc+2JY=;
        b=D6l9tO8kz+gr+/xEgp6u5qtLkVXJLIEgT+fXpp0qpT/w/XzkgjQvnSv2uYbWNJezLb
         xsf00D56t2qMoMz82xDgQHS87Wxf9gFiezyKBet/rcJdDdvTYRPNl0571RMmy6ms7Cam
         MLl5NgSW4n1pR6NPvthNX8g7HSWLPHS8Ze1P+38KsrJm95+O8208RXWuTPeBvZ0EaaE9
         HwuRx1QrBh2bsPEYVbAMKjBWDuIHJP94pzxtLKcy+9XxdowMKO3I/FrBTr5X7iyNzDPW
         n4mLGQaaUmfrPcKbU8SMMLYaU0surIesMqmR7hWM8FrI8a+tSbbkOu29L0h5Dq1dsAnQ
         Ugzg==
X-Gm-Message-State: AOAM5339wHtroGnOMTFDM4a4QicVUGVdkpJGiAssjZiXoPzKNxL5HEFW
        vTMddu1drD5Jz4MSyH3sgwgG7g==
X-Google-Smtp-Source: ABdhPJz7r5xZBOfByReNbNmN+wJFbb276iWLe5bA39oV+ikWetjEf06uCnPbDSA7ak1z9EzB+Nvgyw==
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr44159494edr.111.1620833460097;
        Wed, 12 May 2021 08:31:00 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id di7sm68216edb.34.2021.05.12.08.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 08:30:59 -0700 (PDT)
Date:   Wed, 12 May 2021 17:30:42 +0200
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        virtualization@lists.linux-foundation.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next] iommu/virtio: Add missing MODULE_DEVICE_TABLE
Message-ID: <YJv0osddxKqlFUyT@myrica>
References: <20210508031451.53493-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508031451.53493-1-cuibixuan@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 08, 2021 at 11:14:51AM +0800, Bixuan Cui wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>

Fixes: fa4afd78ea12 ("iommu/virtio: Build virtio-iommu as module")
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/virtio-iommu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index 7c02481a81b4..c6e5ee4d9cef 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -1136,6 +1136,7 @@ static struct virtio_device_id id_table[] = {
>  	{ VIRTIO_ID_IOMMU, VIRTIO_DEV_ANY_ID },
>  	{ 0 },
>  };
> +MODULE_DEVICE_TABLE(virtio, id_table);
>  
>  static struct virtio_driver virtio_iommu_drv = {
>  	.driver.name		= KBUILD_MODNAME,
> 
