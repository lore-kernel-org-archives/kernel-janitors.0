Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B20E7B5E1
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Oct 2023 09:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242042AbjJDJk2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Oct 2023 05:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242038AbjJDJk1 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Oct 2023 05:40:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 783B8AC
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Oct 2023 02:40:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 162E8C433C8;
        Wed,  4 Oct 2023 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696412424;
        bh=VcgIT2baXF7GIo+TcyTXEp764GHUJp+tJ8ZoUXL5kgY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=K8zl/tPNZnw6gQ0DpX8aVcHO+b0yEpfJiNK9Ondp4atmPSUgd8N9tic9HPn9RxTRq
         yAtQgfBJ3TNLR9aecSHdf4xX+DuJG0W5WO4PWW1rSjlnzqHnKAWCWTjcX1y3IOfIY2
         qAuo6bXMZLDctYOHIYmMDdiYsZlLRrSniMNfrCvsEqlpILqJmXmzvkCivFLXSjLiHP
         Ua7sOzDMokKQsfkFiZRKNMU0G05D2GW2PFBxWi2noXhw7P7ih++eLYaUPiJgw2zomH
         spMpFC/NagBmoWGUHMifB+jbP6y5iocPneyQHOV/QqSskpSwAF5wWqHpmZlr/HnORU
         WIgpVWIwbgylQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF3B4C595D2;
        Wed,  4 Oct 2023 09:40:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/3 net] net: ethernet: ti: am65-cpsw: Fix error code in
 am65_cpsw_nuss_init_tx_chns()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169641242397.19946.703213074993184771.git-patchwork-notify@kernel.org>
Date:   Wed, 04 Oct 2023 09:40:23 +0000
References: <4c2073cc-e7ef-4f16-9655-1a46cfed9fe9@moroto.mountain>
In-Reply-To: <4c2073cc-e7ef-4f16-9655-1a46cfed9fe9@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     grygorii.strashko@ti.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, rogerq@kernel.org,
        s-vadapalli@ti.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This series was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 26 Sep 2023 17:04:43 +0300 you wrote:
> This accidentally returns success, but it should return a negative error
> code.
> 
> Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Sorry for the delay on this.  I wrote this before traveling and meant
> to send it earlier but forgot.
> 
> [...]

Here is the summary with links:
  - [1/3,net] net: ethernet: ti: am65-cpsw: Fix error code in am65_cpsw_nuss_init_tx_chns()
    https://git.kernel.org/netdev/net/c/37d4f5556798
  - [2/3,net] net: ti: icssg-prueth: Fix signedness bug in prueth_init_tx_chns()
    https://git.kernel.org/netdev/net/c/a325f174d708
  - [3/3,net] dmaengine: ti: k3-udma-glue: clean up k3_udma_glue_tx_get_irq() return
    https://git.kernel.org/netdev/net/c/f9a1d3216a49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


