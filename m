Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849FAC677F1
	for <kernel-janitors@archiver.kernel.org>; Tue, 17 Jan 2023 14:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbjAQOaN (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 17 Jan 2023 09:30:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbjAQO3t (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 17 Jan 2023 09:29:49 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6DC7EFE
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Jan 2023 06:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=KBPszgjzplClG0cwDr3W6UdY1Eclt0wUxk3LPzSt3sI=; b=yuGvaC1mDnQ7na7r240ACruiua
        HG3wXc7fVYv+9F1LKzxOCKS7H+DmQs9s2ADsBXX5c+yxXhoA9qVZdgSfkRsQhsEUSn99C6WV+1ega
        uNi++SN2QEl5hms+WgCMBVd8mLd2ZjIqfvUWle8nLuInBXrHSrf7DOaKtXsfiRPLw/so=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1pHmxI-002KaL-SC; Tue, 17 Jan 2023 15:28:52 +0100
Date:   Tue, 17 Jan 2023 15:28:52 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Dan Carpenter <error27@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: mdio: Add dedicated C45 API to MDIO bus drivers
Message-ID: <Y8awpAHzwLWBwepC@lunn.ch>
References: <Y8auKyhinOCcLqn2@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8auKyhinOCcLqn2@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jan 17, 2023 at 05:18:19PM +0300, Dan Carpenter wrote:
> Hello Andrew Lunn,

Adding Florian

> The patch 4e4aafcddbbf: "net: mdio: Add dedicated C45 API to MDIO bus
> drivers" from Jan 9, 2023, leads to the following Smatch static
> checker warning:
> 
> drivers/net/phy/mdio_bus.c:1003 mdiobus_c45_read() warn: sleeping in atomic context
> drivers/net/phy/mdio_bus.c:1104 mdiobus_c45_write() warn: sleeping in atomic context
> 
> drivers/net/phy/mdio_bus.c
>     993  * @regnum: register number to read
>     994  *
>     995  * NOTE: MUST NOT be called from interrupt context,
>     996  * because the bus read/write functions may wait for an interrupt
>     997  * to conclude the operation.
>     998  */
>     999 int mdiobus_c45_read(struct mii_bus *bus, int addr, int devad, u32 regnum)
>     1000 {
>     1001         int retval;
>     1002 
> --> 1003         mutex_lock(&bus->mdio_lock);
>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This takes a mutex.
> 
>     1004         retval = __mdiobus_c45_read(bus, addr, devad, regnum);
>     1005         mutex_unlock(&bus->mdio_lock);
>     1006 
>     1007         return retval;
>     1008 }
> 
> The problematic call tree is:
> 
> b44_ioctl() <- disables preempt
> -> phy_mii_ioctl()
>    -> mdiobus_c45_read()

This seems like an old bug which my change has brought to light. I
believe MDIO operations have always been blocking. So i would say
b44_ioctl should not be taking a spinlock here.

	  Andrew
