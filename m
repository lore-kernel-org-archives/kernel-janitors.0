Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DA7BC77B73
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 May 2023 11:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242696AbjEZLvC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 26 May 2023 07:51:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243025AbjEZLvA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 26 May 2023 07:51:00 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBDE6E57;
        Fri, 26 May 2023 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=GVN+Py+HCNpAyiMZ3YRw5j54FCIO3Kg9KOooO7baA1I=; b=EGqVcNDaLNZxeJZFrjZw0QYiwN
        K6YBJXjSDVXSluLZytlUBBc0J12ySp8ynWdLcuA0xVE/oVoIV37mK8FzwMSy/dqqZ9ReY1+MDnqWg
        m04XCImEYq0i6Tap1FyKYicpqvn7wyDpqPQ6cVPkjuueMsGDgyw9o8DZfq5fdfSLQHrjFoiKbHKcv
        JTnyCDlnahD7ym56r13DVD2XGGpdg0ic4ZMaZqTdUGEVqNnYjW/4k/SkMyu0X0axV0486XcMDmpvw
        DVSOZRlXNOZvDI1VCfxtRUYDokQ2JbXxXDiqkv3UIJLJmDfgRFSX1wqCLOnzgPoFbsetAp1kcV1V+
        +uFAxsHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43008)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q2Vxp-0005Y6-MG; Fri, 26 May 2023 12:50:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q2Vxn-0003iB-Bw; Fri, 26 May 2023 12:50:31 +0100
Date:   Fri, 26 May 2023 12:50:31 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Oleksij Rempel <linux@rempel-privat.de>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <ZHCdB7upb9NIkUap@shell.armlinux.org.uk>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, May 26, 2023 at 02:45:54PM +0300, Dan Carpenter wrote:
> The "val" variable is used to store error codes from phy_read() so
> it needs to be signed for the error handling to work as expected.
> 
> Fixes: 014068dcb5b1 ("net: phy: genphy_loopback: add link speed configuration")

LGTM.

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
