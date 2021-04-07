Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C2B3C43460
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 22:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CC3761246
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 22:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbhDGWUt (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 18:20:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229830AbhDGWUk (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 18:20:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5D79761394;
        Wed,  7 Apr 2021 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617834030;
        bh=NwqfEF5puSiw4XjIkPal7Ss/P15jKGza2VaVQNM39aw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LD3mVskP7zh7IkxePhKToIV8hNky6ra6pgjetSjAH9cSnCPD855KYQKNwKMievIyu
         DhEfomg9LOYrJS3X2Yn6eB3PPqbY8rCBC4l3RSIAw0O1FKEVbp28Uu+ZeNu255dhfv
         hM2A+Bygr4pV1h4OzuO/TK+D3szDN/943IuRkbvnkMY6QN1oYrR8hRa1iC2QH3HQ5H
         MkNc1lY6vKSkEU8UQhlQHdqzHQylogOUclzjnVTPmfYpgLW5hm/+hg+useIjDoBd4o
         3I4GV56ZxZMUaqnXr9289Xf9h8KGaCRct6Aadypd9mJpgLyKAZUpWcwo+eL2zCQ5KU
         njdk14sdlI7DQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: fealnx: use module_pci_driver to simplify the
 code
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161783403036.11274.12231782279411930072.git-patchwork-notify@kernel.org>
Date:   Wed, 07 Apr 2021 22:20:30 +0000
References: <20210407150712.368934-1-weiyongjun1@huawei.com>
In-Reply-To: <20210407150712.368934-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     kuba@kernel.org, christophe.jaillet@wanadoo.fr,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 7 Apr 2021 15:07:12 +0000 you wrote:
> Use the module_pci_driver() macro to make the code simpler
> by eliminating module_init and module_exit calls.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/fealnx.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Here is the summary with links:
  - [net-next] net: fealnx: use module_pci_driver to simplify the code
    https://git.kernel.org/netdev/net-next/c/3cd52c1e32fe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


