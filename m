Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED66C77B75
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 Apr 2023 04:22:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjDREWL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 Apr 2023 00:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbjDREWJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 Apr 2023 00:22:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8AE4EDD
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Apr 2023 21:22:07 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pocqe-0007Xi-Nc; Tue, 18 Apr 2023 06:21:44 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1pocqc-0001NI-0V; Tue, 18 Apr 2023 06:21:42 +0200
Date:   Tue, 18 Apr 2023 06:21:41 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Arun Ramadoss <arun.ramadoss@microchip.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH net] net: dsa: microchip: ksz8795: Correctly handle huge
 frame configuration
Message-ID: <20230418042141.GA30964@pengutronix.de>
References: <43107d9e8b5b8b05f0cbd4e1f47a2bb88c8747b2.1681755535.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <43107d9e8b5b8b05f0cbd4e1f47a2bb88c8747b2.1681755535.git.christophe.jaillet@wanadoo.fr>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Christophe,

On Mon, Apr 17, 2023 at 08:19:33PM +0200, Christophe JAILLET wrote:
> Because of the logic in place, SW_HUGE_PACKET can never be set.
> (If the first condition is true, then the 2nd one is also true, but is not
> executed)
> 
> Change the logic and update each bit individually.
>
> Fixes: 29d1e85f45e0 ("net: dsa: microchip: ksz8: add MTU configuration support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

> ---
> Untested.

I do not have access to this HW too.

> ---
>  drivers/net/dsa/microchip/ksz8795.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/dsa/microchip/ksz8795.c b/drivers/net/dsa/microchip/ksz8795.c
> index 23614a937cc3..f56fca1b1a22 100644
> --- a/drivers/net/dsa/microchip/ksz8795.c
> +++ b/drivers/net/dsa/microchip/ksz8795.c
> @@ -96,7 +96,7 @@ static int ksz8795_change_mtu(struct ksz_device *dev, int frame_size)
>  
>  	if (frame_size > KSZ8_LEGAL_PACKET_SIZE)
>  		ctrl2 |= SW_LEGAL_PACKET_DISABLE;
> -	else if (frame_size > KSZ8863_NORMAL_PACKET_SIZE)
> +	if (frame_size > KSZ8863_NORMAL_PACKET_SIZE)
>  		ctrl1 |= SW_HUGE_PACKET;
>  
>  	ret = ksz_rmw8(dev, REG_SW_CTRL_1, SW_HUGE_PACKET, ctrl1);
> -- 
> 2.34.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
