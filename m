Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDA7C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 27 May 2022 07:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345866AbiE0HKh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 27 May 2022 03:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345208AbiE0HKQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 27 May 2022 03:10:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D12F1360;
        Fri, 27 May 2022 00:10:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8EB36B8232C;
        Fri, 27 May 2022 07:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 440A1C34118;
        Fri, 27 May 2022 07:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653635413;
        bh=A/2gODPzUDB9QlUQzay9mwbFSu2RC27by+yM3INsZvk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fOAZ+p4VJR7iVojcURe+zSE5KdLXwnklkGpP6wmc0B88zYw6i3mrENWg1mzNcWKog
         IsB4jo5qbH/bXGaHQyeViMHLP9bGWyZfJvgyR2fE675BqIIzOvuTiZyzPD0SnQ7omV
         V1vEhk/9bZ0L/R7+J75/Ad5SZ089t0f+xvDXGnz8TEollCJDNchGGm+ARlwSIJaq5G
         WlLTTJEiljjDO/NX+xQsRheQemSCbvifhpZAhHd/e+pIOALBFSL3vfFoIaUGVUWDFV
         MsO9CwEyvqZHw4OzVN5XvKbB7p3z5dFATOpEI7D+xbGwW0exbLNUbNDUqgzXyeF0yn
         lAqZSnms+bgmw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 233C3F0394E;
        Fri, 27 May 2022 07:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: out of bounds read in
 mtk_hwlro_get_fdir_entry()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <165363541314.15180.4008920253875767970.git-patchwork-notify@kernel.org>
Date:   Fri, 27 May 2022 07:10:13 +0000
References: <Yo80IuC/PRv7vF5m@kili>
In-Reply-To: <Yo80IuC/PRv7vF5m@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     nbd@nbd.name, nelson.chang@mediatek.com, john@phrozen.org,
        sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 26 May 2022 11:02:42 +0300 you wrote:
> The "fsp->location" variable comes from user via ethtool_get_rxnfc().
> Check that it is valid to prevent an out of bounds read.
> 
> Fixes: 7aab747e5563 ("net: ethernet: mediatek: add ethtool functions to configure RX flows of HW LRO")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - [net] net: ethernet: mtk_eth_soc: out of bounds read in mtk_hwlro_get_fdir_entry()
    https://git.kernel.org/netdev/net/c/e7e7104e2d5d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


