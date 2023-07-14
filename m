Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DDCEB64DA
	for <kernel-janitors@archiver.kernel.org>; Fri, 14 Jul 2023 09:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235393AbjGNJaq (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 14 Jul 2023 05:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235825AbjGNJah (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 14 Jul 2023 05:30:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26BF35A7
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jul 2023 02:30:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0DFD561CCA
        for <kernel-janitors@vger.kernel.org>; Fri, 14 Jul 2023 09:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FB7CC433C9;
        Fri, 14 Jul 2023 09:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689327023;
        bh=mVo5/EDqkTNsP+lUQZUcWTJmfP3T/nO3C4QAcsibzqU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TBW3hIhPwBgznA4xxudRlO7wwcQkR0eZOTjrPL1RxUJqknU7rk3Iq773Pwumwvnry
         Pjb0gslK8uM9ftmK2bl+RmQ1LYprytswrVX2PTRIoVYdClOhTu5VQniFasW9rzkkzT
         gGyglX1j48SQYM6L3p5/Ju6YRSJWbvhYX6aKElsAHAcIaXCis/1mrnwJtcO2eAQdTR
         A5aIIxabZNmBkmfE8pnW9YmLpKq5+Sp9z2G8a8+mEhODVpQ+ordg/kNJrDG0htrnpU
         L7+OSFaSWfnJye7XcyXHRe0o3qUJD0YOhAp5jxw/MKKJ4dSRTeCIr+O48VaOAWB87S
         NlymoBSdE9e1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C6ABF83708;
        Fri, 14 Jul 2023 09:30:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] gve: trivial spell fix Recive to Receive
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168932702330.18845.16437279432945002152.git-patchwork-notify@kernel.org>
Date:   Fri, 14 Jul 2023 09:30:23 +0000
References: <168926364598.10492.9222703767497099182.stgit@firesoul>
In-Reply-To: <168926364598.10492.9222703767497099182.stgit@firesoul>
To:     Jesper Dangaard Brouer <brouer@redhat.com>
Cc:     kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 13 Jul 2023 17:54:37 +0200 you wrote:
> Spotted this trivial spell mistake while casually reading
> the google GVE driver code.
> 
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>
> ---
>  drivers/net/ethernet/google/gve/gve_desc.h |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> [...]

Here is the summary with links:
  - [net-next] gve: trivial spell fix Recive to Receive
    https://git.kernel.org/netdev/net-next/c/68af900072c1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


