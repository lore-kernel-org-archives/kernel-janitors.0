Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83855C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Jun 2021 09:51:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FBDE6142B
	for <kernel-janitors@archiver.kernel.org>; Fri, 25 Jun 2021 09:51:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhFYJxd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 25 Jun 2021 05:53:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:39686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231416AbhFYJxb (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 25 Jun 2021 05:53:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A43B961423;
        Fri, 25 Jun 2021 09:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624614671;
        bh=2W0lvZfpLXORUkM2ExWV3NULyHOTnGAdTs9RY07P/Zw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KN31sqIw5r5LlLnrZQl2eM4nRZoEu2uwdLl0iu4Z3mEiGLQLZMdHiPEphTt+MoCV/
         n3x2oiIVN7iwTX5VzSXEBGHzhkGDBv1p/UdL0OAsH5f3ZCAoYLRNMi0XpHEn/w/xOV
         KIi3HqllKRRejlXFc1zCl9QaK0X0rWUCztYUXSM3xkdXs4ab3HhDm4pBvwnjxvgVaK
         iMtt28zi6QgyDdCCzpoG2T7EcLmsYOGQ1mLrv6dVfY8dtd1Ju+0LxWALjJFXYWC1gS
         sS95QvFYS3Dzy9ailnPmdfPb2tRYN4BbbpUkp9pokfVdYjpMu7ZtxC285tFOBc91Y0
         ddQxsflbSS3ng==
Date:   Fri, 25 Jun 2021 15:20:41 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tudor Ambarus <tudor.ambarus@microchip.com>,
        linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <20210625095041.GA4299@thinkpad>
References: <YMtQFXE0F1w7mUh+@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMtQFXE0F1w7mUh+@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Jun 17, 2021 at 04:37:25PM +0300, Dan Carpenter wrote:
> Check for whether of_property_count_elems_of_size() returns a negative
> error code.
> 
> Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/mtd/nand/raw/nand_base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 57a583149cc0..cbba46432e39 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5231,8 +5231,8 @@ static int of_get_nand_secure_regions(struct nand_chip *chip)
>  	int nr_elem, i, j;
>  
>  	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
> -	if (!nr_elem)
> -		return 0;
> +	if (nr_elem <= 0)
> +		return nr_elem;
>  
>  	chip->nr_secure_regions = nr_elem / 2;
>  	chip->secure_regions = kcalloc(chip->nr_secure_regions, sizeof(*chip->secure_regions),
> -- 
> 2.30.2
> 
