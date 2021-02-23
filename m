Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21E8C433DB
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Feb 2021 03:01:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 62CF964E4B
	for <kernel-janitors@archiver.kernel.org>; Tue, 23 Feb 2021 03:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbhBWDAu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Feb 2021 22:00:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:47314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230053AbhBWDAr (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Feb 2021 22:00:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0DD2564E02;
        Tue, 23 Feb 2021 03:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614049207;
        bh=Uao1CP+xp3jznWKuvtnApRdpBS7S45yfOn76RN1A6q8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZeA0DoyhUrVnrN1nsEQEWguS/x7shT37NASIgjfDjDE85cQ6NeWtto1cgTUjrNHoa
         Sw3Pzic4nqZwG0aIx0yucrmzCKwJ6Q8rv3L9WDmGS1PFReR/X8syTlNWiDz3/CEz8Y
         acZ1e33kSRXn6UukzNhUdkTzyVpeNZTKPdhhYIM/eagtaat7NGPXrpY2e4bKXMKcBQ
         6Gb1mI+6GdwcDFUwTjRhsmCddwOiBzz3+5stZO6twToQbNsufhdT/L9eN7zs5mFQur
         sWHefcwL+T0v9bqFQDPuYnjTNUwzhYyK4TV07FoYCipmTIOjxb6WI+q86xpD2GCbA5
         b5zxExd6udOsg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] net: phy: icplus: call phy_restore_page() when
 phy_select_page() fails
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161404920700.2731.2936896600905361791.git-patchwork-notify@kernel.org>
Date:   Tue, 23 Feb 2021 03:00:07 +0000
References: <YC+OpFGsDPXPnXM5@mwanda>
In-Reply-To: <YC+OpFGsDPXPnXM5@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, kuba@kernel.org, michael@walle.cc,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 19 Feb 2021 13:10:44 +0300 you wrote:
> The comments to phy_select_page() say that "phy_restore_page() must
> always be called after this, irrespective of success or failure of this
> call."  If we don't call phy_restore_page() then we are still holding
> the phy_lock_mdio_bus() so it eventually leads to a dead lock.
> 
> Fixes: 32ab60e53920 ("net: phy: icplus: add MDI/MDIX support for IP101A/G")
> Fixes: f9bc51e6cce2 ("net: phy: icplus: fix paged register access")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: phy: icplus: call phy_restore_page() when phy_select_page() fails
    https://git.kernel.org/netdev/net/c/4e9d9d1f4880

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


