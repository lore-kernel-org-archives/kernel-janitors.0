Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C53CC48BE5
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Jun 2021 07:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5D2A61166
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Jun 2021 07:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbhFPHmM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Jun 2021 03:42:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:52426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231453AbhFPHmL (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Jun 2021 03:42:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 60BF561055;
        Wed, 16 Jun 2021 07:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623829205;
        bh=n6KYaRZChtwsmZfylOtr48k0Hw78Q3ejCS1D94NPwyE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=T3XT3HXszAtVxyxilXjS1sbSdWiAOmsde/xC9obFTFPe1rouwkC2D1eG0/V3Fnpkr
         JWK66/z85wzckyLalGWCwX9g2phCF5ufremigVvWmJbSUFpYBDw57sAEooIabcWInF
         PqL2LD/X4CbnWEsdl+xQUKThNOdhgRPzU8gglNfD/bGDiya+Ee5Uk2HT1ufSzcNWXl
         zsmTnYkU1Rr4z0Kp4TJtP56hyVZRFeRw9MgWXh2as9T6qR3fL82oMEwAz3NIYIKUWE
         Xz2BLvepmLVoNWfrvv/Hm02biIVCd02N//rzjI3WQslXk8QIQHCCuJNz/t4sR1gmjv
         vMJqJRlXl1NAA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: mhi: Make symbol 'mhi_wwan_ops' static
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162382920533.32075.12612530734600769555.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Jun 2021 07:40:05 +0000
References: <20210615172159.2841877-1-weiyongjun1@huawei.com>
In-Reply-To: <20210615172159.2841877-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     davem@davemloft.net, kuba@kernel.org, loic.poulain@linaro.org,
        mani@kernel.org, hemantk@codeaurora.org, subashab@codeaurora.org,
        yangyingliang@huawei.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, hulkci@huawei.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 15 Jun 2021 17:21:59 +0000 you wrote:
> The sparse tool complains as follows:
> 
> drivers/net/mhi/net.c:385:23: warning:
>  symbol 'mhi_wwan_ops' was not declared. Should it be static?
> 
> This symbol is not used outside of net.c, so marks it static.
> 
> [...]

Here is the summary with links:
  - [net-next] net: mhi: Make symbol 'mhi_wwan_ops' static
    https://git.kernel.org/netdev/net-next/c/1d0bbbf22b74

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


