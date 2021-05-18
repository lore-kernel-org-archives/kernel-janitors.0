Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0004C433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 May 2021 20:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 857A86135B
	for <kernel-janitors@archiver.kernel.org>; Tue, 18 May 2021 20:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352010AbhERUvc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 18 May 2021 16:51:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:36280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238356AbhERUvb (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 18 May 2021 16:51:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E234361355;
        Tue, 18 May 2021 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621371012;
        bh=Sbsa1uGP6vqypWZFm6ZfaCJuMcHe7ruZ2zbbkgBjesI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sXnl6H2oq2g7VRUWH2sM2RUs/NLV7ha1b8JwlB35Zk6kZvXnZ8rlcJtMdqLz92l9V
         du4rwz15cA7jGPYy7tmvEjJyz+rs9Aj09pA5JYrHKQ74IsEJAiSYc/QbT5XQ+Yzcx2
         Uike/4fRzNOXe846FqcFAuR0qfj3zITHOsBOgjtqPGwt8sb1aVN0hBTp4yYLCcHONF
         nkMj/pByccRsQrE1FBo+Oow3t1ukI1YYY55gbYad4qmLmN2jqa64v5OUyt6PiNUBHa
         Jcw//qOmk2G4e/MYBlwihF9aKPIXFGVYmOSVRb+BYIur8/prQdqnLrVVGLEVuil2Mu
         niE+OHWDkZpLA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: dsa: qca8k: fix missing unlock on error in
 qca8k_vlan_(add|del)
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162137101285.13244.15041383280095302302.git-patchwork-notify@kernel.org>
Date:   Tue, 18 May 2021 20:50:12 +0000
References: <20210518112413.622913-1-weiyongjun1@huawei.com>
In-Reply-To: <20210518112413.622913-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     ansuelsmth@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com,
        f.fainelli@gmail.com, olteanv@gmail.com, davem@davemloft.net,
        kuba@kernel.org, linux@armlinux.org.uk, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, hulkci@huawei.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 18 May 2021 11:24:13 +0000 you wrote:
> Add the missing unlock before return from function qca8k_vlan_add()
> and qca8k_vlan_del() in the error handling case.
> 
> Fixes: 028f5f8ef44f ("net: dsa: qca8k: handle error with qca8k_read operation")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: dsa: qca8k: fix missing unlock on error in qca8k_vlan_(add|del)
    https://git.kernel.org/netdev/net-next/c/0d56e5c191b1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


