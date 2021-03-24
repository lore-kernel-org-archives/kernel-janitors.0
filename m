Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F421C433C1
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 19:40:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28BF061A1B
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 19:40:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237939AbhCXTkZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 15:40:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:42110 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237888AbhCXTkI (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 15:40:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7CB7661A1D;
        Wed, 24 Mar 2021 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616614808;
        bh=Zz1CsYFdzAfuhuMUMv/0V2zv9+h1ESONLaa6Ji/jV68=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y48W//4T/rbDAbfaao7QRltZI2DL8LufuotMexFAz4cLQN71DFGBP5aOlWdf/qAbt
         kz9eVIv+ZYUXW8y/PfBw6uo4DPniVa2KDdaLrNqX+6ijdtD4soA9W4bveTxOEOM0dH
         ir1SuaT1urXHIxBUC5DxprYLXUdj8vJ72fhO++Cuz92vs1OD9VWi7yppygkuqo2H3T
         5URBYnWfAYwctisY6hRO3RmC0GAkm3i7DKxGXRNfAeXrK9DHigVGnqW0XHeqH9e8aB
         fgTY0macwHsju1bi914n5Swqldtt7XvfCm6GyA1fj9uw+5J5spRYWLEZrAIdnDl4zA
         rdSYYQiPWCcrA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] octeontx2-af: Fix memory leak of object buf
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161661480843.20893.18393670218397108988.git-patchwork-notify@kernel.org>
Date:   Wed, 24 Mar 2021 19:40:08 +0000
References: <20210323123245.346491-1-colin.king@canonical.com>
In-Reply-To: <20210323123245.346491-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
        jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
        davem@davemloft.net, kuba@kernel.org, rsaladi2@marvell.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 23 Mar 2021 12:32:45 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the error return path when lfs fails to allocate is not free'ing
> the memory allocated to buf. Fix this by adding the missing kfree.
> 
> Addresses-Coverity: ("Resource leak")
> Fixes: f7884097141b ("octeontx2-af: Formatting debugfs entry rsrc_alloc.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - octeontx2-af: Fix memory leak of object buf
    https://git.kernel.org/netdev/net/c/9e0a537d06fc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


