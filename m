Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D5FE92FFB
	for <kernel-janitors@archiver.kernel.org>; Fri,  6 Oct 2023 10:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231676AbjJFKqI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 6 Oct 2023 06:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbjJFKqH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 6 Oct 2023 06:46:07 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 455E8CA
        for <kernel-janitors@vger.kernel.org>; Fri,  6 Oct 2023 03:46:06 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qoiL9-0004hR-7B; Fri, 06 Oct 2023 12:45:51 +0200
Received: from [2a0a:edc0:2:b01:1d::c0] (helo=ptx.whiteo.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ore@pengutronix.de>)
        id 1qoiL8-00BUez-8E; Fri, 06 Oct 2023 12:45:50 +0200
Received: from ore by ptx.whiteo.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1qoiL8-00D3nj-5Z; Fri, 06 Oct 2023 12:45:50 +0200
Date:   Fri, 6 Oct 2023 12:45:50 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Vladimir Oltean <olteanv@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: microchip: Uninitialized variable in
 ksz9477_acl_move_entries()
Message-ID: <20231006104550.GB3112038@pengutronix.de>
References: <2f58ca9a-9ac5-460a-98a4-aa8304f2348a@moroto.mountain>
 <20230927144624.GN2714790@pengutronix.de>
 <20231002152853.xjyxlvpouktfbg6k@skbuf>
 <7102fb731c18f7b10f19f6bdc05d8a7f74e43feb.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7102fb731c18f7b10f19f6bdc05d8a7f74e43feb.camel@redhat.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Vladimir, Paolo,

On Thu, Oct 05, 2023 at 10:06:22AM +0200, Paolo Abeni wrote:
> On Mon, 2023-10-02 at 18:28 +0300, Vladimir Oltean wrote:
> > Hi Oleksij,
> > 
> > On Wed, Sep 27, 2023 at 04:46:24PM +0200, Oleksij Rempel wrote:
> > > On Wed, Sep 27, 2023 at 03:53:37PM +0300, Dan Carpenter wrote:
> > > > Smatch complains that if "src_idx" equals "dst_idx" then
> > > > ksz9477_validate_and_get_src_count() doesn't initialized "src_count".
> > > > Set it to zero for this situation.
> > > > 
> > > > Fixes: 002841be134e ("net: dsa: microchip: Add partial ACL support for ksz9477 switches")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > 
> > > Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > > 
> > > Thank you!
> > > 
> > > > ---
> > > >  drivers/net/dsa/microchip/ksz9477_acl.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/net/dsa/microchip/ksz9477_acl.c b/drivers/net/dsa/microchip/ksz9477_acl.c
> > > > index 06d74c19eb94..e554cd4a024b 100644
> > > > --- a/drivers/net/dsa/microchip/ksz9477_acl.c
> > > > +++ b/drivers/net/dsa/microchip/ksz9477_acl.c
> > > > @@ -554,7 +554,8 @@ static int ksz9477_acl_move_entries(struct ksz_device *dev, int port,
> > > >  	struct ksz9477_acl_entry buffer[KSZ9477_ACL_MAX_ENTRIES];
> > > >  	struct ksz9477_acl_priv *acl = dev->ports[port].acl_priv;
> > > >  	struct ksz9477_acl_entries *acles = &acl->acles;
> > > > -	int src_count, ret, dst_count;
> > > > +	int ret, dst_count;
> > > > +	int src_count = 0;
> > > >  
> > > >  	ret = ksz9477_validate_and_get_src_count(dev, port, src_idx, dst_idx,
> > > >  						 &src_count, &dst_count);
> > > > -- 
> > > > 2.39.2
> > > > 
> > > > 
> > > > 
> > > 
> > > -- 
> > > Pengutronix e.K.                           |                             |
> > > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> > 
> > For the case where src_idx == dst_idx that Dan points out, is this patch
> > sufficient to ensure that ksz9477_acl_move_entries() will not execute
> > unwanted code paths? For example, it will still call ksz9477_move_entries_upwards(),
> > which from what I can tell, will do something given the way in which it's written.
> > 
> > Perhaps it would be better to move this line:
> > 
> > 	/* Nothing to do */
> > 	if (src_idx == dst_idx)
> > 		return 0;
> > 
> > outside of ksz9477_validate_and_get_src_count() and into its single caller,
> > ksz9477_acl_move_entries()?
> 
> Additionally, it looks like that when (src_idx == dst_idx) even
> dst_count is not initialized but is still later used.

Ack, moving if (src_idx == dst_idx) to ksz9477_acl_move_entries() is the
proper fix.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
