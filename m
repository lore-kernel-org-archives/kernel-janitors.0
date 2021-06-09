Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C063BC48BCF
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 22:50:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DC4B613E7
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 22:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbhFIWwA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 18:52:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:45698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhFIWwA (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 18:52:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3007E61001;
        Wed,  9 Jun 2021 22:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623279005;
        bh=tNp0aNrpPmBijSP1EW5WjODo9XSWSTNd6RvkB4ikc9s=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=S6CS7hGKD0I7bGg+Ih8tQhPXVqnjcQvE+DdIpwoBkXQ8BJQW1PZEBlzQb+xQqgoUW
         enbuCBpErthe8v9YZvoDqe7lAt1PUvs/1K4/wvX2SFu8BjHS1q8d5KHDlIscxSLsmB
         89IysfWrXWiq3VlTyW+gjR4IIE4qwett5sIpyXio7s2iTnsRtiEQhKnpchuFNSXt/y
         SDyGL/TY5BWvc0YetXG5cU0OF8xlK1/BTVChZaHioGGTZk0r8rsm4X2pXdE8enIiv6
         PbxhTXalXGjf/hSKuwnX70zKufUkDfINu/3tJUt5s3Ts+XLuJzQ9Ctcn+LLMsrsNnc
         bBhDyqdHP5t+w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] net: dsa: sja1105: Fix assigned yet unused return code
 rc
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162327900512.30855.7512831027363493224.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Jun 2021 22:50:05 +0000
References: <20210609174353.298731-1-colin.king@canonical.com>
In-Reply-To: <20210609174353.298731-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     olteanv@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com,
        f.fainelli@gmail.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed,  9 Jun 2021 18:43:53 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The return code variable rc is being set to return error values in two
> places in sja1105_mdiobus_base_tx_register and yet it is not being
> returned, the function always returns 0 instead. Fix this by replacing
> the return 0 with the return code rc.
> 
> [...]

Here is the summary with links:
  - [next] net: dsa: sja1105: Fix assigned yet unused return code rc
    https://git.kernel.org/netdev/net-next/c/ab324d8dfdda

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


