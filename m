Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3714BC48BCD
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 22:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21689613E3
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 22:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhFIWme (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 18:42:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:38460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230134AbhFIWmU (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 18:42:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 62E1C613F2;
        Wed,  9 Jun 2021 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623278425;
        bh=KE7NfEJmLueislrgsxoRI/4LuNgtYIy5fAtTYzEQuo4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=s5ax1pNU2dYm9oBxWQVKX/qeu1bzURmcFS6hpnBdCzw6jj3S/hswWUk9G/biw2sMM
         AHCmwriApEAsus6P6WAF+YUZh0H4wnWxYZmCReM3MxoqGMU4d9qEjUrFp0Gw/cad0F
         AoWWIJ+czN5YlntHYU/WZucSZOiKombCxBalQ12pqBhg/ZR0Dm6Lw8fdh63TfKEQCY
         bCMBA3W1hz06kJ+lkAw8g7y9QqSRDDpIk0eAE9zGNrT8ws8ngJI4EezvYf06CSpB98
         +QSnlx/lev9mVqqvXi3IRpcjhr3GLxUk4t+Rf2MbtKj5jpzTo3XTKDsGziWh5r4vca
         MMWPL44aKtmBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] net: phy: realtek: net: Fix less than zero comparison
 of a u16
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162327842533.25473.14455359274708008016.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Jun 2021 22:40:25 +0000
References: <20210609171748.298027-1-colin.king@canonical.com>
In-Reply-To: <20210609171748.298027-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, kuba@kernel.org, qiangqing.zhang@nxp.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed,  9 Jun 2021 18:17:48 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The comparisons of the u16 values priv->phycr1 and priv->phycr2 to less
> than zero always false because they are unsigned. Fix this by using an
> int for the assignment and less than zero check.
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 0a4355c2b7f8 ("net: phy: realtek: add dt property to disable CLKOUT clock")
> Fixes: d90db36a9e74 ("net: phy: realtek: add dt property to enable ALDPS mode")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - [next] net: phy: realtek: net: Fix less than zero comparison of a u16
    https://git.kernel.org/netdev/net-next/c/f25247d88708

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


