Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6261C4332F
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Nov 2022 13:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiKUNKU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Nov 2022 08:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiKUNKR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Nov 2022 08:10:17 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1231763FB;
        Mon, 21 Nov 2022 05:10:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3674611B2;
        Mon, 21 Nov 2022 13:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1B11C433B5;
        Mon, 21 Nov 2022 13:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669036216;
        bh=/qjTt7hewFcnLOUJ5OxRWpExb4deKnOpdDFcmIiccCs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XkFFKfJvoRF7GlQJCIUDdosua/4HMfbzYgssNR7fKKBIwwc6Yv10UuQpQuqukJbSX
         IF0PSIUNgJ4nx/SGxnkV0LcfmwCA/CCDCHdJvHFu9uYSdiAmMBaxIrfa0/iFPlmV79
         22kgO5NYf7IjbPnEcYwYia7OqhiM7yxP3iG4Pw0gfXPdp8+3SJcg6O2OgH60ac3Zhm
         gkGwsIMiX3cVD03Yu/pAdMuDO+Jutmi2/v+sRaTM7Wb1MR+6PcM7dfk540oyIz+xd0
         g98M+ZyD3jcypi23DGWlxnjoOXkxSjSVL2YNGHQuEbOKdEVo2EaY0FmglxlJKmAQC0
         ZN00Y1UI6jHlA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7AA1C395FF;
        Mon, 21 Nov 2022 13:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] octeontx2-af: cn10k: mcs: Fix copy and paste bug in
 mcs_bbe_intr_handler()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166903621587.4573.17842069915148045364.git-patchwork-notify@kernel.org>
Date:   Mon, 21 Nov 2022 13:10:15 +0000
References: <Y3efyh1HjbToppbN@kili>
In-Reply-To: <Y3efyh1HjbToppbN@kili>
To:     Dan Carpenter <error27@gmail.com>
Cc:     sgoutham@marvell.com, gakula@marvell.com, lcherian@marvell.com,
        jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, vattunuru@marvell.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Fri, 18 Nov 2022 18:07:54 +0300 you wrote:
> This code accidentally uses the RX macro twice instead of the RX and TX.
> 
> Fixes: 6c635f78c474 ("octeontx2-af: cn10k: mcs: Handle MCS block interrupts")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> Applies to net.
> 
> [...]

Here is the summary with links:
  - [net] octeontx2-af: cn10k: mcs: Fix copy and paste bug in mcs_bbe_intr_handler()
    https://git.kernel.org/netdev/net/c/badbda1a0186

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


