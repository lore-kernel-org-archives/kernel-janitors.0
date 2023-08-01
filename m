Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D973C04A94
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Aug 2023 21:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbjHAVuY (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Aug 2023 17:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjHAVuX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Aug 2023 17:50:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2CB1BE3
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Aug 2023 14:50:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C7C17615F8
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Aug 2023 21:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2612AC433C9;
        Tue,  1 Aug 2023 21:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690926621;
        bh=qg8R7Qj9T4gqti2LnGBxP2LG1W3NNHPhOHo+JMMtBHY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lV419Ir23v+Z9lw8JQsxLGh4XDrja7hgj1xZZfeQmOnxL434rzQnrlD8j8BqWd6Mk
         UeqF2KIinFgaoOY9p3g+3Fw/0MKKoXd/qUEIlhjOTMDPfvQ/oDrm8KzzBzr4VVWobf
         5S0phITd4aVoWCAU5fBniUhjKzwrXZivOBR7xDsn8Nnu5edLA/sTKB0Fzy11QGaBXs
         4bZtD1CCvGzwpfZA/ATdLDKUn7qvqcGpkVZZ5Hs2ZsN8ZsZOURfn0wIM6N8lK5f5Vd
         47ZGjmAwbSrUKuuQbdHtoxxlrz/o0/1xGo7NlqL86rmDPaKM2Tr6Wv0uCCeMDYm7iH
         pGHw/OD3m6ipA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 09650C691EF;
        Tue,  1 Aug 2023 21:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: ll_temac: fix error checking of
 irq_of_parse_and_map()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169092662103.6936.6671891204915051164.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Aug 2023 21:50:21 +0000
References: <3d0aef75-06e0-45a5-a2a6-2cc4738d4143@moroto.mountain>
In-Reply-To: <3d0aef75-06e0-45a5-a2a6-2cc4738d4143@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     esben@geanix.com, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
        harini.katakam@amd.com, xuhaoyue1@hisilicon.com,
        huangjunxian6@hisilicon.com, yangyingliang@huawei.com,
        robh@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 31 Jul 2023 10:42:32 +0300 you wrote:
> Most kernel functions return negative error codes but some irq functions
> return zero on error.  In this code irq_of_parse_and_map(), returns zero
> and platform_get_irq() returns negative error codes.  We need to handle
> both cases appropriately.
> 
> Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> [...]

Here is the summary with links:
  - [net] net: ll_temac: fix error checking of irq_of_parse_and_map()
    https://git.kernel.org/netdev/net/c/ef45e8400f5b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


