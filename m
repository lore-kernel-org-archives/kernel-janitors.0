Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65BEC433B4
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Apr 2021 21:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BABE6140C
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Apr 2021 21:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239127AbhD0VKy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Apr 2021 17:10:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:38786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239023AbhD0VKx (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Apr 2021 17:10:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D697861131;
        Tue, 27 Apr 2021 21:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619557809;
        bh=XZtLPCGvejEbYuOWPHBB9aqlMa5O6TS6ENl5COpcMDM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=teZErLRUCoQl9vFmo+sFr1Zx98OZjqddFyT1llIoHeWqS6zr1hAD4mHydKFUburBW
         DzqSMQpCPzc/ZtK3aVm44wUKh5kc3VBG4DvmbyIfulQjMOrzc7VIzfyBU40VqrJ8A6
         41Z7ezw9aAg5cCEB9bMbVcxkNY+zhVWtfvePHfGhbImNePge7+nwyT8/Lp5vkoBhJ9
         1hTlSAVMezTYvP90SayJRrfqWJzue17G4SZO3FEt5HTOr5Fzwo6DvNluIPBhEZ0Sh2
         awnSHzYFLdbownsMBUgQswjCGR79trDznEZjRD539kw89L6OcAYb1akL0InFTiL8OB
         hG/ayUQql5c4w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] macvlan: Use 'hash' iterators to simplify code
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161955780983.15707.7488640681639532297.git-patchwork-notify@kernel.org>
Date:   Tue, 27 Apr 2021 21:10:09 +0000
References: <fa1b35d89a6254b3d46d9385ae6f85584138cc31.1619367130.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <fa1b35d89a6254b3d46d9385ae6f85584138cc31.1619367130.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun, 25 Apr 2021 18:14:10 +0200 you wrote:
> Use 'hash_for_each_rcu' and 'hash_for_each_safe' instead of hand writing
> them. This saves some lines of code, reduce indentation and improve
> readability.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> 
> [...]

Here is the summary with links:
  - macvlan: Use 'hash' iterators to simplify code
    https://git.kernel.org/netdev/net-next/c/bb23ffa1015c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


