Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE85CD691B
	for <kernel-janitors@archiver.kernel.org>; Tue, 10 Oct 2023 09:40:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjJJJk0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 10 Oct 2023 05:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjJJJkZ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 10 Oct 2023 05:40:25 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DA694
        for <kernel-janitors@vger.kernel.org>; Tue, 10 Oct 2023 02:40:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25D84C433CA;
        Tue, 10 Oct 2023 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696930824;
        bh=d5GXNWwoNDXNq9hUxuk9GxPSEE/IHXHFL6VyvMeDIvo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QVRXkPWUzCFltimaLELy7wuruoL5hw4jf0oeZnlyvltelKamaJzsHlxuhfO8n6eZN
         tEJ4FPG6ayQGR9Dyk0ox5mUgGJLOJTBOPOsADgsuTm3gYbmJabiWg9aStcy5jphIgY
         E4YY/UTsDWqxTPThOdSYVTDvGN3vLVM4qPFu2HESvpvmBX1/rcGvKubX49vYUOZEI0
         NIi/n7xzRHlGWoPx+Gm+sws/ZV38kyj4t+NUJ/RpiqXL3cusMT6rmjoBWE1rw3bKIX
         p2CJaaY1nbU+xI39k/HCSIKy9jPOz+TwXgExHnDnMEB7hUGOUNzAIfFe+U7bdQlgXh
         9/1AIPvdJRYMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09E68C595C5;
        Tue, 10 Oct 2023 09:40:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] ixgbe: fix crash with empty VF macvlan list
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169693082403.5800.6981451364289759108.git-patchwork-notify@kernel.org>
Date:   Tue, 10 Oct 2023 09:40:24 +0000
References: <ZSADNdIw8zFx1xw2@kadam>
In-Reply-To: <ZSADNdIw8zFx1xw2@kadam>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     jesse.brandeburg@intel.com, horms@kernel.org,
        anthony.l.nguyen@intel.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jeffrey.t.kirsher@intel.com, intel-wired-lan@lists.osuosl.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 6 Oct 2023 15:53:09 +0300 you wrote:
> The adapter->vf_mvs.l list needs to be initialized even if the list is
> empty.  Otherwise it will lead to crashes.
> 
> Fixes: a1cbb15c1397 ("ixgbe: Add macvlan support for VF")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: Use the correct fixes tag.  Thanks, Simon.
> 
> [...]

Here is the summary with links:
  - [net,v2] ixgbe: fix crash with empty VF macvlan list
    https://git.kernel.org/netdev/net/c/7b5add9af567

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


