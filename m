Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC448C433F5
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Feb 2022 05:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiBVF2I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Feb 2022 00:28:08 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:46262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiBVF2A (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Feb 2022 00:28:00 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8282D64EF;
        Mon, 21 Feb 2022 21:27:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7919B817C8;
        Tue, 22 Feb 2022 05:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57AB4C36AE2;
        Tue, 22 Feb 2022 05:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645506010;
        bh=/PqYZf5r6+Aqii+pbnW7Z+lNM+oI3qXTnsQ8wKHVPLY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ilZlgT7IdiUNcJea0PeQI0R7CURJSk0dfA2ATTObB40g536kLj7XwL0/xkfSzVwzs
         Rx1gS+c5uaQWyt5YiCQv+ql/gacyLok8pEvt71S5Jsi/YwmTUtlixVW9e0PectbF2R
         rY+oakO2nPjI6d5jyoHCbYdF5U95UcQoO6F7y/Znp01Zeq8dWP9Kf/OIUJ6qi+Nhmw
         Wm2RJyaoflv65QWFNub46Tu/2qqavGqf+WNRN10T9RlbqU1tkvw//WNP8B8fLduAKY
         pdckQnwOp8M0WKZ5TF1+BAiKAQiuNY3mNwxFjPKanVtmBqfAZxhEIQSVLRYirHO+Ic
         E3WnEg992uA7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4179DE6D3E8;
        Tue, 22 Feb 2022 05:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net-next] net: dm9051: Fix use after free in
 dm9051_loop_tx()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164550601026.6244.16246516737928646971.git-patchwork-notify@kernel.org>
Date:   Tue, 22 Feb 2022 05:00:10 +0000
References: <20220221105440.GA10045@kili>
In-Reply-To: <20220221105440.GA10045@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     davem@davemloft.net, josright123@gmail.com, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 21 Feb 2022 13:54:40 +0300 you wrote:
> This code dereferences "skb" after calling dev_kfree_skb().
> 
> Fixes: 2dc95a4d30ed ("net: Add dm9051 driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Only record successful transfers
> 
> [...]

Here is the summary with links:
  - [v2,net-next] net: dm9051: Fix use after free in dm9051_loop_tx()
    https://git.kernel.org/netdev/net-next/c/b6553c71813f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


