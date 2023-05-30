Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9BDC77B73
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 09:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbjE3JB3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 05:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjE3JB2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 05:01:28 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FB4D9;
        Tue, 30 May 2023 02:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0Ie8pAb6WAWCpGZTtV0SFjhCQF24hzBgUc0GiF92WMA=; b=yOYl1dtXE026ClRKhg+G1dLR2c
        3DaUshOtvH6qy6QX2byxdSCO83PQ4aVKcWCA2dtZQRnfaShHB4GWiAIHROFrZB193jfHY+ofOPxUb
        A6tliH+tfPOYe6JWUGrSqBgBAnu1Fu9iqZN65tbF1qnSrxAHWQTSd1Eep7m20MF4I7A9oEM9YDWbe
        MrZp4f9myoqI+5WFOrG8z9QBCe90WmcdniIe0lSlGDCdPksGUA1trRibsHVpA3i7TeNdj3Qs/UsDL
        t9tMveI2x9dsALf6rD+kb5zKHnr27ySx7al6UCPDtRtNZ0rCUPFaQmrLmTxOu8dG6DgZC8k66v9Zg
        1lw/JSZg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40228)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q3vEB-0002GA-3E; Tue, 30 May 2023 10:01:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q3vE8-0007sq-D5; Tue, 30 May 2023 10:01:12 +0100
Date:   Tue, 30 May 2023 10:01:12 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <ZHW7WPr1Ym2d8Hcc@shell.armlinux.org.uk>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
 <20230529215802.70710036@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529215802.70710036@kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, May 29, 2023 at 09:58:02PM -0700, Jakub Kicinski wrote:
> On Fri, 26 May 2023 14:45:54 +0300 Dan Carpenter wrote:
> > The "val" variable is used to store error codes from phy_read() so
> > it needs to be signed for the error handling to work as expected.
> > 
> > Fixes: 014068dcb5b1 ("net: phy: genphy_loopback: add link speed configuration")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Is it going to be obvious to PHY-savvy folks that the val passed to
> phy_read_poll_timeout() must be an int? Is it a very common pattern?
> My outsider intuition is that since regs are 16b, u16 is reasonable,
> and more people may make the same mistake. Therefore we should try to
> fix phy_read_poll_timeout() instead to use a local variable like it
> does for __ret. 
> 
> Weaker version would be to add a compile time check to ensure val 
> is signed (assert(typeof(val)~0ULL < 0) or such?).
> 
> Opinions?

Yes, I think that would be a saner approach, since
phy_read_poll_timeout() returns the error value, rather than using
the variable passed in. Andrew?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
