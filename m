Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A32C54EE9
	for <kernel-janitors@archiver.kernel.org>; Thu,  8 Sep 2022 12:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231283AbiIHMLs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 8 Sep 2022 08:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiIHMLZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 8 Sep 2022 08:11:25 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74006FBF00;
        Thu,  8 Sep 2022 05:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=kKQu8jHEXtl4sMfMDZyND+FB/M6SQ7b/U3Et5ndQv9U=; b=IzN2lrl6j9bs0S0UZvOWiZWG12
        XBSmUxwrwxXJKTKC46riciQXzR3pDFMRlG8F2rXHjO00zUiV/hK0q3Ni4uFJLJZ1a/BjgZOMSSl8P
        Yr+3DnFKRaOZtBieR/egnsy52swNAZJcsnZhtBjf5K5YDZlabSr/aJkLxtBDYifQQCZs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1oWGN6-00FxiD-7C; Thu, 08 Sep 2022 14:11:04 +0200
Date:   Thu, 8 Sep 2022 14:11:04 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Sun Ke <sunke32@huawei.com>
Cc:     woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        vivien.didelot@gmail.com, f.fainelli@gmail.com, olteanv@gmail.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] net: dsa: microchip: lan937x: fix reference count leak
 in lan937x_mdio_register()
Message-ID: <Yxnb2MQDevKL2Qmn@lunn.ch>
References: <20220908040226.871690-1-sunke32@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908040226.871690-1-sunke32@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Thu, Sep 08, 2022 at 12:02:26PM +0800, Sun Ke wrote:
> This node pointer is returned by of_find_compatible_node() with
> refcount incremented in this function. of_node_put() on it before
> exitting this function.
> 
> Fixes: c9cd961c0d43 ("net: dsa: microchip: lan937x: add interrupt support for port phy link")
> Signed-off-by: Sun Ke <sunke32@huawei.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
