Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512DAC433ED
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 00:30:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C36261A01
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 00:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbhCZAaV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Mar 2021 20:30:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229988AbhCZAaM (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Mar 2021 20:30:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 32BB261A38;
        Fri, 26 Mar 2021 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616718612;
        bh=y4vnvRxAN5F3xsx1GVvdx4Qj5uxf5Mg6sp7x7FMmPQY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JWCLavrcfSPwwi7J0XwmJ+avytStV4Zpqb52YNA9tDXPKhcxpTgWXGtrJQ32w2LxQ
         QDmuODEvLQryyUgzf4YayQR6MwwrnF8WExuwgn6mMYUAk/eejIL/5l8ocRA+uJO12u
         XsQwmNWCpCDh78xo28sTMpMWtngwNUYVGl8eqagmoSD8fHdngHMiwC+S/E8CuOZoUA
         n8we7oSa4ShMyMByZzYdZkh22qEktfBnK1xI1Heqkv39oLuKk7GCLjmyZVQECDU3gi
         u6n55c2tQpJIDfALtyL0u0OeUfGxQX5Pu4uqLaITPiR8md3NN/nsPxg9UrKUuIVCKu
         +4aBc3j7UdQpg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: ethernet: mtk_eth_soc: remove unused variable
 'count'
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161671861218.2256.13897972027932526674.git-patchwork-notify@kernel.org>
Date:   Fri, 26 Mar 2021 00:30:12 +0000
References: <20210325093151.5913-1-linqiheng@huawei.com>
In-Reply-To: <20210325093151.5913-1-linqiheng@huawei.com>
To:     'Qiheng Lin <linqiheng@huawei.com>
Cc:     nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
        Mark-MC.Lee@mediatek.com, kuba@kernel.org, matthias.bgg@gmail.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        kernel-janitors@vger.kernel.org, hulkci@huawei.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 25 Mar 2021 17:31:51 +0800 you wrote:
> GCC reports the following warning with W=1:
> 
> drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c:80:9: warning:
>  variable 'count' set but not used [-Wunused-but-set-variable]
>    80 |  int i, count;
>       |         ^~~~~
> 
> [...]

Here is the summary with links:
  - [net-next] net: ethernet: mtk_eth_soc: remove unused variable 'count'
    https://git.kernel.org/netdev/net-next/c/ae8f5867d590

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


