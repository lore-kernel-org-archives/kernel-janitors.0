Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8367DECAAD8
	for <kernel-janitors@archiver.kernel.org>; Wed, 31 Aug 2022 06:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbiHaGaT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 31 Aug 2022 02:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiHaGaS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 31 Aug 2022 02:30:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D89728E24;
        Tue, 30 Aug 2022 23:30:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD7A061777;
        Wed, 31 Aug 2022 06:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36B06C433D6;
        Wed, 31 Aug 2022 06:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661927415;
        bh=5T5b9r2DvJk6+ZNmMDaKsB3sgQb0C5LHHYVZDMkLKoE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fUbJUvXKYe0iS166vyH5BvVPS3HwM1jr7iniTSpFfZmlE88yjybXpg7UI9yhBlFhc
         IoTF9xzwb6qUTfG7b5qt8BdwTCBmTD3plWyN2ETtzB56LDYeiUNpeSOaUYWCRkBV4c
         ZDWZwybiNBrk+gG7w+o3jZNoyAj7hjxAnEJMczTNuDvgrQYYwT4b95DJRh+hHIWuzF
         6bnP8F/R65rWbv5BxRO+CvYoGBVry11dwcBYhXrDZafibtqfUYfyrU1OsLpo1GSZHH
         6Rt1a1D3VdrDmDR04yUCRJCabNHiEuDQp47npijlbfblUNPMrFhzITGMx76U3rlvr/
         6Kfn/78FbYlVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 142E1E924D6;
        Wed, 31 Aug 2022 06:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: lan966x: improve error handle in
 lan966x_fdma_rx_get_frame()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166192741507.4297.14219685451131763053.git-patchwork-notify@kernel.org>
Date:   Wed, 31 Aug 2022 06:30:15 +0000
References: <YwjgDm/SVd5c1tQU@kili>
In-Reply-To: <YwjgDm/SVd5c1tQU@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     horatiu.vultur@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 26 Aug 2022 18:00:30 +0300 you wrote:
> Don't just print a warning.  Clean up and return an error as well.
> 
> Fixes: c8349639324a ("net: lan966x: Add FDMA functionality")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net] net: lan966x: improve error handle in lan966x_fdma_rx_get_frame()
    https://git.kernel.org/netdev/net/c/13a9d08c2962

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


