Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C6DC4167E
	for <kernel-janitors@archiver.kernel.org>; Fri, 30 Sep 2022 11:45:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231871AbiI3LpX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231458AbiI3Lor (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 30 Sep 2022 07:44:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E714979D3;
        Fri, 30 Sep 2022 04:40:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D568F622F5;
        Fri, 30 Sep 2022 11:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35CA2C433D6;
        Fri, 30 Sep 2022 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664538018;
        bh=FRatANO/AT2L1ZiqPbmHUEBkw5Pd0kVgYyA/nX76pX0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FKx7PYdCpodZlgdxHKY2lVe6dNDbGh05a4VdIeRi2y5uLeVF4d2A7//vDYfYELuln
         hQBCIa+jlbFApdn7fx1hmgjxaIvD1kk4FY209LNi/s9rxB2JHgVuzEBriyl5oz2T+r
         5BzNmH5LilzjcDbsWg0SA+3TNkEppgR5T/962zZicV/ZwW7qaJFVZ/a5ZYIB8yLWNB
         kv+dV9sdWD0RnqCmKVFYTlmjFotD/MBpckSWZuNzz0lCtlb8cIA+YYB2sq7XKV4TB8
         QSPY5DmpXIiMSHb8nRYTL1m8fqf1EKhorDPKOWskCuRFvZ0Qo9MHXZeSFhz1duMv0i
         GQKoPuQTNsTng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 208B5E49FA7;
        Fri, 30 Sep 2022 11:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] net: lan966x: Fix spelling mistake "tarffic" ->
 "traffic"
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166453801812.4225.3778888598057569436.git-patchwork-notify@kernel.org>
Date:   Fri, 30 Sep 2022 11:40:18 +0000
References: <20220928143618.34947-1-colin.i.king@gmail.com>
In-Reply-To: <20220928143618.34947-1-colin.i.king@gmail.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     horatiu.vultur@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 28 Sep 2022 15:36:18 +0100 you wrote:
> There is a spelling mistake in a netdev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/net/ethernet/microchip/lan966x/lan966x_mqprio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] net: lan966x: Fix spelling mistake "tarffic" -> "traffic"
    https://git.kernel.org/netdev/net-next/c/db7fccc122f4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


