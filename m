Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95FEC4332B
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87E4964DDA
	for <kernel-janitors@archiver.kernel.org>; Thu,  4 Mar 2021 00:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355251AbhCDAVs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:21:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:46106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1445769AbhCCQus (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 3 Mar 2021 11:50:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D204964ED7;
        Wed,  3 Mar 2021 16:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614790206;
        bh=8k3m8Z3dLBk+naOkfcZx9VgqX4UmrgK5Fe+gHEK03W8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nqD/XPnpuJAGYRoBtdjEUjuLFA/ioRw0o4QpElLb7jxIOzmbVSSjJMtFi3W54gcrG
         x3F4rOA0189qdGGbeyBPRgNKhlG50SwA/7S1XDYlHFxf9SOSjIxYvMiNBCht8SVrOF
         ib6lERUnrm4ELpFnLteE/2TCnK0Au7HdpFyPWOwpoHmJ8ir6st/ZOIE5l2mY+QG3Fl
         klgyaoVOFKreKQrOKoGdZmQzWTulot3d3OkII1QNBGzv19skUTVuhEmczYroOENush
         mfCJofaBIAfS4zedCQuwKg06gO+kHJWyBbU/Ujc8WTr+Ba2H3MDWQZ9D7EgEfXZ2tq
         xAI4eflmJRccw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] octeontx2-af: cn10k: fix an array overflow in
 is_lmac_valid()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161479020681.31057.13525523145605254312.git-patchwork-notify@kernel.org>
Date:   Wed, 03 Mar 2021 16:50:06 +0000
References: <YD4f0vIQ1bW++7M7@mwanda>
In-Reply-To: <YD4f0vIQ1bW++7M7@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     sgoutham@marvell.com, hkelam@marvell.com, lcherian@marvell.com,
        gakula@marvell.com, jerinj@marvell.com, sbhatta@marvell.com,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue, 2 Mar 2021 14:21:54 +0300 you wrote:
> The value of "lmac_id" can be controlled by the user and if it is larger
> then the number of bits in long then it reads outside the bitmap.
> The highest valid value is less than MAX_LMAC_PER_CGX (4).
> 
> Fixes: 91c6945ea1f9 ("octeontx2-af: cn10k: Add RPM MAC support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net] octeontx2-af: cn10k: fix an array overflow in is_lmac_valid()
    https://git.kernel.org/netdev/net/c/2378b2c9ecf4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


