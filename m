Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256CEC433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 00:00:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 023A961209
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 00:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235920AbhDLAA0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 11 Apr 2021 20:00:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:37016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235761AbhDLAA0 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 11 Apr 2021 20:00:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 14DBB60FE5;
        Mon, 12 Apr 2021 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618185609;
        bh=Ep0oVyD22xDacAhnrCxqKpILUQNVltZCjRY3F91XcRs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=H2BEqOES8D75o2oYWayapcqQAxbJAEcCCZuSMduuXESaaCOwN6wXEsbvSUgNbZ1G2
         Zc6Sq6k+S3FAxqIbphpNp7tMqcxmdSSGT3sR1ZhVZsv5UIcn3DkxqcYtcyzR1AURhp
         fIa9maSq39s8ti2Ol/cFse307n26K3EVplVQMK0E6C7R27Hldh1Zj5AIb7ztrss72O
         qNiYPPGKe7iFCAa1gn2ze5xj5EGroHe5TwI0tDr2JcMejUWMVUsYVv9vZqv4oKcfam
         e0zvg8NmbFB4FHnXIxkb/fW0cRuHRKeeJO2C3EendiuQMwgBwCznLjh+4ITkTVQbv9
         K93gJrEc7hsYQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: davicom: Fix regulator not turned off on failed probe
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161818560897.30810.8669236543689433820.git-patchwork-notify@kernel.org>
Date:   Mon, 12 Apr 2021 00:00:08 +0000
References: <88d396a107aad8059cabc3eb1f05f7d325287bf2.1618131620.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <88d396a107aad8059cabc3eb1f05f7d325287bf2.1618131620.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     davem@davemloft.net, kuba@kernel.org, paul@crapouillou.net,
        andrew@lunn.ch, gustavoars@kernel.org, paulburton@kernel.org,
        Zubair.Kakakhel@imgtec.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sun, 11 Apr 2021 11:02:08 +0200 you wrote:
> When the probe fails, we must disable the regulator that was previously
> enabled.
> 
> This patch is a follow-up to commit ac88c531a5b3
> ("net: davicom: Fix regulator not turned off on failed probe") which missed
> one case.
> 
> [...]

Here is the summary with links:
  - net: davicom: Fix regulator not turned off on failed probe
    https://git.kernel.org/netdev/net/c/31457db3750c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


