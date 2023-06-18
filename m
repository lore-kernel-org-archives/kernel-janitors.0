Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867E4EB64D8
	for <kernel-janitors@archiver.kernel.org>; Sun, 18 Jun 2023 16:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjFRQkW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 18 Jun 2023 12:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjFRQkV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 18 Jun 2023 12:40:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68198E4D;
        Sun, 18 Jun 2023 09:40:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0573A61177;
        Sun, 18 Jun 2023 16:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58EA9C433CC;
        Sun, 18 Jun 2023 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687106419;
        bh=D//mGu6mGIbJ0KVnNbXE+63kbF//AIUOltdoKTGLfeQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LjWZu0SBwT1NwvatZb0A8+RxP1x/lyysoGVs11N+mdGzylwwVMPCRi0JI58qd4bv9
         EZ/LXpFLTcEJK1qyIe+THhtUayWw1j97cwdCcW5DwksUe51v9DFY+CILLi4tMkvbY1
         PCddjyc8ZEyVs12oVCTWz/qyFJR+3gcllYv8C5suaLvZz6zeVXtubnlgQfVjUnU83N
         YFnfVxUIoDKdDmv7HrBOaPBu4vR6O2otwbAhMfzu+jukuxsdAMjNZdS45UyU7/r/gf
         jucQAIfjj0KnQLT9GKSJCY2pZq/uKCTXR+lw7FpjL7XQcW12+JXmFZd4p+gJdok4wh
         IimH5Jd71SAXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 45776C395C7;
        Sun, 18 Jun 2023 16:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: phy: at803x: Use
 devm_regulator_get_enable_optional()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168710641928.5271.4893587679808456480.git-patchwork-notify@kernel.org>
Date:   Sun, 18 Jun 2023 16:40:19 +0000
References: <f5fdf1a50bb164b4f59409d3a70a2689515d59c9.1687011839.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f5fdf1a50bb164b4f59409d3a70a2689515d59c9.1687011839.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, lgirdwood@gmail.com, broonie@kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Sat, 17 Jun 2023 16:24:37 +0200 you wrote:
> Use devm_regulator_get_enable_optional() instead of hand writing it. It
> saves some line of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> [...]

Here is the summary with links:
  - [net-next] net: phy: at803x: Use devm_regulator_get_enable_optional()
    https://git.kernel.org/netdev/net-next/c/988e8d90b3dc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


