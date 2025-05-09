Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FC115D1
	for <kernel-janitors@vger.kernel.org>; Fri,  9 May 2025 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746794601; cv=none; b=uU+JXA18HQbILhXHFm3H8+CBZAK1a9v5gea8GkGQZgCpIq5r/s2WrGCYLV96MHikefGNZ6qI3CqjUWJaUaUQc0pyD2uv0RSULxKYKWCJ45Dv7OpkGsVtysqfQpPB/4/BH0/68gpW+Vzc4Nv439YzNWWI9SHXfW9Tex9NKCRNfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746794601; c=relaxed/simple;
	bh=ZwcMaNJgRttZv6AxrEYIruQbqbKiMZKWwCcDWopDWY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s88FokBW+vSm9d7B+lbT5Pu6tt9qqmtom9OM24miHn6yzY8kvAzCjtmrPP2gU/QVgrN3nvPXOzYBNc9y2qmeIr0SSRiaMseOp1yCBFpikaPA87gj9Vy3T1Whv57vy1vNt4fUUR3r0J+2pBfSdslwEdSxgtpUUYVbTg1EzyYUAZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uDN4K-0001x6-PS; Fri, 09 May 2025 14:43:12 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uDN4K-001tFm-1h;
	Fri, 09 May 2025 14:43:12 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uDN4K-00CNfg-1N;
	Fri, 09 May 2025 14:43:12 +0200
Date: Fri, 9 May 2025 14:43:12 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: usb: lan78xx: refactor PHY init to separate
 detection and MAC configuration
Message-ID: <aB34YNRx4uV9MaBL@pengutronix.de>
References: <aB3E3qDVOHu6zBI-@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aB3E3qDVOHu6zBI-@stanley.mountain>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org

On Fri, May 09, 2025 at 12:03:26PM +0300, Dan Carpenter wrote:
> Hello Oleksij Rempel,
> 
> Commit d39f339d2603 ("net: usb: lan78xx: refactor PHY init to
> separate detection and MAC configuration") from May 5, 2025
> (linux-next), leads to the following Smatch static checker warning:
> 
> 	drivers/net/usb/lan78xx.c:2842 lan78xx_phy_init()
> 	warn: missing unwind goto?
> 
> drivers/net/usb/lan78xx.c
>     2805 static int lan78xx_phy_init(struct lan78xx_net *dev)
>     2806 {
>     2807         __ETHTOOL_DECLARE_LINK_MODE_MASK(fc) = { 0, };
>     2808         int ret;
>     2809         u32 mii_adv;
>     2810         struct phy_device *phydev;
>     2811 
>     2812         phydev = lan78xx_get_phy(dev);
>     2813         if (IS_ERR(phydev))
>     2814                 return PTR_ERR(phydev);
>     2815 
>     2816         ret = lan78xx_mac_prepare_for_phy(dev);
>     2817         if (ret < 0)
>     2818                 goto free_phy;
>     2819 
>     2820         /* if phyirq is not set, use polling mode in phylib */
>     2821         if (dev->domain_data.phyirq > 0)
>     2822                 phydev->irq = dev->domain_data.phyirq;
>     2823         else
>     2824                 phydev->irq = PHY_POLL;
>     2825         netdev_dbg(dev->net, "phydev->irq = %d\n", phydev->irq);
>     2826 
>     2827         /* set to AUTOMDIX */
>     2828         phydev->mdix = ETH_TP_MDI_AUTO;
>     2829 
>     2830         ret = phy_connect_direct(dev->net, phydev,
>     2831                                  lan78xx_link_status_change,
>     2832                                  dev->interface);
>     2833         if (ret) {
>     2834                 netdev_err(dev->net, "can't attach PHY to %s\n",
>     2835                            dev->mdiobus->id);
>     2836                 if (dev->chipid == ID_REV_CHIP_ID_7801_) {
>     2837                         if (phy_is_pseudo_fixed_link(phydev)) {
>     2838                                 fixed_phy_unregister(phydev);
>     2839                                 phy_device_free(phydev);
>     2840                         }
>     2841                 }
> 
> Why does this error path only cleanup for ID_REV_CHIP_ID_7801_ where the
> others do it unconditionally?

This chip-specific condition in the cleanup can be used, but it’s not
strictly necessary - none of the variants introduce regressions. The
non-conditional cleanup actually matches the logic already used in
lan78xx_disconnect(), where phy_is_pseudo_fixed_link() is checked
unconditionally.

That said, the purpose of this patch set is to prepare for migration to
phylink, where pseudo fixed links won’t be used at all. Due to the
10-patch limit, I’ve split the changes - the patch that removes pseudo
fixed-link support entirely will follow.

Nevertheless, I can send a cleanup patch that unconditionally jumps to
free_phy on phy_connect_direct() failure for consistency and clarity.
Should I?

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
