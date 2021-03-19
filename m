Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC6AC433E8
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 19:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A821B61982
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 19:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhCSTUU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:20:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:44568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230297AbhCSTUJ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Mar 2021 15:20:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9150561962;
        Fri, 19 Mar 2021 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616181608;
        bh=FYpkEqH1bNcgS1LVmlFnNU9g+5EZVkOgq89cYSUlYuo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vIO+H8/KkpG/0pb65TmpvWvIQINctnJpg7NVbaHTLj6m9a7y7zgYggulie5FAGJIN
         KB0FK+C1Xi9o/DqGpeOZkix9VMuK2J9mPnLojTO6Gy0sk93zXlQQN5qAzMRiSOBde7
         xb7Ocpuozd75Nxa1zntUY0f+cXrcnooFuYZEajY8V4KgnTN5aSH9EN2EtRhKq3fnnj
         TPWuHObF0SPt6WIIpiUMQlcQ7uhkyFxFBHKavHN7htXmvUHhH6uewKBz+IjgyKvsWy
         IWN3cidhG25U9Ff0rvQHUwOO+iojOLlTD6CDN370V19xaxGddJnwqW2jdoYIwi92FO
         uy2BBgH0flXjA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] octeontx2-pf: Fix spelling mistake "ratelimitter" ->
 "ratelimiter"
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161618160852.4810.9676946701572392197.git-patchwork-notify@kernel.org>
Date:   Fri, 19 Mar 2021 19:20:08 +0000
References: <20210319095453.5395-1-colin.king@canonical.com>
In-Reply-To: <20210319095453.5395-1-colin.king@canonical.com>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
        hkelam@marvell.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 19 Mar 2021 09:54:53 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/marvell/octeontx2/nic/otx2_tc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] octeontx2-pf: Fix spelling mistake "ratelimitter" -> "ratelimiter"
    https://git.kernel.org/netdev/net-next/c/745740ac56b8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


