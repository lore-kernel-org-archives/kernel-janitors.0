Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E47CC7EE2F
	for <kernel-janitors@archiver.kernel.org>; Wed, 17 May 2023 08:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbjEQIKZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 17 May 2023 04:10:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjEQIKX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 17 May 2023 04:10:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B785E10FA;
        Wed, 17 May 2023 01:10:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5532364365;
        Wed, 17 May 2023 08:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFF46C433EF;
        Wed, 17 May 2023 08:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684311020;
        bh=EacTFV3aLR7vTof0FI3pduiKvEeTrK96jsFJrQ45l24=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YCqTP5ndTSWjRmYrFq/AEalgZbw5wjhjkV1RooII96IiqupB/GmlTVsQ/8PkQhNZX
         rx4dF/dxOd93e8t6HANIe350AbUBX7e30YP8biIqoS7yHuVHwDbJ1RmaJwgiIfn3cN
         DRqEbMt0s/MKBvlC7r3Jf6J1Jr19NfktQhWsawwBGprqnQLsutdicOE6tMODvg/bJS
         9AXDdhWHeGqDt/UqUHdJMUGxmwSz+n5QerZyH8OwrDpdwtXAi6JRiP6u8EbvDo0iUT
         dR81bJtq+j7woSPmS+J7i7lx3smoTLz14EOWGMvhe+lgan+3orwHQ5wVtJnjMikoyj
         KlwukcffdN7fQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95A21E5421C;
        Wed, 17 May 2023 08:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] cassini: Fix a memory leak in the error handling path of
 cas_init_one()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168431102060.18881.14691386988847658015.git-patchwork-notify@kernel.org>
Date:   Wed, 17 May 2023 08:10:20 +0000
References: <de2bb89d2c9c49198353c3d66fa9b67ce6c0f191.1684177731.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <de2bb89d2c9c49198353c3d66fa9b67ce6c0f191.1684177731.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, jaswinder@infradead.org,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 15 May 2023 21:09:11 +0200 you wrote:
> cas_saturn_firmware_init() allocates some memory using vmalloc(). This
> memory is freed in the .remove() function but not it the error handling
> path of the probe.
> 
> Add the missing vfree() to avoid a memory leak, should an error occur.
> 
> Fixes: fcaa40669cd7 ("cassini: use request_firmware")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - cassini: Fix a memory leak in the error handling path of cas_init_one()
    https://git.kernel.org/netdev/net/c/412cd77a2c24

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


