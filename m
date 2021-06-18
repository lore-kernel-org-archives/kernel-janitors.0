Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E40C48BDF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 19:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7E7E60041
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 19:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235442AbhFRTWR (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 15:22:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:33892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235336AbhFRTWQ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 15:22:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 78812613E2;
        Fri, 18 Jun 2021 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624044006;
        bh=eaesH0rU8L/78a2RrPwncEIIlrB4iY2N8ZsCl6xI6EI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sNaNf6h/Kbue8FxIoorCWl6HXNWbmDMMDJ2wi8zSlczJw9W4fjB2p9GjBzgUG6fPj
         TW+rEmUav2urY/77LzusoueB5r2okOvh+bi6bQPw3C2iA5T6a3He2eAFCiWomYjOzm
         qvLiQb5mA+mfvNfqrFMOeQhgnIkVr3FDp5WbL1YWgl3HQzRcUZUmCvYntsUauPffO6
         zpRtopdH02TryYhIkTRfCGi4eeA6KAWxt1mMt9liA/haozOlQypFgurkUZuwA+Ddbw
         pp4YnkyohXXfrItMLipANfCCBs0sLoib6jCjrR7vOwMXPsg9YxE1+uYEjy1ffeCoWD
         mXG0JzMUJXpZg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] qlcnic: remove redundant continue statement
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162404400646.12339.12450707599661304526.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Jun 2021 19:20:06 +0000
References: <20210618101919.101934-1-colin.king@canonical.com>
In-Reply-To: <20210618101919.101934-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     shshaikh@marvell.com, manishc@marvell.com,
        GR-Linux-NIC-Dev@marvell.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 18 Jun 2021 11:19:19 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> it is redundant and can be removed.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - qlcnic: remove redundant continue statement
    https://git.kernel.org/netdev/net-next/c/60ae9f883138

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


