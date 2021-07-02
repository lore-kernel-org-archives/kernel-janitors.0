Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24784C07E95
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jul 2021 19:00:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F357A6141D
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Jul 2021 19:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhGBTCj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Jul 2021 15:02:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:60204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229996AbhGBTCi (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Jul 2021 15:02:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B5E861410;
        Fri,  2 Jul 2021 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625252406;
        bh=aWBVXHm0LcK7WHae1VAvZZew02WQQ9BVRwZ1+h9glHo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=i5RQmVF+m/6SAZoop0mGNQXQ90BCiVkB7jrqD6wzb0irieL8Mpvl1yVoYchXN4vFo
         4vmntua/Fnzfj0/c9i0KE5tENyhmIh59aP+NonoQZlYqvRXMxDKAsAc4ZVz+J8viIq
         oXUjK37W11cyOqcRV3hU+0+mJGZf7ctKH9D32n0fGFc5eC+zFAgM88WGtRaIFA3Wuf
         sOQVdAirY6ie6ohpTG4u4Wc0MWRmhSAXSxFwElddn7Tq16q6IHidXzlwZIH76devBD
         Vlh0nUJ9DcByM1MBiRpgcY9/dhKTlkoIDdVrEOFdbLTB+QJQLPcs2obM2R10y5FzOR
         qdeWpzQmi9wuQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] gve: Simplify code and axe the use of a
 deprecated API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162525240604.2935.3407370516118564333.git-patchwork-notify@kernel.org>
Date:   Fri, 02 Jul 2021 19:00:06 +0000
References: <a8ff6511e4740cff2bb549708b98fb1e6dd7e070.1625172036.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <a8ff6511e4740cff2bb549708b98fb1e6dd7e070.1625172036.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     csully@google.com, sagis@google.com, jonolson@google.com,
        davem@davemloft.net, kuba@kernel.org, awogbemila@google.com,
        willemb@google.com, yangchun@google.com, bcf@google.com,
        kuozhao@google.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu,  1 Jul 2021 22:41:19 +0200 you wrote:
> The wrappers in include/linux/pci-dma-compat.h should go away.
> 
> Replace 'pci_set_dma_mask/pci_set_consistent_dma_mask' by an equivalent
> and less verbose 'dma_set_mask_and_coherent()' call.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] gve: Simplify code and axe the use of a deprecated API
    https://git.kernel.org/netdev/net/c/bde3c8ffdd41

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


