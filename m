Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE0BC433B4
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 22:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDBEA61279
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 22:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231246AbhDGWUv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 18:20:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229793AbhDGWUk (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 18:20:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 47A2D61369;
        Wed,  7 Apr 2021 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617834030;
        bh=UqrQT7ev9ck9uLtB9T7pI/UcQ1D8TKXKEMZCL9ESY6U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BxNGbzJwEHX29kaLhoPiJ/aMPwUS4QqbWeyaFNZSbwqgS0xnr7PKyPcivguLLVY4L
         Xj8Rr00G2V+Bl4Da447XSfoZRr8QASdpDv5HIqFDYvk8H5grZmaKhhdxWVUmSv0p3c
         OPgw/ifgUMbJC2R9fT1EnIaFP4tSpwrLkcGKsPhJpcK60mcNtOwABogGxpuLfpkvyD
         EtYMpAbREkcDhn+EhPGN7oyeWeOFAa1Viiq1dGgnfVXotvZ7WM80/ubMlrFgeJim5/
         rrohVSjMO/bYubKzk/k2nGINfQqg+lBj9/xkxwvYq06SYZxkaYH29VVbNy9ie/9GOh
         X3gMDs40kzvyQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: sundance: use module_pci_driver to simplify the
 code
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161783403025.11274.3729728433464332126.git-patchwork-notify@kernel.org>
Date:   Wed, 07 Apr 2021 22:20:30 +0000
References: <20210407150709.365762-1-weiyongjun1@huawei.com>
In-Reply-To: <20210407150709.365762-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     kda@linux-powerpc.org, kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 7 Apr 2021 15:07:09 +0000 you wrote:
> Use the module_pci_driver() macro to make the code simpler
> by eliminating module_init and module_exit calls.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/dlink/sundance.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)

Here is the summary with links:
  - [net-next] net: sundance: use module_pci_driver to simplify the code
    https://git.kernel.org/netdev/net-next/c/f670149a4f5f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


