Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A695EB64DA
	for <kernel-janitors@archiver.kernel.org>; Mon, 10 Jul 2023 09:27:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjGJJ1a (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 10 Jul 2023 05:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbjGJJ13 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 10 Jul 2023 05:27:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E770D12A
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 02:27:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A4DE60F07
        for <kernel-janitors@vger.kernel.org>; Mon, 10 Jul 2023 09:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24B0C433C8;
        Mon, 10 Jul 2023 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688981239;
        bh=xQNyVFBC31HkCbg/+SQYGUZhLM9dwcWPYmxf69oDP8M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VecK7Lek/Euqbbg2A15GsoEFrpymgNkEIJxBZHG8Pb1ltdGIP790hc+tCbdRYeIWk
         z38ERn2nQ4b+qOURPPFIH/tBvD0ekqKYWQMW4vF0qa5x1slIG6MirzMawcwE583Ddi
         peex8cW7iMoxzPEYvT5Ja4rbgK8Zd8e4WJTn9CyzUvgm8XOstNWORn+weGIpp5Ravj
         njfSesVSpVyDV5buGaxRtmB1i6dKQ3NUHlZOFN3YLtPvPK/lYtyve9AQ7v+g1qKUR/
         nbRkkAM6pxjeTDe1tI877rnoFdcdCIFWpG799hmqT9wJItK2+pdmZjOW2HAGqiu1/V
         MKOyQlPrYWl4w==
Date:   Mon, 10 Jul 2023 10:27:14 +0100
From:   Will Deacon <will@kernel.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Dan Carpenter <error27@gmail.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, iommu@lists.linux.dev,
        kernel-janitors@vger.kernel.org, joro@8bytes.org
Subject: Re: [PATCH] iommu/sva: fix signedness bug in iommu_sva_alloc_pasid()
Message-ID: <20230710092713.GA32673@willie-the-truck>
References: <6b32095d-7491-4ebb-a850-12e96209eaaf@kili.mountain>
 <5e474464-34ee-414a-8eb3-b11e74540b14@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e474464-34ee-414a-8eb3-b11e74540b14@kadam.mountain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Jul 07, 2023 at 10:17:23AM +0300, Dan Carpenter wrote:
> Ping!

Ah, Joerg isn't on CC. Fixing that now...

Will

> On Thu, Apr 06, 2023 at 11:55:31AM +0300, Dan Carpenter wrote:
> > The ida_alloc_range() function returns negative error codes on error.
> > On success it returns values in the min to max range (inclusive).  It
> > never returns more then INT_MAX even if "max" is higher.  It never
> > returns values in the 0 to (min - 1) range.
> > 
> > The bug is that "min" is an unsigned int so negative error codes will
> > be promoted to high positive values errors treated as success.
> > 
> > Fixes: 1a14bf0fc7ed ("iommu/sva: Use GFP_KERNEL for pasid allocation")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >  drivers/iommu/iommu-sva.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/iommu-sva.c b/drivers/iommu/iommu-sva.c
> > index c4ab3c457fbc..6e4f1ba1c148 100644
> > --- a/drivers/iommu/iommu-sva.c
> > +++ b/drivers/iommu/iommu-sva.c
> > @@ -33,8 +33,9 @@ static int iommu_sva_alloc_pasid(struct mm_struct *mm, ioasid_t min, ioasid_t ma
> >  	}
> >  
> >  	ret = ida_alloc_range(&iommu_global_pasid_ida, min, max, GFP_KERNEL);
> > -	if (ret < min)
> > +	if (ret < 0)
> >  		goto out;
> > +
> >  	mm->pasid = ret;
> >  	ret = 0;
> >  out:
> > -- 
> > 2.39.1
