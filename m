Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD79AC432BE
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 11:00:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6CBE6056C
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 11:00:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236521AbhHWLBh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Aug 2021 07:01:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:58502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236274AbhHWLAu (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Aug 2021 07:00:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DF223613AB;
        Mon, 23 Aug 2021 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629716407;
        bh=MzSwV0lTBk4i1KqT3TrHU4iVl4GKTIU7ZXH1YvSTZeo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WxVX5YlfC3+vF2iWCUAQ4SWwzmMLs7HfQzg5JI9HEz5d51EpVMvLL5fpxVYX5qp/Z
         Q/y/IQ6fiTjXI1wNSQa03YmLtW6MhsHb0EW/uVhZRJAmn4igHXgtJDIRBtxDIxUWv8
         x3GDDkd0NU34XhlmZi22mfe7GAm2a8YdluER0rDYuMlQRsHAWrYdP518Pe4jz8Ze4J
         ShtKGgHgzZhpYnEQWgyE4to19InCTr7eQGbEmiZXypsYFKopxgTprfKK5vpB+n/MfT
         ZQnLirjgU5GVoQ3BKEbL6SDtLMiftveM7LaEfAmbkUsXJCcx8x+713A3/ga6pK79Lb
         cJMbCOtWH53aw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: atlantic: switch from 'pci_' to 'dma_' API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162971640787.3591.426575431897714096.git-patchwork-notify@kernel.org>
Date:   Mon, 23 Aug 2021 11:00:07 +0000
References: <b263cad7a606091efb10392a81ee45f294f16bab.1629611296.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <b263cad7a606091efb10392a81ee45f294f16bab.1629611296.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     irusskikh@marvell.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun, 22 Aug 2021 07:49:42 +0200 you wrote:
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
  - net: atlantic: switch from 'pci_' to 'dma_' API
    https://git.kernel.org/netdev/net-next/c/3852e54e6736

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


