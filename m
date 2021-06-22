Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4415C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 17:50:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3BC261360
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 17:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232387AbhFVRwY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 13:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:51612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232348AbhFVRwW (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 13:52:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1EFBD61353;
        Tue, 22 Jun 2021 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624384206;
        bh=ESgFv0vtJ21tRzqywt1ll8Kx5wBSrdb3mdom7uZBV+4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WGmbPdZKWEIGOuZqUyeEYKlD8yyAVzaSEGw7QIDtMrfy4nWDiuFV/wtYkczckA1f9
         N3Dpy+/mDvhpsgfzSFkdo8Kg398LSI2a7yfDasev4x7VTNn7ATlvQtnLHTIMQHvMZK
         MNXRUGUxzKpsFCldIjm5qwq7Ox7C7tk3W0eUsFMgq36EsSTH4GF/SdydIQdIDyoF1e
         y8P0WlV0l5119sWWQ1x6D4cd03bfy1R9SbTZBT+en5/y0724KL9rd0D4HDCOTIaQAe
         jhVi4HMQ9sqCEyEh7af/qrlLcT+MHUwZnxWfbeFMvAK6oyAov278A/jr3zIESMB7eH
         NAdIGpOWsGlzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] stmmac: dwmac-loongson: fix uninitialized variable
 in loongson_dwmac_probe()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162438420605.559.7709125546546487044.git-patchwork-notify@kernel.org>
Date:   Tue, 22 Jun 2021 17:50:06 +0000
References: <YNHOz8Aqo7Y1ZwO+@mwanda>
In-Reply-To: <YNHOz8Aqo7Y1ZwO+@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
        joabreu@synopsys.com, davem@davemloft.net, kuba@kernel.org,
        mcoquelin.stm32@gmail.com, zhangqing@loongson.cn,
        jiaxun.yang@flygoat.com, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 22 Jun 2021 14:51:43 +0300 you wrote:
> The "mdio" variable is never set to false.  Also it should be a bool
> type instead of int.
> 
> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] stmmac: dwmac-loongson: fix uninitialized variable in loongson_dwmac_probe()
    https://git.kernel.org/netdev/net-next/c/b0e03950dd71

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


