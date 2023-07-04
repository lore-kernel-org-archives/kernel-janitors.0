Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F15EB64D9
	for <kernel-janitors@archiver.kernel.org>; Tue,  4 Jul 2023 18:40:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjGDSkZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 4 Jul 2023 14:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjGDSkX (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 4 Jul 2023 14:40:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B993010C1
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 11:40:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 577056133A
        for <kernel-janitors@vger.kernel.org>; Tue,  4 Jul 2023 18:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4B63C433C7;
        Tue,  4 Jul 2023 18:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688496021;
        bh=XAsUzDWBFjyQu6VIHGFGHRzZRGSLGMc5fJfgF4MaxN4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fBBtjDFTLsCgtJBJhHINAF4IuQo5EtqzvY9AQNZRsm/KIUVM6lQUsK04E9LWyhw6q
         lBYPLbslQDg2iEhALpSYDEBR1IyX0atZ25oWga14KChWhY6Dm+NHrN3oU2qDfiHIzV
         cvzfOf4GHTzSJCQ6y46dVHxnJKCTOA5c5+sp98TV5kx4RHor9o2V7+Ut1m3sJ0pKIE
         rwyQtuPh4R1ohWIGThBnkXdWxU6QfFYYPE9kNf527qWow0ndo0hOEOiveGf4nx5FBq
         ize/ewGUK1ZBeVodw9T4BEKDO4WlIpUPb9Wyi/BZ3LaTl0cuV70WSYgjBLDcds5aTp
         ez8RAI4yljg9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8E5F7C395C8;
        Tue,  4 Jul 2023 18:40:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] mlxsw: spectrum_router: Fix an IS_ERR() vs NULL check
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168849602158.25174.8935313597975371189.git-patchwork-notify@kernel.org>
Date:   Tue, 04 Jul 2023 18:40:21 +0000
References: <16334acc-dc95-45be-bc12-53b2a60d9a59@moroto.mountain>
In-Reply-To: <16334acc-dc95-45be-bc12-53b2a60d9a59@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     petrm@nvidia.com, idosch@nvidia.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        danieller@nvidia.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 3 Jul 2023 18:24:52 +0300 you wrote:
> The mlxsw_sp_crif_alloc() function returns NULL on error.  It doesn't
> return error pointers.  Fix the check.
> 
> Fixes: 78126cfd5dc9 ("mlxsw: spectrum_router: Maintain CRIF for fallback loopback RIF")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Applies to net.
> 
> [...]

Here is the summary with links:
  - [net] mlxsw: spectrum_router: Fix an IS_ERR() vs NULL check
    https://git.kernel.org/netdev/net/c/90a8007bbeb6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


