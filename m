Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E942EC48BDF
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 19:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE4BB60041
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Jun 2021 19:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235508AbhFRTWV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Jun 2021 15:22:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235383AbhFRTWQ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Jun 2021 15:22:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 87A30613F2;
        Fri, 18 Jun 2021 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624044006;
        bh=mYgWKU/yFlFwqULnKKlEddjTohRi2vp79RE6lcadDus=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ya1dUiVpey5BGTaPAgG72l5NSbk68K6gUlnuPIXj4nIU8PKKmPHpMDXzOINxdXnfx
         A/bDEC+eXvijvwpWL1eMpChIlzrHUN1fvQz8oq49AFc2yokrMSATP6siskPrQNL++K
         oZRw9cYtNFFj3zSsv2wo/qlZ+CIQKwDBUgnaVsz7h50bLds0uI25eidLsBo1V3rF0u
         6DU/Vm6HlW6IfxIgpA/XR+/OtWfGHHtziyON1A+CxhX05y1UG41Pzodoa+5IMTbUcE
         NJMsfnOTnk2sN70bXfiH/CfB7DejDeN+votONz8/cQtg0QkobwID/HAuKWC7vrN3Vd
         B03WSkZX8V5KQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: bridge: remove redundant continue statement
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162404400650.12339.9396305686886729563.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Jun 2021 19:20:06 +0000
References: <20210618100155.101386-1-colin.king@canonical.com>
In-Reply-To: <20210618100155.101386-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     roopa@nvidia.com, davem@davemloft.net, kuba@kernel.org,
        bridge@lists.linux-foundation.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 18 Jun 2021 11:01:55 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> invert the if expression and remove the continue.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - net: bridge: remove redundant continue statement
    https://git.kernel.org/netdev/net-next/c/040c12570e68

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


