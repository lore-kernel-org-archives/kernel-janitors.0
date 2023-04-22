Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47057C77B61
	for <kernel-janitors@archiver.kernel.org>; Sat, 22 Apr 2023 03:40:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjDVDkX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 23:40:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjDVDkW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 23:40:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CC5619BE;
        Fri, 21 Apr 2023 20:40:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ECB5364286;
        Sat, 22 Apr 2023 03:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53783C4339B;
        Sat, 22 Apr 2023 03:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682134820;
        bh=RLP/2m8RwSH8R2aiYXsHT+BntgUWUSNouFWYyBylVtg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eiJVvPZJbAuZZ3xaTPn6hcnlf2KSDVsDNh4E3tKddE7sZ2cH8ucQ99vC/GF1Gl6tI
         ELavVOE5K0EZTjOD8P6uorEV+Vd1hQlpsF6vn/TvpiFqiOmPr5YWq+6XRkHYfywL8j
         H/kCZboQxBDmx1faY6WeSJOx4jwJLD0uCvla1n+YiH6ohZ8idBFKmD52DcWDY/+BKX
         H/8AaSWikGkTJkRywADq8cMlF4DBrFrX9Y9w338MlnryPfn0nAQDK8QS/2lytwykmB
         FMY9cwnd2iTQ3VIPfmElX6BmeO3YsEuCDafZ5bfqoXXZ6eYsEiuAS91U8Dx8G7deFh
         6ewKuQ4d5+TbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 33D16E270E1;
        Sat, 22 Apr 2023 03:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: dpaa: Fix uninitialized variable in dpaa_stop()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168213482020.27640.7528389434326358303.git-patchwork-notify@kernel.org>
Date:   Sat, 22 Apr 2023 03:40:20 +0000
References: <8c9dc377-8495-495f-a4e5-4d2d0ee12f0c@kili.mountain>
In-Reply-To: <8c9dc377-8495-495f-a4e5-4d2d0ee12f0c@kili.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     sean.anderson@seco.com, madalin.bucur@nxp.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        camelia.groza@nxp.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 20 Apr 2023 15:36:07 +0300 you wrote:
> The return value is not initialized on the success path.
> 
> Fixes: 901bdff2f529 ("net: fman: Change return type of disable to void")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Applies to net.
> 
> [...]

Here is the summary with links:
  - [net] net: dpaa: Fix uninitialized variable in dpaa_stop()
    https://git.kernel.org/netdev/net/c/461bb5b97049

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


