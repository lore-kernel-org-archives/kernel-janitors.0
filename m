Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27647C7EE29
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Jun 2023 09:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234315AbjFGJUj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Jun 2023 05:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239567AbjFGJU2 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Jun 2023 05:20:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 880601FD4
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 02:20:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12E5363CC9
        for <kernel-janitors@vger.kernel.org>; Wed,  7 Jun 2023 09:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71D9EC433A1;
        Wed,  7 Jun 2023 09:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686129620;
        bh=fdJJE28eu0CCgITk3WkkOxo2hdgrxL1EQHGX+EmMb+I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qq3+HFis5KHmfofA7TFebdkBfa3OrquqRx2anpYe+f4Y5L8YD/KF+7ENkdnEL5I4x
         N8e71uYYc41KeAmabNneVT65PrgKuxUad4d9KG93DGrY/P5/DM+RRRXPb6PhGL3at7
         etm65bpuQ3ueDd7pMul00zMqQWe5CRKMIyNPbAOhAoLn+qneKx0WnoM1MIL/vYpKJM
         rInS8DMfPg/E+bNGnCoSI1Ml9u6E3w8tfpqKjpPlR7+jocByJYgZa1BXvXKL13B6Eb
         2N6itU2fbhxTZ1tzaXne+KBQelmUV4P8gfPQ5xoFLnv8nMzyo3ATe71Vnw9vyj71RJ
         pQj055ken3F2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A76CE29F39;
        Wed,  7 Jun 2023 09:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: dsa: ocelot: unlock on error in
 vsc9959_qos_port_tas_set()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168612962036.23613.5611394372342298176.git-patchwork-notify@kernel.org>
Date:   Wed, 07 Jun 2023 09:20:20 +0000
References: <ZH7tRX2weHlhV4hm@moroto>
In-Reply-To: <ZH7tRX2weHlhV4hm@moroto>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     vladimir.oltean@nxp.com, claudiu.manoil@nxp.com,
        alexandre.belloni@bootlin.com, UNGLinuxDriver@microchip.com,
        andrew@lunn.ch, f.fainelli@gmail.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        muhammad.husaini.zulkifli@intel.com, kurt@linutronix.de,
        gerhard@engleder-embedded.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 6 Jun 2023 11:24:37 +0300 you wrote:
> This error path needs call mutex_unlock(&ocelot->tas_lock) before
> returning.
> 
> Fixes: 2d800bc500fb ("net/sched: taprio: replace tc_taprio_qopt_offload :: enable with a "cmd" enum")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/dsa/ocelot/felix_vsc9959.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] net: dsa: ocelot: unlock on error in vsc9959_qos_port_tas_set()
    https://git.kernel.org/netdev/net-next/c/cad7526f33ce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


