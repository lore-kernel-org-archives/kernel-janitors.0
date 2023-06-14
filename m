Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B963EB64DA
	for <kernel-janitors@archiver.kernel.org>; Wed, 14 Jun 2023 03:50:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbjFNDu2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 13 Jun 2023 23:50:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242238AbjFNDuZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 13 Jun 2023 23:50:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D37D1732
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Jun 2023 20:50:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D13EF63D47
        for <kernel-janitors@vger.kernel.org>; Wed, 14 Jun 2023 03:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B735C433C8;
        Wed, 14 Jun 2023 03:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686714622;
        bh=2doPMc7CchbE/oRF/eOr9kaW6x5+7kGZIHwg+VP5nzU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ysf7n9TATvLmcbf/Ebk8Q5pbmXqTvIBPlq6nPmZUwqoWg5uEZv8y6MZ0lcIgWFHQR
         qS3n90MX083fb4G/oVnDdzxsHDkmAhYrlEv9SSsVJHvdi6KHXePkX9tQIEO/W8impg
         lUoYVZYRinnefSqvrX/GAqvZCcJUvLKaDGBN0MBRr/VoHF9uSUD7FujzReHGa4TU1F
         fCNF3PQVIOrCBttqiW1ddO3oNM0O6QhzXc9I1lkrcnsk0brXAgiNb92NTLkf4wHAYH
         EhFyMVLWR7wM+0ULAO3TQtGWjPfi7c6obMR7sUbIknO3N+7xZ/iXvZStgjmm4FarYn
         wffP0YXQOFWgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09CE8C3274D;
        Wed, 14 Jun 2023 03:50:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw: Call of_node_put() on
 error path
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168671462202.18215.7347917401810887721.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Jun 2023 03:50:22 +0000
References: <e3012f0c-1621-40e6-bf7d-03c276f6e07f@kili.mountain>
In-Reply-To: <e3012f0c-1621-40e6-bf7d-03c276f6e07f@kili.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     s-vadapalli@ti.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, rogerq@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 12 Jun 2023 10:18:50 +0300 you wrote:
> This code returns directly but it should instead call of_node_put()
> to drop some reference counts.
> 
> Fixes: dab2b265dd23 ("net: ethernet: ti: am65-cpsw: Add support for SERDES configuration")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] net: ethernet: ti: am65-cpsw: Call of_node_put() on error path
    https://git.kernel.org/netdev/net/c/374283a10012

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


