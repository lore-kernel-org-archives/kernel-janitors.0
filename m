Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4666FE784BE
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Oct 2023 15:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238100AbjJBP3C (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Oct 2023 11:29:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238080AbjJBP3A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Oct 2023 11:29:00 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED1C299;
        Mon,  2 Oct 2023 08:28:57 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9b29186e20aso1602858566b.2;
        Mon, 02 Oct 2023 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696260536; x=1696865336; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0tAOwTmpRnemcwVfQtR+1Q5IapLmuTL7Mfm1a0zU+tQ=;
        b=UwAc7OaVwiFYgBuZ+sA16hg4GBql9sj9btFPfIzG244xcyGAbAC/gn0/+RFLxtm4xG
         +RN2ib7V4ErLQ4+2udvtfZLz92jd+TxS/OhYX9OQUux2iM98Y663mRlx9FB4hQDqBciJ
         lnuUINekKgPHq2ak/fM/+qxONBqzdNr4qrv9PInxSGLFQuto7h+nJbdphUlcCZ4PU/Gi
         tyRfsJDRL2nrVIaAk2EeDbWdGYDSpjF4IqWan4nPxhZgLUobK7I/F+qhXN49MEkGxddn
         Ri0IbnY8CAQLKJNfrNs4X8K7J4R8s0LCpSl31MH0P7rKetULc4ODPZTKxq0KsNjAvjWG
         mzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696260536; x=1696865336;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0tAOwTmpRnemcwVfQtR+1Q5IapLmuTL7Mfm1a0zU+tQ=;
        b=oNjJyBwH7HvUqtHQA7v+ZiliAmxRIiD9iczdFz3nyrVjIBbl03Df2+JMOUjI0NDcnj
         pXpgw8BTLW0WAetZYDK9h/tF1aDTMJ2d2WpU9voEqgD9f3OrWOoW934uKOhNhGhwjC7F
         0CnGc3qTgG8s6/PmwoAFLMPuCXa2hFMDxv8UL/SjCc+2iFmUE7WqJTSFU3AgYATncf+X
         B4HfXRDrTCpEa/UF7wAnjXF+cTLCGjAHTTXj0kWpk/7QnaXCyrEzlv7K90fKFg7YAgV0
         Zc62ZHT4xX3XWCkvpBGudrj8rEfK30TjX3a9Wu8fXSs52YWrvIpEuZkvVwMlIsq8OYyF
         j+CA==
X-Gm-Message-State: AOJu0YxkexISr3Z7c1SF33DaWrkfq17MAkXVFMojpHer0gJZ3IZ64ld4
        uUX85nDmXKWDY1QIVks23l8=
X-Google-Smtp-Source: AGHT+IH5rOh2MCD3U74styayhciaLwOPbUZTm5MUr8kv8T70uoOeBRM0/KQ3jL2FpX2Fv2eSglLc/g==
X-Received: by 2002:a17:906:197:b0:99e:f3b:2f78 with SMTP id 23-20020a170906019700b0099e0f3b2f78mr9925780ejb.67.1696260536188;
        Mon, 02 Oct 2023 08:28:56 -0700 (PDT)
Received: from skbuf ([188.25.255.218])
        by smtp.gmail.com with ESMTPSA id z17-20020a1709067e5100b0099bc80d5575sm17000207ejr.200.2023.10.02.08.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:28:55 -0700 (PDT)
Date:   Mon, 2 Oct 2023 18:28:53 +0300
From:   Vladimir Oltean <olteanv@gmail.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Woojung Huh <woojung.huh@microchip.com>,
        UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: microchip: Uninitialized variable in
 ksz9477_acl_move_entries()
Message-ID: <20231002152853.xjyxlvpouktfbg6k@skbuf>
References: <2f58ca9a-9ac5-460a-98a4-aa8304f2348a@moroto.mountain>
 <20230927144624.GN2714790@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927144624.GN2714790@pengutronix.de>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Oleksij,

On Wed, Sep 27, 2023 at 04:46:24PM +0200, Oleksij Rempel wrote:
> On Wed, Sep 27, 2023 at 03:53:37PM +0300, Dan Carpenter wrote:
> > Smatch complains that if "src_idx" equals "dst_idx" then
> > ksz9477_validate_and_get_src_count() doesn't initialized "src_count".
> > Set it to zero for this situation.
> > 
> > Fixes: 002841be134e ("net: dsa: microchip: Add partial ACL support for ksz9477 switches")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
> Thank you!
> 
> > ---
> >  drivers/net/dsa/microchip/ksz9477_acl.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/dsa/microchip/ksz9477_acl.c b/drivers/net/dsa/microchip/ksz9477_acl.c
> > index 06d74c19eb94..e554cd4a024b 100644
> > --- a/drivers/net/dsa/microchip/ksz9477_acl.c
> > +++ b/drivers/net/dsa/microchip/ksz9477_acl.c
> > @@ -554,7 +554,8 @@ static int ksz9477_acl_move_entries(struct ksz_device *dev, int port,
> >  	struct ksz9477_acl_entry buffer[KSZ9477_ACL_MAX_ENTRIES];
> >  	struct ksz9477_acl_priv *acl = dev->ports[port].acl_priv;
> >  	struct ksz9477_acl_entries *acles = &acl->acles;
> > -	int src_count, ret, dst_count;
> > +	int ret, dst_count;
> > +	int src_count = 0;
> >  
> >  	ret = ksz9477_validate_and_get_src_count(dev, port, src_idx, dst_idx,
> >  						 &src_count, &dst_count);
> > -- 
> > 2.39.2
> > 
> > 
> > 
> 
> -- 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

For the case where src_idx == dst_idx that Dan points out, is this patch
sufficient to ensure that ksz9477_acl_move_entries() will not execute
unwanted code paths? For example, it will still call ksz9477_move_entries_upwards(),
which from what I can tell, will do something given the way in which it's written.

Perhaps it would be better to move this line:

	/* Nothing to do */
	if (src_idx == dst_idx)
		return 0;

outside of ksz9477_validate_and_get_src_count() and into its single caller,
ksz9477_acl_move_entries()?
