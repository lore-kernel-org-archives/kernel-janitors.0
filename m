Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B036AC4338F
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 11:10:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9784C6136F
	for <kernel-janitors@archiver.kernel.org>; Mon, 23 Aug 2021 11:10:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236453AbhHWLLA (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 23 Aug 2021 07:11:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:60514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236260AbhHWLK5 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 23 Aug 2021 07:10:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 638596137D;
        Mon, 23 Aug 2021 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629717015;
        bh=KWOCOIQiI287a6sbDH26VUPtB9fAKYbYVVnV0sgltBA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P6HNlU0e7/ko1nUluE0h2eGm561RvS0DOLHaEMsMI9xdofmH/YoNAwTSdoH8jnehq
         YIFxTeWrLncy6HWt9VCw9/mGc5gDGXI2TQcB+j5sNlBBHlVk04wgof75AoIId9saCf
         0B08OhCDyPYcEqoFiWxYSGT4E9IbiEchzQxu4f0MGzY1iplVF1yBPpUGrMG5GPYLMD
         F6qv0cfcKhQrlOhYZmUYeiS2dibHEU6NXv40ompD9+bdIjCzCOupfKUAlOcg+O0MwV
         MczGm4jucldMFhSh8dBk1irI7XGxFxYjGPS8PIAZx1240QXMCJS5nOvhXxbyzWldF5
         74RVOI8uyZ5Vw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] myri10ge: switch from 'pci_' to 'dma_' API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162971701535.8269.7128338763016166575.git-patchwork-notify@kernel.org>
Date:   Mon, 23 Aug 2021 11:10:15 +0000
References: <e5265136abae64c5e763d30ef8ec34607967c7dc.1629642164.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <e5265136abae64c5e763d30ef8ec34607967c7dc.1629642164.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     christopher.lee@cspi.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun, 22 Aug 2021 16:23:57 +0200 you wrote:
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
  - myri10ge: switch from 'pci_' to 'dma_' API
    https://git.kernel.org/netdev/net-next/c/75bacb6d204e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


