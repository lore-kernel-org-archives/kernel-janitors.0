Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A88C433F5
	for <kernel-janitors@archiver.kernel.org>; Wed, 15 Dec 2021 11:58:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242250AbhLOL6w (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 15 Dec 2021 06:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242231AbhLOL6u (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 15 Dec 2021 06:58:50 -0500
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35255C061574
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Dec 2021 03:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=xorv+3pVspbDS0ZeYI0s5d0SoK4ERF0FnD42FTG8JyQ=; b=CKWuwoyvywIt/GQ2Wb5Ga2JylD
        NMFLH1biyfd79OdWgbcxphVfTmHRocUQqwDBdFEb1uOBm1hhfeRxIjk3OGSX8/Eyzx8iIHiS7943m
        gNcYL3stcBaZ8sGQFjJXvdhEooTB1aCVsbNHbohSB5qqdLQARs8McZM4lGuCwgbM+emOzC2JquPvf
        DrZl9NB2D3XYoa6zLD6VdLmyfmsrXPpCbjFuRHMCGQKC4NtViMz/g50E1dnp80LMEgrJOpFT4U27E
        5950eLEVEVhXZUYczIkzN1zz/jolCL5+p3ZMBcIAKciyQ2k91ZrrBCXxD86l35KDD4diWR0stkUOu
        7Zs+szNg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56302)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1mxSvi-0006KZ-VP; Wed, 15 Dec 2021 11:58:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1mxSvg-0004SH-Eq; Wed, 15 Dec 2021 11:58:40 +0000
Date:   Wed, 15 Dec 2021 11:58:40 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: phylink: use legacy_pre_march2020
Message-ID: <YbnYcFaMYR5AWr47@shell.armlinux.org.uk>
References: <20211215113539.GA14967@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215113539.GA14967@kili>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, Dec 15, 2021 at 02:35:39PM +0300, Dan Carpenter wrote:
> Hello Russell King (Oracle),
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 001f4261fe4d: "net: phylink: use legacy_pre_march2020" from 
> Dec 9, 2021, leads to the following Smatch complaint:
> 
>     drivers/net/phy/phylink.c:823 phylink_change_inband_advert()
>     error: we previously assumed 'pl->pcs_ops' could be null (see line 806)
> 
> drivers/net/phy/phylink.c
>    805	
>    806		if (!pl->pcs_ops && pl->config->legacy_pre_march2020) {
>                     ^^^^^^^^^^^^
> Should this be an ||?

No, the intention is correct, even though it looks a little weird.

We only call phylink_change_inband_advert() if we are in in-band mode,
and in-band mode for non-legacy users requires a PCS. Consequently, if
legacy_pre_march2020 is clear, we have no PCS, and we reach here, then
something is definitely broken.

There isn't an easy way to detect this condition earlier, but we could
do something like:

	if (WARN_ON(!pl->pcs_ops))
		return -EINVAL;

which should be sufficiently noisy for people to do something about.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
