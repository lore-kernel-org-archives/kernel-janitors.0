Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F7BC77B7F
	for <kernel-janitors@archiver.kernel.org>; Fri,  5 May 2023 09:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbjEEJKZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 5 May 2023 05:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbjEEJKX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 5 May 2023 05:10:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BF110FE
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 02:10:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E47F663C9C
        for <kernel-janitors@vger.kernel.org>; Fri,  5 May 2023 09:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38839C433EF;
        Fri,  5 May 2023 09:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683277821;
        bh=0hAoMe/RkHIXSGpv4lIQ+zDfTDe6qsEo7o6Ru3YcTPo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lXajDlLXogBU3vWVGna76OveOKHrXjjKSxX/ShzneLodaMVEVornsctHyEoD7GWRO
         d+2JYmFAS3rH4amdLRCNQG+GDDSzaYU/PDXVrlorprwO3l+O6Wxl3/kwhwBmsFYIuv
         deV0xnOkBshlG2F581EWTDPeD+QNMuTnKujvz5h+e7DWgjQcremrgWeCGKqs87Tbnx
         JnYMvoyJI9Kb122VtxvhAFrYCn9VSaixtMLZKyTiA8JFPFEuk22NHZ/LN/bULM3tR5
         19zNhaHIl9UFIHza+e+G72W7EFoZFW1NnwlR4k1F6/hzA6kfEh8W2PNKw05OujTh1y
         4lX0Q9lj5zs0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 11238E5FFCE;
        Fri,  5 May 2023 09:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] pds_core: fix mutex double unlock in error path
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168327782106.8511.9840821021018679324.git-patchwork-notify@kernel.org>
Date:   Fri, 05 May 2023 09:10:21 +0000
References: <20230504204459.56454-1-shannon.nelson@amd.com>
In-Reply-To: <20230504204459.56454-1-shannon.nelson@amd.com>
To:     Shannon Nelson <shannon.nelson@amd.com>
Cc:     brett.creeley@amd.com, davem@davemloft.net, netdev@vger.kernel.org,
        kuba@kernel.org, dan.carpenter@linaro.org, drivers@pensando.io,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 4 May 2023 13:44:59 -0700 you wrote:
> Fix a double unlock in an error handling path by unlocking as soon as
> the error is seen and removing unlocks in the error cleanup path.
> 
> Link: https://lore.kernel.org/kernel-janitors/209a09f6-5ec6-40c7-a5ec-6260d8f54d25@kili.mountain/
> Fixes: 523847df1b37 ("pds_core: add devcmd device interfaces")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
> 
> [...]

Here is the summary with links:
  - [net] pds_core: fix mutex double unlock in error path
    https://git.kernel.org/netdev/net/c/1e76f42779d6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


