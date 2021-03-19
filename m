Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDD2C433E3
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 19:20:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5336F6197B
	for <kernel-janitors@archiver.kernel.org>; Fri, 19 Mar 2021 19:20:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhCSTUT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:20:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:44566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230221AbhCSTUI (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 19 Mar 2021 15:20:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 89E2D6197A;
        Fri, 19 Mar 2021 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616181608;
        bh=yEMZQtZbCOePOV5+OM4LMyiQVt8RhDn1apelcQpoDco=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bLc+BCu9bl/ot16XpTZeeNR7kfUp3zx8JaBRz+Dyhu5KDDVTwkFeqO+D/ymbo6c4A
         IDDv3DgRt/Z1Y+tNexu4J9nmkY/MDNYLEVFGIFAO3FZEZISh/TUZIpGTTT3JV3rEkH
         uqUnvyNCpL3BU5sARQyALprCK0adWzygZBah0KcFwODee546L8P4g2j7PMHBdzrHf2
         Z1tP8CF7IiB/LneAwvcHfGZeVTuSnpfzmTLZFlWe1yPQsTxVWLcrB+1Ztbye+BoGLN
         g6ka9whisV7o9vmvN5QiEDUPtUech0jo2P2P+BvD/a03a6749pvM2pMWf944Wwr8of
         8mRmljWRfIFGA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] octeontx2-pf: Fix missing spin_lock_init() in
 otx2_tc_add_flow()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161618160848.4810.12360157378814720132.git-patchwork-notify@kernel.org>
Date:   Fri, 19 Mar 2021 19:20:08 +0000
References: <20210319094103.4185148-1-weiyongjun1@huawei.com>
In-Reply-To: <20210319094103.4185148-1-weiyongjun1@huawei.com>
To:     'w00385741 <weiyongjun1@huawei.com>
Cc:     sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
        hkelam@marvell.com, kuba@kernel.org, naveenm@marvell.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        hulkci@huawei.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 19 Mar 2021 09:41:03 +0000 you wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The driver allocates the spinlock but not initialize it.
> Use spin_lock_init() on it to initialize it correctly.
> 
> Fixes: d8ce30e0cf76 ("octeontx2-pf: add tc flower stats handler for hw offloads")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] octeontx2-pf: Fix missing spin_lock_init() in otx2_tc_add_flow()
    https://git.kernel.org/netdev/net-next/c/140960564d63

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


