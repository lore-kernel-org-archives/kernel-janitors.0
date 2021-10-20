Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9C6C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 20 Oct 2021 17:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5A9960F9F
	for <kernel-janitors@archiver.kernel.org>; Wed, 20 Oct 2021 17:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhJTR3y (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 20 Oct 2021 13:29:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:33320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230031AbhJTR3v (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Oct 2021 13:29:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 078E360F9F;
        Wed, 20 Oct 2021 17:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634750857;
        bh=tyQDeymI59Y8MZ5eBC3Ad/9unrJV3Xk5ZkBbMyhhpMY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jmEwPqivbWiqRPgwabXQE9M4rlYkApDKdrJyzOpn0tYGhFt1w4gCs18Cdh3mPb/E+
         sqjRRL6MA3KykefzXR4ceq61SgELnhd+KEm40UpFuubFs6UN1d+/1wKlCmKJ77EYhW
         0ZMXmNubwhg9lqk96AEj0utvopTL0IuMJBzyO14fldVk8fJI02IY2Bdjof0TeibmJX
         6KwmfGVvSAB2ZF5WZ9eysWjUYWqLupYWM0hXVKfAzFGblvpKG9VfCxl3s8wMA+dFpe
         8yeQA5YgVVVNxqqM/G2jR+eqS3sNyeJQuu7Rg0p+8DT523FIPsUJN7EA7CnsnLA4uE
         lPcHWDDlKXBGw==
Date:   Wed, 20 Oct 2021 22:57:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] phy: ti: gmii-sel: check of_get_address() for failure
Message-ID: <YXBRhOmXRQJDdJoW@matsya>
References: <20210914110038.GB11657@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210914110038.GB11657@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 14-09-21, 14:00, Dan Carpenter wrote:
> Smatch complains that if of_get_address() returns NULL, then "size"
> isn't initialized.  Also it would lead to an Oops.

Applied, thanks

> 
> Fixes: 7f78322cdd67 ("phy: ti: gmii-sel: retrieve ports number and base offset from dt")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/phy/ti/phy-gmii-sel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
> index 5fd2e8a08bfc..d0ab69750c6b 100644
> --- a/drivers/phy/ti/phy-gmii-sel.c
> +++ b/drivers/phy/ti/phy-gmii-sel.c
> @@ -320,6 +320,8 @@ static int phy_gmii_sel_init_ports(struct phy_gmii_sel_priv *priv)
>  		u64 size;
>  
>  		offset = of_get_address(dev->of_node, 0, &size, NULL);
> +		if (!offset)
> +			return -EINVAL;
>  		priv->num_ports = size / sizeof(u32);
>  		if (!priv->num_ports)
>  			return -EINVAL;
> -- 
> 2.20.1

-- 
~Vinod
