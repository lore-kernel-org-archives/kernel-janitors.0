Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51856C433DB
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 23:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 074F5619BB
	for <kernel-janitors@archiver.kernel.org>; Wed, 24 Mar 2021 23:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbhCXXaM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 24 Mar 2021 19:30:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:35430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234162AbhCXXaJ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 24 Mar 2021 19:30:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A002B619BB;
        Wed, 24 Mar 2021 23:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616628608;
        bh=N/IOpDViPHIMCR+sOkldj+gj1c2A8leVbB+Jhjus8ww=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fOzUoBgWeRKP7kOQ5tLtIMWrdJQZDA0U4zTl/2Zr1gTD3XJGvaUmRRy3bI17k5Urn
         F8kjqUMqJTXpBxYz/oqXOcZOsSy4JEAC4Kk94WiyfhLZPy6XxnB1UXCaqU2zCM62HT
         rjtEypW8S+SCklUGgbTpR/FSBJJ2V+BiGU4SoYrAbOmCeygw/pkZi2HXAHScCRsek3
         kPc4KBiNXbhC4AXFlXlZElDAqIkg4e88Erv7WZU+kp3lcmi66p4f9/dAnEWT0qsmuf
         TjYmCz93iSrA2UwgU5sSlPUC60s8stbG3NGWAfDFM5ueKv1KDhMddNgB0V3YPCszkC
         gl3LLheByWL6w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] netdevsim: switch to memdup_user_nul()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161662860859.17876.4874076111438391425.git-patchwork-notify@kernel.org>
Date:   Wed, 24 Mar 2021 23:30:08 +0000
References: <20210324144220.974575-1-weiyongjun1@huawei.com>
In-Reply-To: <20210324144220.974575-1-weiyongjun1@huawei.com>
To:     'Wei Yongjun <weiyongjun1@huawei.com>
Cc:     kuba@kernel.org, jiri@mellanox.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, hulkci@huawei.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 24 Mar 2021 14:42:20 +0000 you wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Use memdup_user_nul() helper instead of open-coding to
> simplify the code.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] netdevsim: switch to memdup_user_nul()
    https://git.kernel.org/netdev/net-next/c/20fd4f421cf4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


