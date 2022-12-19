Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393AFC4332F
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Dec 2022 12:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbiLSMkU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Dec 2022 07:40:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbiLSMkS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Dec 2022 07:40:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806C3C6C;
        Mon, 19 Dec 2022 04:40:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B85D60F7E;
        Mon, 19 Dec 2022 12:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DDADC433F0;
        Mon, 19 Dec 2022 12:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671453616;
        bh=4PH+Dt04nM5TXGAUTkqGWDnE6DuDw4TPpKQaD9oynDs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cha1F02SfFZEVuR1DgTxNcHuzx2+s0xFTd98jf+KoxtIjXu2JL76n46VsXgSjOcmj
         SICWnj95ROl88Ex+RPg/RyLdmyW9WJDmcNiB0sOQ/p+rt7zhwMapCX4pHH9gAQcKSV
         F04Np4ExzBSsnF+QoGJ1wkWsr6IWrqjdtrnX9cztxm/SQSK8pqMoQUdxCMiUGmarVC
         jOGedBSQiOHWo5Ug1joJ5+Tn5ctIud+CupaDSMtEgFTO7TJgLKkuoy8Vo5xIlE6Sl0
         wwvhgXLIqaSFn58T2ChT16aC0CGz0t1o5OKLBuCWcjN33mWapvRXJTFEr+N6uZLXYj
         L3ICZmVLvhmpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 51A28E21EF8;
        Mon, 19 Dec 2022 12:40:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] myri10ge: Fix an error handling path in myri10ge_probe()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <167145361633.5637.13803811490044949479.git-patchwork-notify@kernel.org>
Date:   Mon, 19 Dec 2022 12:40:16 +0000
References: <f03711f1d0919017c081e273e16afd9009874fd4.1671386898.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f03711f1d0919017c081e273e16afd9009874fd4.1671386898.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     christopher.lee@cspi.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, gallatin@myri.com,
        brice@myri.com, jgarzik@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Sun, 18 Dec 2022 19:08:40 +0100 you wrote:
> Some memory allocated in myri10ge_probe_slices() is not released in the
> error handling path of myri10ge_probe().
> 
> Add the corresponding kfree(), as already done in the remove function.
> 
> Fixes: 0dcffac1a329 ("myri10ge: add multislices support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - myri10ge: Fix an error handling path in myri10ge_probe()
    https://git.kernel.org/netdev/net/c/d83b950d44d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


