Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CDAC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 08:15:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A877F61BE2
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 Nov 2021 08:15:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbhKQISA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 Nov 2021 03:18:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:58272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhKQIR7 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 Nov 2021 03:17:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0FD761502;
        Wed, 17 Nov 2021 08:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637136901;
        bh=PXTgqQ7QKV2K5+fItm8dleHtPJmP0MwuaD+Q0evQQK0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MMh3FPtt+1l1xnTHEdgLIgNlTMBVg360Yr/Vxrv02xUrgmVGliQHFypxgynoXbH1+
         tX1H34k95VdOlRcmmkU+X7eSjN+rG/X0ilyiNhbUxStY0MCoZbSDhxiwcIAxEt5O65
         UPY/sYT6x8R98vuOZnyiwe4SvxGVX+Ng5cweAzyVZ6oD6N9PP3V/c8vp6KLDW1cXMV
         zSROYnrTEl00VK5eEQ8+fLZvgg5tci3OZ4mC6hWNT/g6/1q4gtotpQYDNBrc+5jUNO
         zy+AV+DDOzRh7kIA4Z5MZxk7dq/4y4gO7YRUAPP7RSsf2JbPdi+Yy9CwsnXMNUoKZC
         PR5FRucGrU2oQ==
Date:   Wed, 17 Nov 2021 08:14:56 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: HiSilicon: Fix copy and paste bug in error
 handling
Message-ID: <20211117081456.001af8b3@sal.lan>
In-Reply-To: <20211117074843.GE5237@kili>
References: <20211117074843.GE5237@kili>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Em Wed, 17 Nov 2021 10:48:43 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> This should check ">pmctrl" instead of "->sysctrl".  This bug could
> potentially lead to a crash if we dereference the error pointer.
> 
> Fixes: 73075011ffff ("phy: HiSilicon: Add driver for Kirin 970 PCIe PHY")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/phy/hisilicon/phy-hi3670-pcie.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/hisilicon/phy-hi3670-pcie.c b/drivers/phy/hisilicon/phy-hi3670-pcie.c
> index c64c6679b1b9..0ac9634b398d 100644
> --- a/drivers/phy/hisilicon/phy-hi3670-pcie.c
> +++ b/drivers/phy/hisilicon/phy-hi3670-pcie.c
> @@ -757,8 +757,8 @@ static int hi3670_pcie_phy_get_resources(struct hi3670_pcie_phy *phy,
>  		return PTR_ERR(phy->sysctrl);
>  
>  	phy->pmctrl = syscon_regmap_lookup_by_compatible("hisilicon,hi3670-pmctrl");
> -	if (IS_ERR(phy->sysctrl))
> -		return PTR_ERR(phy->sysctrl);
> +	if (IS_ERR(phy->pmctrl))
> +		return PTR_ERR(phy->pmctrl);
>  
>  	/* clocks */
>  	phy->phy_ref_clk = devm_clk_get(dev, "phy_ref");
