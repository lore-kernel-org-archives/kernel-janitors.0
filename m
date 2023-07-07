Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96123EB64DA
	for <kernel-janitors@archiver.kernel.org>; Fri,  7 Jul 2023 07:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjGGHRd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 7 Jul 2023 03:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjGGHRc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 7 Jul 2023 03:17:32 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F6D1FCE
        for <kernel-janitors@vger.kernel.org>; Fri,  7 Jul 2023 00:17:30 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31441bc0092so1463028f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jul 2023 00:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688714249; x=1691306249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cpiunWH0TGWOiDXNc+28X9o/pnnF1RJUOQGrH8xZP3Y=;
        b=NdXzzH6heIdj9gyk+DA+JgVniBoWYUzhU9TzlHI0wvj5X7NrSIfTwZ+eaTuASySwye
         g4SD7s8KURAdKXuc0TY9vlgHUS+gx1NkWBsz9KP6z8eMirbLn9r4bRTw84vmDLYACuQs
         z3eKV3qBQa5ynVNjE3zOVp4MSfhGJvyUyodm9xKVctm9YYLxkqxcJjtzBMJXzdga+znN
         b3w1VBbs4c5UvpjYpte6msYz7GNyLP/MVTdGyJ9kA+e00sE3XohUk+l4I2DNYuZFjhwX
         hM1xd+5RU4n1hx0hNhORTSWFXVls7w5oNCx+PRWZrJHrkOF8LBkxKQddQjw2Oahh4Ddt
         HAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688714249; x=1691306249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpiunWH0TGWOiDXNc+28X9o/pnnF1RJUOQGrH8xZP3Y=;
        b=EQT9+IjVLBQ+60GOQP8cR0XBZh8cHzsnB2xkG7eQ5e9RV3eOYfqWksaaLa9QjMfeoc
         oXZwajCwCjoeWyIZu34oX0pDp8+vq5i0+hUELEz0EOTl5aSYWEtMVaf7ofbti3sTo6H4
         OCDLk9FQfYLrCeFQQ9uxH65A6oukNWvvbPdX1KROz4lWg2SYL2mXwQq9nQk+WTbysdHr
         LVxrHHoW2iR5rTVJITa9avKPdp2CrAoSKcnD5R1AXKzxNHbOgs/0vbP4X5oN1Pt9sMc/
         CEDps2tq3P/0wNs7TtDEZagps+ipkSNjdXIEwrtNLof4WQu8Jw0eQNODywCWi1LR7Z3C
         NFrQ==
X-Gm-Message-State: ABy/qLawIFCDDGD8480OogTnXkbJYPPtzroLqlRgbz+3TgrLa7scjN+n
        93nDDPpANwMfDCmRTCKFpSDuVw==
X-Google-Smtp-Source: APBJJlHkni5uAtR65zxArYeN/0LK3zJBSDsUEDED74EZFi2KX7f4yl+A4hv8S3q/jiBH0vu6KAFijA==
X-Received: by 2002:a5d:4809:0:b0:314:3ad6:2327 with SMTP id l9-20020a5d4809000000b003143ad62327mr3061651wrq.12.1688714249152;
        Fri, 07 Jul 2023 00:17:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g14-20020a5d554e000000b003143cdc5949sm3743300wrw.9.2023.07.07.00.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 00:17:26 -0700 (PDT)
Date:   Fri, 7 Jul 2023 10:17:23 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/sva: fix signedness bug in iommu_sva_alloc_pasid()
Message-ID: <5e474464-34ee-414a-8eb3-b11e74540b14@kadam.mountain>
References: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Ping!

regards,
dan carpenter

On Thu, Apr 06, 2023 at 11:55:31AM +0300, Dan Carpenter wrote:
> The ida_alloc_range() function returns negative error codes on error.
> On success it returns values in the min to max range (inclusive).  It
> never returns more then INT_MAX even if "max" is higher.  It never
> returns values in the 0 to (min - 1) range.
> 
> The bug is that "min" is an unsigned int so negative error codes will
> be promoted to high positive values errors treated as success.
> 
> Fixes: 1a14bf0fc7ed ("iommu/sva: Use GFP_KERNEL for pasid allocation")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
>  drivers/iommu/iommu-sva.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
> index c4ab3c457fbc..6e4f1ba1c148 100644
> --- a/drivers/iommu/iommu-sva.c
> +++ b/drivers/iommu/iommu-sva.c
> @@ -33,8 +33,9 @@ static int iommu_sva_alloc_pasid(struct mm_struct *mm, ioasid_t min, ioasid_t ma
>  	}
>  
>  	ret = ida_alloc_range(&iommu_global_pasid_ida, min, max, GFP_KERNEL);
> -	if (ret < min)
> +	if (ret < 0)
>  		goto out;
> +
>  	mm->pasid = ret;
>  	ret = 0;
>  out:
> -- 
> 2.39.1
