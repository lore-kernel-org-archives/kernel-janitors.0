Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B66C77B7A
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 20:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbjE3UFU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 16:05:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbjE3UFI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 16:05:08 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D09F102;
        Tue, 30 May 2023 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=df4TGBctqwq7SvhXB8Ixf63L0CvpksALSarocytg7zk=; b=ezdh1nSbrVvLmWdjCqMGaDaWBB
        JwFpliggoNjSMwqqipWAOpjih9h2hbDriTuc6OFzIJMxCUkNT+4qi7fqRrATUNX+K1SKz3HGfJ6b1
        pAlHYCS1s9S5+t4aCJ5L0fnm/U/q8bW+E88Nm3hke/zcjB6XBySyPJYeV4RFPayoaCjQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1q45aO-00ENhz-K7; Tue, 30 May 2023 22:04:52 +0200
Date:   Tue, 30 May 2023 22:04:52 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <0851bc91-6a7c-4333-ad8a-3a18083411e3@lunn.ch>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
 <20230529215802.70710036@kernel.org>
 <90b1107b-7ea0-4d8f-ad88-ec14fd149582@lunn.ch>
 <20230530121910.05b9f837@kernel.org>
 <ZHZQ+1KNGB7KYZGi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHZQ+1KNGB7KYZGi@shell.armlinux.org.uk>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> > This is what I meant FWIW:
> > 
> > diff --git a/include/linux/phy.h b/include/linux/phy.h
> > index 7addde5d14c0..829bd57b8794 100644
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -1206,10 +1206,13 @@ static inline int phy_read(struct phy_device *phydev, u32 regnum)
> >  #define phy_read_poll_timeout(phydev, regnum, val, cond, sleep_us, \
> >  				timeout_us, sleep_before_read) \
> >  ({ \
> > -	int __ret = read_poll_timeout(phy_read, val, val < 0 || (cond), \
> > +	int __ret, __val;						\
> > +									\
> > +	__ret = read_poll_timeout(phy_read, __val, __val < 0 || (cond),	\
> >  		sleep_us, timeout_us, sleep_before_read, phydev, regnum); \
> > -	if (val < 0) \
> > -		__ret = val; \
> > +	val = __val;

This results in the sign being discarded if val is unsigned. Yes, the
test is remove, which i assume will stop Smatch complaining, but it is
still broken.

> > +	if (__val < 0) \
> > +		__ret = __val; \
> >  	if (__ret) \
> >  		phydev_err(phydev, "%s failed: %d\n", __func__, __ret); \
> >  	__ret; \

> > I tried enabling -Wtype-limits but it's _very_ noisy :(

This is a no go until GENMASK gets fixed :-(

However, if that is fixed, we might be able to turn it on. But it will
then trigger with this fix.

So i still think a BUILD_BUG_ON is a better fix. Help developers get
the code correct, rather than work around them getting it wrong.

I also wonder if this needs to go down a level. Dan, how often do you
see similar problems with the lower level read_poll_timeout() and
friends?

    Andrew
