Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC2BC4320E
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Aug 2021 10:00:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 569F660E76
	for <kernel-janitors@archiver.kernel.org>; Sun, 29 Aug 2021 10:00:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235029AbhH2KA7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 29 Aug 2021 06:00:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:36190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234935AbhH2KA5 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 29 Aug 2021 06:00:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C82C960C41;
        Sun, 29 Aug 2021 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630231205;
        bh=qJuSD3NSpuGrNVH+pOlPEVpW4+BSg5IPon0/mGKDSRY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Qn4y4Eo/6pneaKGHySRPiDJnTfQWMGmUKP10uMHZjPfD8W0KnpfhiuxnTwxodGrom
         GHovug9RtYKxKK67w1zqSHIXB9SIjqlKed78yJmjJOMa1hJW3VrlUb2FRqNuRdWsRK
         OFfnHpQUb45P6k0xCNaASTxqEk8wVrtsswDqCXkJAimCKh96M5XMnNfgn23t/j5LCX
         q+La6hNpdYT1UceFf7+8oEODF65tjXAwccbDKSqP5HtCDp6lOOjA8vHAbWOyrR0eU/
         pOyIPa6iuXzbDQjFfqRt4F2CrK4zUw1E2tol3Ri9kK8BIxvICwam91fNsSIt6cTUGr
         tL8ZUSH5uLROA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: spider_net: switch from 'pci_' to 'dma_' API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163023120577.23170.14559498942761787716.git-patchwork-notify@kernel.org>
Date:   Sun, 29 Aug 2021 10:00:05 +0000
References: <60abc3d0c8b4ef8368a4d63326a25a5cb3cd218c.1630094078.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <60abc3d0c8b4ef8368a4d63326a25a5cb3cd218c.1630094078.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     kou.ishizaki@toshiba.co.jp, geoff@infradead.org,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 27 Aug 2021 21:56:28 +0200 you wrote:
> In [1], Christoph Hellwig has proposed to remove the wrappers in
> include/linux/pci-dma-compat.h.
> 
> Some reasons why this API should be removed have been given by Julia
> Lawall in [2].
> 
> A coccinelle script has been used to perform the needed transformation
> Only relevant parts are given below.
> 
> [...]

Here is the summary with links:
  - net: spider_net: switch from 'pci_' to 'dma_' API
    https://git.kernel.org/netdev/net-next/c/27d57f85102b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


