Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B88C0C77B73
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 12:41:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232155AbjE3Mlp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 08:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232133AbjE3Mlh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 08:41:37 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48177E56;
        Tue, 30 May 2023 05:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=xFAjVPiZFt0cfsfW4euVq2yxKK+4k3xHYSHyCDA1Y04=; b=2kJn87YqP/R2SlePmpeEV3zW5d
        4AU/kpWd1WruduBYsQus4+ui0U3wIpyOBW1N30YkSg+J7kuoaMIGKREBCewfQR7+YrJ4UJ8ln53FJ
        BCCQkHCIjar5LYWdu0FKLs3I2lh46jcvWW3vmNeyjG4aXvvxNy3c4ixwJJgOHAwaHarQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q3ydl-00EK8L-Vn; Tue, 30 May 2023 14:39:53 +0200
Date:   Tue, 30 May 2023 14:39:53 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <90b1107b-7ea0-4d8f-ad88-ec14fd149582@lunn.ch>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
 <20230529215802.70710036@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529215802.70710036@kernel.org>
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
> and more people may make the same mistake.

It is common to get this wrong in general with PHY drivers. Dan
regularly posts fixes like this soon after a PHY driver patch it
merged. I really wish we could somehow get the compiler to warn when
the result from phy_read() is stored into a unsigned type. It would
save Dan a lot of work.

> Therefore we should try to fix phy_read_poll_timeout() instead to
> use a local variable like it does for __ret.

The problem with that is val is supposed to be available to the
caller. I don't know if it is every actually used, but if it is, using
an internal signed variable and then throwing away the sign bit on
return is going to result in similar bugs.
 
> Weaker version would be to add a compile time check to ensure val 
> is signed (assert(typeof(val)~0ULL < 0) or such?).

I think the BUILD BUG is a better solution, since it catches all
problems. And at developer compile time, rather than at Dan runs his
static checker time.

	Andrew
