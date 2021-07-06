Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED89C07E96
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jul 2021 22:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FF8F61CB4
	for <kernel-janitors@archiver.kernel.org>; Tue,  6 Jul 2021 22:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhGFWco (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 6 Jul 2021 18:32:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:51904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229753AbhGFWcn (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 6 Jul 2021 18:32:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B552F61CA7;
        Tue,  6 Jul 2021 22:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625610604;
        bh=1oTNz3W5xsPzO6GNEf/bo6wCOcWn5bZlIzaXFJumgtM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=i/xsscfvuQfmOY5YWQpwZMvdAjDPiX8qoHTd+MHS7d9Ubx36KLD10jEbbLE5Y2E/A
         vIntHNIfrS7VADAFgsHO9d9UjbWreHidg43ftapXBRRotYjeFqUa2fQb7rmx3tQkcQ
         empBBNoc7Fq4pL0eGbnytH7gHObjnV8mFlGhS2crVKDQt7FvRJlZQvUP/G9vWCfhw7
         UUMSQUjnzaf/8mmzHcNbXNYze03iZOdTsQzcAr4DD2hAVLlbGBvXNDGSyOc0aO3Q1H
         GuaTRwp7dWR3Iizr53iAdb7jJpBL1HcPe1KtjidSzIptj70MyyINmiclk4NSAOxJWq
         y48OFbdh72U/A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] octeontx2-pf: Fix assigned error return value that is
 never used
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162561060467.6207.12014057665404092440.git-patchwork-notify@kernel.org>
Date:   Tue, 06 Jul 2021 22:30:04 +0000
References: <20210706111802.27114-1-colin.king@canonical.com>
In-Reply-To: <20210706111802.27114-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
        hkelam@marvell.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue,  6 Jul 2021 12:18:02 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when the call to otx2_mbox_alloc_msg_cgx_mac_addr_update fails
> the error return variable rc is being assigned -ENOMEM and does not
> return early. rc is then re-assigned and the error case is not handled
> correctly. Fix this by returning -ENOMEM rather than assigning rc.
> 
> [...]

Here is the summary with links:
  - [next] octeontx2-pf: Fix assigned error return value that is never used
    https://git.kernel.org/netdev/net/c/ad1f37970875

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


