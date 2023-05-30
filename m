Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E14EC77B7A
	for <kernel-janitors@archiver.kernel.org>; Tue, 30 May 2023 05:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjE3FKY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 30 May 2023 01:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjE3FKX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 30 May 2023 01:10:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EB0E8
        for <kernel-janitors@vger.kernel.org>; Mon, 29 May 2023 22:10:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF0AB6226D
        for <kernel-janitors@vger.kernel.org>; Tue, 30 May 2023 05:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0865DC433D2;
        Tue, 30 May 2023 05:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685423421;
        bh=vk92pUrdZgf6BAIvS8xJuaMroCSpDnuHXtMSOdBHGU8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=otEzTFz26u3L+I8wp8hzdCM5DGSzAA4iUnE8FlfZm7ewt7opqfAIZYDXNik4YnpGk
         JNapdHTD5SrMSoqEfZnLv/81Pnm7VSixn9GiVwr4Eg3K7r61tgdQmX6OmasX7x+fFp
         8HaKf7kH6UGwkRaFHE9nFTQsnhXH2CzD7MaYXVXbr2j+lSHZaZAblyMh3ceS9fOk/C
         XCwfOfVwbrFF/j1m2hv5wc+6W6VGcg/e+rAMilREmelYVVRPPM/aog3YpMahE4s265
         wZHEJJCdtUWFN31YWw3SMnHFDRFJTHkY+mPPEu++efQHn812WSDzNGo0ncHOMn54UV
         uuCCcgYJncnoA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D9096E52BF8;
        Tue, 30 May 2023 05:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: fix signedness bug in skb_splice_from_iter()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168542342088.26777.17946753562179966194.git-patchwork-notify@kernel.org>
Date:   Tue, 30 May 2023 05:10:20 +0000
References: <366861a7-87c8-4bbf-9101-69dd41021d07@kili.mountain>
In-Reply-To: <366861a7-87c8-4bbf-9101-69dd41021d07@kili.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     dhowells@redhat.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, alexanderduyck@fb.com,
        brouer@redhat.com, asml.silence@gmail.com, keescook@chromium.org,
        jbenc@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 26 May 2023 16:39:15 +0300 you wrote:
> The "len" variable needs to be signed for the error handling to work
> correctly.
> 
> Fixes: 2e910b95329c ("net: Add a function to splice pages into an skbuff for MSG_SPLICE_PAGES")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: tidy up a style mistake in v1.
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: fix signedness bug in skb_splice_from_iter()
    https://git.kernel.org/netdev/net-next/c/ef1bc119ceb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


