Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEBFC77B7A
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 09:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbjE3Jtc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 05:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbjE3Jtb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 05:49:31 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45A02F3;
        Tue, 30 May 2023 02:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qedlxlF/2pxUXBIt9Ka6WCq07QVwsFm1RIbysYpCq7U=; b=x8sT8ilagFwfLtGuUvVEfEQoV1
        VyZ4qDeLRKtI/hNCRX8hAUL7DWUAFvGdGvUXgsovRPd1ZYpKt+C41lFFmaFNoNxwKvjg8WNNZKpFh
        tYLa2iORXr4t7ZyXHJ3KTpnvARrOi0RZQrcM9BXATBHeobIQsmf1s1SkuT4OgIqaz/dNsuoFvA3tt
        mYQF4CSAXkOmCk55C0DfEO2pXpux10JsLvdIOGtziJO5SuT5BrPXnV34s1wO6EYkLZ75DOE5de1fT
        pkGqu/b56bK5kDguhQ+hZwcVmsZTyd/ZugMuUFnKdAMpAf3DlltxS3ofei/YBrmtaVMOYFBPpkwzk
        n1gs1Uew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38154)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q3vyl-0002N5-Rq; Tue, 30 May 2023 10:49:23 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q3vyj-0007vP-Va; Tue, 30 May 2023 10:49:21 +0100
Date:   Tue, 30 May 2023 10:49:21 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <ZHXGoaXX2YhqP2lm@shell.armlinux.org.uk>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
 <20230529215802.70710036@kernel.org>
 <c7a1ee2dea22cd9665c0273117fe39eebc72e662.camel@redhat.com>
 <813008f6-cb26-4666-81ca-6f88c04bba07@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <813008f6-cb26-4666-81ca-6f88c04bba07@kili.mountain>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, May 30, 2023 at 12:23:32PM +0300, Dan Carpenter wrote:
> I don't see an issue in r8169_main.c and in drivers/net/phy/phy_device.c
> then I only find the bug from this patch.

I agree - inspecting the code reveals that "val" would be of type "int".

> +	BUILD_BUG_ON((typeof(val))~0ULL > 0);				\

I've just thrown this in to my builds, and building for arm64 using
debian stable's gcc, I don't see any errors with genphy_loopback()
suitably hacked, even with r8169 included in the build.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
