Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4C8C001DF
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Oct 2023 23:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346663AbjJSXA2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Oct 2023 19:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346688AbjJSXA0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Oct 2023 19:00:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E73C115
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Oct 2023 16:00:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9C9CC433CA;
        Thu, 19 Oct 2023 23:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697756424;
        bh=Vr1YMWLyO6WEcECkLfSGgqDiO+leKIZ6xgblPqIjP28=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=AoBDjOzrPb66SWmhiJ1EXNJpX+UzzjNh0GPRdRoXO54mDEc/UEqjBXw7qPQ6PUd9J
         XDv0R5fOi32wVmHVX0mrgoW6uX8hL4O0Xd5GRwgjqi1OgkEc4c2HfmjGKDQcCUaFzZ
         B/ZiBeg0g2BhOmhsCW3OzTOpd7xbZX5dIoD+AsBbRAN4SKpwWJeltRGT4CPmtAd5Q2
         TryU02rDwzKy9oWvHh1HjHJtrjRTORoLVaCxd49x9yxxA3rntUSvkA2ZH1ccTdbKgq
         dRsn48RQDTLQ/k0nWgpr4vWMZqCUNNAGfz3BNWqsMzETeDNj6UrklFYMi4ZrJwYomx
         ao63lwveA76jg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9CA10E4E9B6;
        Thu, 19 Oct 2023 23:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ptp: prevent string overflow
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169775642463.1542.9537354184307476724.git-patchwork-notify@kernel.org>
Date:   Thu, 19 Oct 2023 23:00:24 +0000
References: <d4b1a995-a0cb-4125-aa1d-5fd5044aba1d@moroto.mountain>
In-Reply-To: <d4b1a995-a0cb-4125-aa1d-5fd5044aba1d@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     reibax@gmail.com, richardcochran@gmail.com, davem@davemloft.net,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 18 Oct 2023 17:20:11 +0300 you wrote:
> The ida_alloc_max() function can return up to INT_MAX so this buffer is
> not large enough.  Also use snprintf() for extra safety.
> 
> Fixes: 403376ddb422 ("ptp: add debugfs interface to see applied channel masks")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/ptp/ptp_clock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] ptp: prevent string overflow
    https://git.kernel.org/netdev/net-next/c/75a384ceda93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


