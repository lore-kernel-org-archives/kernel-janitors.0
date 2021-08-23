Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E098C4338F
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 11:00:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 841E86056C
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 11:00:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236495AbhHWLBc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Aug 2021 07:01:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58604 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236331AbhHWLAy (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Aug 2021 07:00:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F1136613B3;
        Mon, 23 Aug 2021 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629716408;
        bh=65qyHV4cD2kzOPxh9kXCZI2TBArDK8JVyxel3DOMOJI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Jt5R8p4CTF/nSL+8AJM3k8h0NfvxuPKx6sZxJ6KtBlTHrIHUCrNYYPjILXWMnC88J
         XQ8LEgTG+hR0kOlU/932euwFULQvvV82AXhNkpM6HrBL9deIJYl4LVO3GQ0oJK4bFZ
         BTN6p/6dgwwRDjDAka3u1AwSpAGUBox8jDQ8DaRCPDGEdQPLzroZfR+BTWi7WUmU/+
         Q2a+qIFat4vZ7YbNmEeSzFH3oH2/hlmyYeRf6IGtrcPLs25gR+oHHV0YAJf3XMbrKt
         gnwV9x3u/ABiFJn18w9Uo9bZOhMo2ceWvpQt8Ms9npCJfuBrO4hPbLgGYB9BKuz+xL
         y8Z50V4KQoISw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: jme: switch from 'pci_' to 'dma_' API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162971640795.3591.17603065275535651525.git-patchwork-notify@kernel.org>
Date:   Mon, 23 Aug 2021 11:00:07 +0000
References: <861b51bebe380db8765890c0c1412a484de6163f.1629614888.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <861b51bebe380db8765890c0c1412a484de6163f.1629614888.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     cooldavid@cooldavid.org, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun, 22 Aug 2021 08:48:40 +0200 you wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> The patch has been generated with the coccinelle script below.
> 
> It has been hand modified to use 'dma_set_mask_and_coherent()' instead of
> 'pci_set_dma_mask()/pci_set_consistent_dma_mask()' when applicable.
> This is less verbose.
> 
> [...]

Here is the summary with links:
  - net: jme: switch from 'pci_' to 'dma_' API
    https://git.kernel.org/netdev/net-next/c/83b2d939d1e4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


