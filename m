Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE11C38A2D
	for <kernel-janitors@archiver.kernel.org>; Mon, 24 Oct 2022 22:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbiJXWSP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 24 Oct 2022 18:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230292AbiJXWRw (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 24 Oct 2022 18:17:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D4B2248D3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Oct 2022 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666643626;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jS77JQI+Wqma8EkspvaV6jJPvhgOIi/g9VzirTrOEUM=;
        b=RMGDuEbkJU63NNlkHvdMovl4lcX1w6+fIy1zw8kHUE4SJhXQ3h6PZoK5nj3XTdzk1R4mIy
        MIrhTYYtYjptknuO9fIMwHRpucVmWsAs+QcivIpktgeMroewy3pozij4iCG86ESf4DejTH
        4tp/CkRQsug0K3LhVR/chsmjveYEc+c=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-AeLHMkWvNRWEap6aChH1FQ-1; Mon, 24 Oct 2022 16:33:45 -0400
X-MC-Unique: AeLHMkWvNRWEap6aChH1FQ-1
Received: by mail-qt1-f197.google.com with SMTP id b12-20020a05622a020c00b003983950639bso7759075qtx.16
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Oct 2022 13:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS77JQI+Wqma8EkspvaV6jJPvhgOIi/g9VzirTrOEUM=;
        b=b6rAIAyOdfLg5j3A1hneBVxkU1d0JmwYgYrzjOZWCFNV8gOrnhNPvMEzeHemh23Y8b
         2hluAzcdHYyARNY6rtAnzNYGfsRSdexYjVJshe0+9Hxl3WLDpmtQtE1GVKu4nE+e2485
         r0TyeQ/Oj/zKmcdr9iKHo5ahgH4u0brU3CmRqUL9gEQg8d0PIIq9bQdIvb7kAEskODC3
         ca0NMA1mxVaRofZwiMtvvMMnep0OCGH7DUheFd1vY5jZP8LWg+gMp6rj2IjUKTX5JcTb
         H3IgUW1owskeKtM7IpKI4D87jUqHlR/QwJRVCMm7vqGfbj345+BQ7Phw26wiejIgGu4H
         H0bg==
X-Gm-Message-State: ACrzQf21Nd479w/iX3Q6GwFo1jfuwpqZkcFXUOSLESZnUvF7KkG5cnRE
        EiXIcm8uCkTFm4rDQeZ9RwmtnC8EnlegqmooUAzqhJsz2iDL0aIIiiQbDb6IKt9Hw8Ts6GhkWfM
        l5kI1PDk3Ha9HzlIB/zKJ1fgZAPsl
X-Received: by 2002:a05:620a:4155:b0:6ee:e6b5:efa7 with SMTP id k21-20020a05620a415500b006eee6b5efa7mr24649747qko.54.1666643624562;
        Mon, 24 Oct 2022 13:33:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fuJ7umxduSwho5wT/1DHDzI+eD1fRK9Z2IMS9esLQ5xAyDielh1+K8ovaXy8gI3DuPHXL2w==
X-Received: by 2002:a05:620a:4155:b0:6ee:e6b5:efa7 with SMTP id k21-20020a05620a415500b006eee6b5efa7mr24649730qko.54.1666643624349;
        Mon, 24 Oct 2022 13:33:44 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id y21-20020a05620a44d500b006eed75805a2sm616099qkp.126.2022.10.24.13.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:33:43 -0700 (PDT)
Date:   Mon, 24 Oct 2022 13:33:42 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: remove variable cnt
Message-ID: <20221024203342.nbmqphmfbrqqtr4n@cantor>
References: <20221024134301.2158939-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024134301.2158939-1-colin.i.king@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 24, 2022 at 02:43:01PM +0100, Colin Ian King wrote:
> Variable cnt is just being incremented and it's never used
> anywhere else. The variable and the increment are redundant so
> remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/iommu/amd/iommu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index d3b39d0416fa..3847f3bdc568 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -767,7 +767,7 @@ EXPORT_SYMBOL(amd_iommu_register_ga_log_notifier);
>  
>  static void iommu_poll_ga_log(struct amd_iommu *iommu)
>  {
> -	u32 head, tail, cnt = 0;
> +	u32 head, tail;
>  
>  	if (iommu->ga_log == NULL)
>  		return;
> @@ -780,7 +780,6 @@ static void iommu_poll_ga_log(struct amd_iommu *iommu)
>  		u64 log_entry;
>  
>  		raw = (u64 *)(iommu->ga_log + head);
> -		cnt++;
>  
>  		/* Avoid memcpy function-call overhead */
>  		log_entry = *raw;
> -- 
> 2.37.3
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

