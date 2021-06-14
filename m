Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A36B1C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 19:50:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D48B610A0
	for <kernel-janitors@archiver.kernel.org>; Mon, 14 Jun 2021 19:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbhFNTw2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 14 Jun 2021 15:52:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:51598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234771AbhFNTwZ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 14 Jun 2021 15:52:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8DC7B6134F;
        Mon, 14 Jun 2021 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623700221;
        bh=4F1MUKY083YJFpzG4OkmjctvYKwSt3Ga0zgNFWKPBuQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=d6pTUNPAuGlxVwu06zyucKtApTgvZTNNdpRQqeZOMEiR5bG7qABgYPuHc2NZ1aBbf
         YL9PcHf+BbuL2z8RiAUXjnDEnM27sit3IRmlyaa26rpc6e4LX4jiogQQB3kFHGNUxt
         +BV16Kfp8sbtuv1Nbi1VBwcDlLxUb5ItIWdM0NmH1AWpD0OCkiZja975aiYajYi7tF
         acCZwyX1q6RYP4VyxQIPhol5TqjzUhU7UKUt6J019JIjJ+YxyZSuaO96sefyLhD04d
         q3NUanAy0eyGvwLmGFv+mcCM03904aJqaUZ65gjw260oDdBseuJ8qnAhmNm31QPY0L
         St0Ot+RwuxKSQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ipv6: fib6: remove redundant initialization of variable err
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162370022152.10983.454236042733995313.git-patchwork-notify@kernel.org>
Date:   Mon, 14 Jun 2021 19:50:21 +0000
References: <20210613134636.74416-1-colin.king@canonical.com>
In-Reply-To: <20210613134636.74416-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     davem@davemloft.net, yoshfuji@linux-ipv6.org, dsahern@kernel.org,
        kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun, 13 Jun 2021 14:46:36 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read, the
> assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - ipv6: fib6: remove redundant initialization of variable err
    https://git.kernel.org/netdev/net-next/c/b5ec0705ffe8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


