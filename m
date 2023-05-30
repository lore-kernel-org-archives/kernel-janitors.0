Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD58FC7EE23
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 04:58:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjE3E6U (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 00:58:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbjE3E6H (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 00:58:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B1EC9
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 21:58:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 904E062A23
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 04:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 886ABC433EF;
        Tue, 30 May 2023 04:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685422684;
        bh=ZGGpOq+uObnkcEWx80C+FBZ6VsPfRaAQ73HUlsFkY1A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=VBswMtimzeTP8Fd10/OL6GTPRpKzRUnATE3+6olxdkhiPtO4nEC9ZDt7lzA5AySHs
         iHLgVkrgi7bTNkVZWbrwoYBpiS69N1wuwW7ribHBV01G1uBWfAj2qZ5rrGqLHuNLob
         CHcPJ/glWbgAxnS0fATEt+5kvIJex/91STY53qsgo6aiYKRjI1zl2Zn/Iqd6j8OMMw
         GZsQ0gyhNF0ANL7GLCgRhPREG5+mUrfo5A47URyejc2ogEfejt2pgx3p4pQkHoj/gS
         /99cUDEnL5HZ2l29iJO5uJHB/G2CwvsfFZlyUAzbiFMtE3+qjR2jK7NxcfvMN6NcLv
         J0HjjvsOykriw==
Date:   Mon, 29 May 2023 21:58:02 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH net] net: phy: fix a signedness bug in genphy_loopback()
Message-ID: <20230529215802.70710036@kernel.org>
In-Reply-To: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
References: <d7bb312e-2428-45f6-b9b3-59ba544e8b94@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 26 May 2023 14:45:54 +0300 Dan Carpenter wrote:
> The "val" variable is used to store error codes from phy_read() so
> it needs to be signed for the error handling to work as expected.
> 
> Fixes: 014068dcb5b1 ("net: phy: genphy_loopback: add link speed configuration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Is it going to be obvious to PHY-savvy folks that the val passed to
phy_read_poll_timeout() must be an int? Is it a very common pattern?
My outsider intuition is that since regs are 16b, u16 is reasonable,
and more people may make the same mistake. Therefore we should try to
fix phy_read_poll_timeout() instead to use a local variable like it
does for __ret. 

Weaker version would be to add a compile time check to ensure val 
is signed (assert(typeof(val)~0ULL < 0) or such?).

Opinions?
