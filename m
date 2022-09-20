Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF0CC6FA8E
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Sep 2022 21:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbiITVkX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Sep 2022 17:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiITVkS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Sep 2022 17:40:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3FE3A4B7;
        Tue, 20 Sep 2022 14:40:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2401762E3B;
        Tue, 20 Sep 2022 21:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86414C433D7;
        Tue, 20 Sep 2022 21:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663710016;
        bh=4sU7ecHwWPojN4jm0SQPY2aAJq/hd8C5UTIUOCeQ6Vs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bQQO51Ll6adjRFnYxA55iOgIlGt53Zdluz86UuyNRahF6hHRhde/C8//ShZvHrnRA
         bHS+BY3DnZ6VaRZ03p5tVnrpf8CbhkEsOIlJzR2irOqDIY1ZR+MZ39WKvAvQ4Zl00R
         Fjed+WG+8RB2Xmf4cSb19532VUSxrQdYIM+Sb7w8VAGvqkInbVX2y7T38jXsTaYAai
         0NyYAaQlmCg4qGKrh9sNQ1ytouxhgxrRImmnfkD/tOu3WbyA26MDGlfXIJ6Hca+YF/
         f0aVlLeK58h3+leVhmxR/+ZOzjrvS1qTFMgQj5R4Efah/dz8PMmHx9oBG9X/+pt9YT
         9v/aW5kAv2Leg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 69654E21EE2;
        Tue, 20 Sep 2022 21:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: make NET_(DEV|NS)_REFCNT_TRACKER depend on NET
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166371001642.7760.2082528617719201998.git-patchwork-notify@kernel.org>
Date:   Tue, 20 Sep 2022 21:40:16 +0000
References: <20220915124256.32512-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20220915124256.32512-1-lukas.bulwahn@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 15 Sep 2022 14:42:56 +0200 you wrote:
> It makes little sense to ask if networking namespace or net device refcount
> tracking shall be enabled for debug kernel builds without network support.
> 
> This is similar to the commit eb0b39efb7d9 ("net: CONFIG_DEBUG_NET depends
> on CONFIG_NET").
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> [...]

Here is the summary with links:
  - net: make NET_(DEV|NS)_REFCNT_TRACKER depend on NET
    https://git.kernel.org/netdev/net-next/c/caddb4e0d639

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


