Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF3CEE645C
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 13:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235214AbjIONAc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 09:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbjIONAb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 09:00:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE5CE7
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 06:00:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC091C43391;
        Fri, 15 Sep 2023 13:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694782826;
        bh=76yJ9uq8Wm+A3ULyt02D/DhghQd9p17VeJRR0YidpVc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TP80jSjES0FygjSQJzpZI1AOdT2qPFuG8Uv7UhS8JB+LDfP9kH6XE6xvLfXLmoYZv
         v7o8JP4gYHae/MoPn2adQgdxKv8RUS4bzBLabwW+9rZ8Dk4n+mSqqEft25rPIit1xz
         jTcCvw63Bi8Wpp6J9dxO5ZfGDSdVuahB/avNgNpOf21BlsXVl3uEJ/ZQDdB9O7FEYq
         sC4qMSQGleksLv787AJAfveWF7ZOW2K1Tb5jspqfeWhVJQ1xj0iNntUgbeYNfHZdpv
         J/ze7gGk+sFcIeYvo+GgRXNy0n3Dl1dEkJwEgIjbc+o3cwtjr8gTOLNMVO1B2kDJnb
         UWcyXfIegQYCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A108FE22AF6;
        Fri, 15 Sep 2023 13:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] tcp: indent an if statement
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169478282665.10241.11990246045934976904.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Sep 2023 13:00:26 +0000
References: <de6b9eed-7049-45c6-aa49-ca7990c979c8@moroto.mountain>
In-Reply-To: <de6b9eed-7049-45c6-aa49-ca7990c979c8@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     edumazet@google.com, davem@davemloft.net, dsahern@kernel.org,
        kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 13 Sep 2023 12:36:29 +0300 you wrote:
> Indent this if statement one tab.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Applies to net and net-next, but it's just a white space issue so it
> should go into net-next.
> 
> [...]

Here is the summary with links:
  - [net-next] tcp: indent an if statement
    https://git.kernel.org/netdev/net-next/c/4fa5ce3e3a10

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


