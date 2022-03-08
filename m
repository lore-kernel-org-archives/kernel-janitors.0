Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CE8C433EF
	for <kernel-janitors@archiver.kernel.org>; Tue,  8 Mar 2022 06:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243788AbiCHGbJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 8 Mar 2022 01:31:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242009AbiCHGbH (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Mar 2022 01:31:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581503CA45;
        Mon,  7 Mar 2022 22:30:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DC580615ED;
        Tue,  8 Mar 2022 06:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B7F0C340FB;
        Tue,  8 Mar 2022 06:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646721011;
        bh=e36adnyi5LSWGX0SKleP5HljDauG6e7o4+faZH1RcRc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Xx52ruL29VRURPE4nPo6ii+helSJVFN8ubbubqCoUIXow+fPxlcKdNr/mdc85OhJI
         Ko4+MSYye5IJ2Egs9QAj3mU6dhTwUyueR5cT8jH3Y74+6Rr2J7rEYAHpCB4vX8kc/+
         62ZDldky8DnBOfqWHx7Iqtwk+M6aPGaet9AkI/TfVF87O1FzL4PcC+6uMrdpwlwfe+
         gyEF+hxxS0GarS/9g0OODnsdr5MxoAY59PwsKsly5KuvUgNAM3NGF0eNQCTgJwHrjF
         mq2+b/fQ3oRxicFf6c1Y6quzaMHAnZnvvZUGPvMz+Ruz6ioLys/t9UAG8uy6/4Wu9X
         9fnxDSN5ndlUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 35B15F0383B;
        Tue,  8 Mar 2022 06:30:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] vxlan_core: delete unnecessary condition
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164672101121.16776.2633185369226094504.git-patchwork-notify@kernel.org>
Date:   Tue, 08 Mar 2022 06:30:11 +0000
References: <20220307125735.GC16710@kili>
In-Reply-To: <20220307125735.GC16710@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     davem@davemloft.net, nikolay@nvidia.com, kuba@kernel.org,
        roopa@nvidia.com, edumazet@google.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 7 Mar 2022 15:57:36 +0300 you wrote:
> The previous check handled the "if (!nh)" condition so we know "nh"
> is non-NULL here.  Delete the check and pull the code in one tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This not a bug so a Fixes tag is innappropriate, however for reviewers
> this was introduced in commit 4095e0e1328a ("drivers: vxlan: vnifilter:
> per vni stats")
> 
> [...]

Here is the summary with links:
  - [net-next] vxlan_core: delete unnecessary condition
    https://git.kernel.org/netdev/net-next/c/8daf4e75fc09

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


