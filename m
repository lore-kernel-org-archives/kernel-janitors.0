Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAD0C04A68
	for <kernel-janitors@archiver.kernel.org>; Sat, 30 Jul 2022 03:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbiG3DaU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 29 Jul 2022 23:30:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbiG3DaS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 29 Jul 2022 23:30:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB268DEEA;
        Fri, 29 Jul 2022 20:30:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 57322B82A44;
        Sat, 30 Jul 2022 03:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC1AEC433D7;
        Sat, 30 Jul 2022 03:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659151814;
        bh=q+TzweyM5DIsiCgq3bmQnvgqxwJyoIZRSOESFgj5H0c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sRgPw4cMN/gqKItPq043Zx0tK/0bUZd1rJgEJzamSH6Avsf58T5xz3UbsYfwquBmL
         Ew4V2MtIBCAeV5JSuxVCXvAVQruEsawIV+s851G++xG1XqQVt7hdP0DhjUc12QrjQ9
         3OWLogGY//q8IJYSHFUqL1x3D0AJ0z+QoTWWkJKOtlEvltHMYGxAX5ecECw8XGrJp/
         6L1JUgNfaFnrkDvByE9mRv06+eHxCbMBiz7QCayL0mp9IEQKT13LoHvPMhkME+efj+
         fL7jLyysYvzspDI99+TiS9ZOtam4sDLA455GPLWRTqtcb1+DEjtH9uf2lYcrZNSH4e
         pVHPYWw1nx7hA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CF80AC43140;
        Sat, 30 Jul 2022 03:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: marvell: prestera: uninitialized variable bug
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <165915181384.2630.12954054467926209688.git-patchwork-notify@kernel.org>
Date:   Sat, 30 Jul 2022 03:30:13 +0000
References: <YuKeBBuGtsmd7QdT@kili>
In-Reply-To: <YuKeBBuGtsmd7QdT@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     tchornyi@marvell.com, oleksandr.mazur@plvision.eu,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, yevhen.orlov@plvision.eu,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 28 Jul 2022 17:32:36 +0300 you wrote:
> The "ret" variable needs to be initialized at the start.
> 
> Fixes: 52323ef75414 ("net: marvell: prestera: add phylink support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/marvell/prestera/prestera_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: marvell: prestera: uninitialized variable bug
    https://git.kernel.org/netdev/net-next/c/71930846b36f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


