Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26856C19F2A
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Aug 2022 16:26:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbiHDQ0a (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 4 Aug 2022 12:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236735AbiHDQ03 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 4 Aug 2022 12:26:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4CB867152
        for <kernel-janitors@vger.kernel.org>; Thu,  4 Aug 2022 09:26:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0208A481;
        Thu,  4 Aug 2022 18:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659630384;
        bh=lk0zj71snkJBEqFGyEjMR+pLpWZT/9z8Ei+uNiLzHSg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CIfqTTAoVpMf4gjGhk9eXeaEMUbwZXSAgoJIFjUVQvSG9FWdJv3d+ullST5gy9ntX
         51GduWW5UD8/IXlnszfjDI5Tz4acCGuSCSCQULiVvfR6D644E43BNJ5eomqJHs6Q2P
         OXLv48QqkoBigfcLYHceMOq8IEd6a6PfOW45zb+0=
Date:   Thu, 4 Aug 2022 19:26:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Suman Anna <s-anna@ti.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommu/omap: fix buffer overflow in debugfs
Message-ID: <YuvzKJM66k+ZPD9c@pendragon.ideasonboard.com>
References: <YuvYh1JbE3v+abd5@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YuvYh1JbE3v+abd5@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Thu, Aug 04, 2022 at 05:32:39PM +0300, Dan Carpenter wrote:
> There are two issues here:
> 
> 1) The "len" variable needs to be checked before the very first write.
>    Otherwise if omap2_iommu_dump_ctx() with "bytes" less than 32 it is a
>    buffer overflow.
> 2) The snprintf() function returns the number of bytes that *would* have
>    been copied if there were enough space.  But we want to know the
>    number of bytes which were *actually* copied so use scnprintf()
>    instead.
> 
> Fixes: bd4396f09a4a ("iommu/omap: Consolidate OMAP IOMMU modules")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iommu/omap-iommu-debug.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/omap-iommu-debug.c b/drivers/iommu/omap-iommu-debug.c
> index a99afb5d9011..259f65291d90 100644
> --- a/drivers/iommu/omap-iommu-debug.c
> +++ b/drivers/iommu/omap-iommu-debug.c
> @@ -32,12 +32,12 @@ static inline bool is_omap_iommu_detached(struct omap_iommu *obj)
>  		ssize_t bytes;						\
>  		const char *str = "%20s: %08x\n";			\
>  		const int maxcol = 32;					\
> -		bytes = snprintf(p, maxcol, str, __stringify(name),	\
> +		if (len < maxcol)					\
> +			goto out;					\
> +		bytes = scnprintf(p, maxcol, str, __stringify(name),	\
>  				 iommu_read_reg(obj, MMU_##name));	\
>  		p += bytes;						\
>  		len -= bytes;						\
> -		if (len < maxcol)					\
> -			goto out;					\
>  	} while (0)

This could would really benefit from being rewritten using a static
table of register name and offset and a loop that iterates over it.
Still, this is a valid bug fix, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  static ssize_t

-- 
Regards,

Laurent Pinchart
