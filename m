Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCAAC7EE23
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 19:19:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjE3TTR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 15:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjE3TTO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 15:19:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C74F7
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 12:19:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9316360B3E
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 19:19:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A262C4339B;
        Tue, 30 May 2023 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685474352;
        bh=R6w2+9/HJXzIVT6gK1SP50kCoHqhdOmDBY44XdayTSw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=leyw6ff5Oads9DwEIlHSXtFnEJMewekWzS4/ptEriOhIMjUkkef/mHPOMauJFRStS
         PvJAR95RynRph6tEY5RMJwhkBFKdzr8YSWe5Z6IgHgtqYxzJyzKAnJf+1+LCAT8eYd
         G6wznzwMNHQ/vdNo1uKOGwSixCnc27QHC/NieSFapb6t/hVNb+Yd32S/kFWADCfPn/
         Zr+TZrDEj5iIelJR/LRLg5PKYa7xVP2lbeO0EEwOAXl/CMHUijvXpUq/K3jijjdiJO
         Zeb6MFc+eUdirwI7J3VWCyb7oM1VsO/UQws8zgo3thlPeHld/7mCOF+rvhfil1XF5q
         ugFb2XVvCYENA==
Date:   Tue, 30 May 2023 12:19:10 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     Russell King <linux@armlinux.org.uk>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <20230530121910.05b9f837@kernel.org>
In-Reply-To: <90b1107b-7ea0-4d8f-ad88-ec14fd149582@lunn.ch>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
        <20230529215802.70710036@kernel.org>
        <90b1107b-7ea0-4d8f-ad88-ec14fd149582@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, 30 May 2023 14:39:53 +0200 Andrew Lunn wrote:
> > Therefore we should try to fix phy_read_poll_timeout() instead to
> > use a local variable like it does for __ret.  
> 
> The problem with that is val is supposed to be available to the
> caller. I don't know if it is every actually used, but if it is, using
> an internal signed variable and then throwing away the sign bit on
> return is going to result in similar bugs.

This is what I meant FWIW:

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 7addde5d14c0..829bd57b8794 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1206,10 +1206,13 @@ static inline int phy_read(struct phy_device *phydev, u32 regnum)
 #define phy_read_poll_timeout(phydev, regnum, val, cond, sleep_us, \
 				timeout_us, sleep_before_read) \
 ({ \
-	int __ret = read_poll_timeout(phy_read, val, val < 0 || (cond), \
+	int __ret, __val;						\
+									\
+	__ret = read_poll_timeout(phy_read, __val, __val < 0 || (cond),	\
 		sleep_us, timeout_us, sleep_before_read, phydev, regnum); \
-	if (val < 0) \
-		__ret = val; \
+	val = __val;
+	if (__val < 0) \
+		__ret = __val; \
 	if (__ret) \
 		phydev_err(phydev, "%s failed: %d\n", __func__, __ret); \
 	__ret; \


I tried enabling -Wtype-limits but it's _very_ noisy :(
