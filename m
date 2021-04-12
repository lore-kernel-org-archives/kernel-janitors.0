Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFC7C433B4
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 20:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 113786135C
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 20:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237640AbhDLUU2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 16:20:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237498AbhDLUU1 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 16:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E48AD61358;
        Mon, 12 Apr 2021 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618258809;
        bh=2gGAtFIQ0MAgGy4DzQXHbX0k2e1cSitVuMJ/HPaJCe4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Awh9FP9uoMpAAlm27B2np+20+ZUfucofkBo/XeDmaEIc9Q7zBYSPglDd4Dw/dQXVo
         FgQKfpwI4eI4u6ApaSQk1+MFmzfrX9swDO2V/S2BzTgvAcMYTK+BpGBVIQg+EN1wQW
         OlvAhDvUkKfpPYFxw7azk6cYK0oQUXvRc8TEWUGekbanLyewMp3SbiI93iPbNbqKUf
         b/1iOK3YfdYUyevDgQ8HaUEU6o7ii/v4l+fyqCrYGxY71MhFEfKbt7NkqE8/cJl92U
         zzHsF7MJayOv3YTKV7rblcx0wHxiDmy+vhi2gZB4vykfDPnuQI+HETM8TSY35HUFGw
         5bhR2AaxgAlcg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: thunderx: Fix unintentional sign extension issue
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161825880887.1346.11596655945494608028.git-patchwork-notify@kernel.org>
Date:   Mon, 12 Apr 2021 20:20:08 +0000
References: <20210409130726.665490-1-colin.king@canonical.com>
In-Reply-To: <20210409130726.665490-1-colin.king@canonical.com>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     sgoutham@marvell.com, davem@davemloft.net, kuba@kernel.org,
        ganapatrao.kulkarni@caviumnetworks.com, david.daney@cavium.com,
        svangala@cavium.com, tsrinivasulu@caviumnetworks.com,
        linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri,  9 Apr 2021 14:07:26 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of the u8 integers rq->caching by 26 bits to
> the left will be promoted to a 32 bit signed int and then
> sign-extended to a u64. In the event that rq->caching is
> greater than 0x1f then all then all the upper 32 bits of
> the u64 end up as also being set because of the int
> sign-extension. Fix this by casting the u8 values to a
> u64 before the 26 bit left shift.
> 
> [...]

Here is the summary with links:
  - net: thunderx: Fix unintentional sign extension issue
    https://git.kernel.org/netdev/net-next/c/e701a2584036

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


