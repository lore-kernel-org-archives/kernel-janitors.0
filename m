Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B70FC433FE
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Nov 2022 13:22:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232718AbiKONWk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Nov 2022 08:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230123AbiKONWj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Nov 2022 08:22:39 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E84FDEC6
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:22:38 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id a27so8640219qtw.10
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Nov 2022 05:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh8kCd+TI/xMEHQ4yRh0KMNGAg8os9nKv0lKY/zh0Go=;
        b=LVZKY8SfY9u6FcTa9AD6FwFlVb/vZp2aVm4cbxICKH7kGpqhTxBSXHiwM7qAKvGpLh
         xN4aPKGNLPzRlvSnd2EUFrpip10r9/Q0aRRlyZsKLi5lykehd1uk/INit1NnAeCAqpwg
         I1xHTItK5QlilorDD0tu9a6PLz0bsDW2dt66QQd6qKFByK2VXY/zirFvHK2FuV6RWci/
         kSeski+7K5DoBpqI3eJZ9wwj8xPAWCXfLNc6wqfYpvwS/jP+v0GQbT2tKO7uxCM4m6Lj
         14fv+0mx4Ou+ZyF4MQ3HBOV+L7aaHFh2e2myIzi1l5pOAMy4mw4Bl0xTpB1yUAKRDFwv
         eGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh8kCd+TI/xMEHQ4yRh0KMNGAg8os9nKv0lKY/zh0Go=;
        b=dJDlownYOAj77tlWaVKFbdTpqF3SH4Aqm5lQJ7ppMp24bhY/GxueQDVbw2XAyFtFWm
         vmcDSZx8ULHoRV4zyHKf1014RT8WN2lMllXwy3Ihkd8n71XC5GRsrd5gWgn0nF+noyXt
         aW847t80qX56v2FktKYdSd+gNSMuXT7RUrWGFcmVrtu1LPA7j2b6C41m4cyq4zBPXMjJ
         0HvUjlgsvyj/b/mzs5czAudjRLN9jW9OJD7Hd7ZP7iBA+cJZ/QSeace+oLb6HkwQdQdm
         ylm3nmkP/FzGpO07v2VI7O7z4dMMN1bGG+ZId+bHm4SKSYyfiKBQUF9uEpNToeIdTExT
         hToQ==
X-Gm-Message-State: ANoB5plIbgsuixifCOCte5xgk3WDsK8osJd1lhvxmGnQJBQ68X5nrQCN
        cPNaZZfjbFA6nBB+BsaDWUpv3w==
X-Google-Smtp-Source: AA0mqf4gFHMBOCd+hxMH99i63M4A4Zz5W56sVQvjZOTc2gLX9kTF10IvIhipJtAr6YKEO2g7ttTAtw==
X-Received: by 2002:ac8:44c4:0:b0:3a5:8b71:cca3 with SMTP id b4-20020ac844c4000000b003a58b71cca3mr16457992qto.292.1668518557368;
        Tue, 15 Nov 2022 05:22:37 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.122.23])
        by smtp.gmail.com with ESMTPSA id i19-20020a05620a249300b006fb38ff190bsm8047711qkn.34.2022.11.15.05.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:22:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1ouvtb-003s6G-OY;
        Tue, 15 Nov 2022 09:22:35 -0400
Date:   Tue, 15 Nov 2022 09:22:35 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] iommufd: vfio: info leak in iommufd_vfio_unmap_dma()
Message-ID: <Y3OSm9dmaQJkjL6D@ziepe.ca>
References: <Y3OKdW/WXVr1VYbc@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3OKdW/WXVr1VYbc@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Nov 15, 2022 at 03:47:49PM +0300, Dan Carpenter wrote:
> If iopt_unmap_iova() fails then "unmapped" is uninitialized.  Copying it
> to the user can leak stack information.
> 
> Fixes: 32c328dc9b73 ("iommufd: vfio container FD ioctl compatibility")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/iommu/iommufd/vfio_compat.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/iommu/iommufd/vfio_compat.c b/drivers/iommu/iommufd/vfio_compat.c
> index 976aa12b247d..30a13552d632 100644
> --- a/drivers/iommu/iommufd/vfio_compat.c
> +++ b/drivers/iommu/iommufd/vfio_compat.c
> @@ -189,6 +189,9 @@ static int iommufd_vfio_unmap_dma(struct iommufd_ctx *ictx, unsigned int cmd,
>  		rc = iopt_unmap_iova(&ioas->iopt, unmap.iova, unmap.size,
>  				     &unmapped);
>  	}
> +	if (rc)
> +		goto err_put;
> +

It should be inited to 0, I fixed it, thanks

Jason
