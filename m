Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11ECC433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 20:20:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE8B86135D
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Apr 2021 20:20:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238588AbhDLUU3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Apr 2021 16:20:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237307AbhDLUU1 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Apr 2021 16:20:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DCA0F61350;
        Mon, 12 Apr 2021 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618258808;
        bh=hDc03qdDcRaLTGdQJtn+mUwRRaNWd6iE0dt5Sd4a71Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Db7CGVessknQvEfm2YOz9P2q37Zdl6URhFa9UII2Qyw1D+hZcQ4oHsoC0w503mKer
         XfBQiPL6iTPI9X07U96RUBLIg8vyjS2DWBJzsTCnzSAktVDAnxK9FjLmVkm5ABPeJb
         yd5OkMVAmRcaujphByYXildBF0fJSignXvKdztd1Pt0QV6Y7rwC99GwuqMEtoO/fQ8
         M2njUr+HARXIc12Yi8tjK8pPXC4op4ch+NZvQfEBHZkM+0EctsPQbwO5L+TbsE8G+f
         sk2UktC8LORo+9SB6RpcKwLfgXXYCYxVZ4pUd6gPwsBUGiJPGwtGrZiP2N3bha5SCC
         VHk8qlSQk1Eiw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] cxgb4: Fix unintentional sign extension issues
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161825880883.1346.7456912721949180791.git-patchwork-notify@kernel.org>
Date:   Mon, 12 Apr 2021 20:20:08 +0000
References: <20210409110857.637409-1-colin.king@canonical.com>
In-Reply-To: <20210409110857.637409-1-colin.king@canonical.com>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     rajur@chelsio.com, davem@davemloft.net, kuba@kernel.org,
        rahul.lakkireddy@chelsio.com, kumaras@chelsio.com,
        ganeshgr@chelsio.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri,  9 Apr 2021 12:08:57 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shifting of the u8 integers f->fs.nat_lip[] by 24 bits to
> the left will be promoted to a 32 bit signed int and then
> sign-extended to a u64. In the event that the top bit of the u8
> is set then all then all the upper 32 bits of the u64 end up as
> also being set because of the sign-extension. Fix this by
> casting the u8 values to a u64 before the 24 bit left shift.
> 
> [...]

Here is the summary with links:
  - cxgb4: Fix unintentional sign extension issues
    https://git.kernel.org/netdev/net-next/c/dd2c79677375

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


