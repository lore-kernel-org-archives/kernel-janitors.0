Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C64CC433EF
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Feb 2022 12:40:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240511AbiBWMkk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 23 Feb 2022 07:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240126AbiBWMkj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Feb 2022 07:40:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A67A27A4;
        Wed, 23 Feb 2022 04:40:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 65D4B612DF;
        Wed, 23 Feb 2022 12:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B86B4C340F4;
        Wed, 23 Feb 2022 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645620010;
        bh=xAV1ltAryiuNs2ZUkrZ0FwYZgWKeiNNLqbbBTPNqtm0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=B7h/8sP+72Mz+OSfQ/LraHP+KAkvrOjMDGi1MQIImHw7QSrNG9fbmv0JxtCVywHcA
         Q/RV4Sq7CkYlutSEFZl+zLYbLZJwJVGa525nxcqTnUK/DbxeMWy2nctaHXUtJq8mif
         dihaRfcPrcS1GUEGT1OpGTMGrG/lFEznbYnBwkNP6JVDbPJRam0qKv6ga+Z/tJf1K8
         iIiTq3bPQsKggxUAX6us/XdJBnK3WDaf+Nw5dh5jEZpqXQ8BlBbg6kAHjnplg0KB5W
         E0r1vJOP1Trgm1/gHyGksWLlnwG9Ys1eEumE2Gj9I7eErjqmICV1aG2bCnMnXX5UF7
         Eg0bLcVWeWclQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9F888E73590;
        Wed, 23 Feb 2022 12:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] tipc: Fix end of loop tests for list_for_each_entry()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164562001064.25344.14216155455524345283.git-patchwork-notify@kernel.org>
Date:   Wed, 23 Feb 2022 12:40:10 +0000
References: <20220222134311.GA2716@kili>
In-Reply-To: <20220222134311.GA2716@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     jmaloy@redhat.com, richard.alpe@ericsson.com,
        ying.xue@windriver.com, davem@davemloft.net, kuba@kernel.org,
        erik.hugne@ericsson.com, netdev@vger.kernel.org,
        tipc-discussion@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 22 Feb 2022 16:43:12 +0300 you wrote:
> These tests are supposed to check if the loop exited via a break or not.
> However the tests are wrong because if we did not exit via a break then
> "p" is not a valid pointer.  In that case, it's the equivalent of
> "if (*(u32 *)sr == *last_key) {".  That's going to work most of the time,
> but there is a potential for those to be equal.
> 
> Fixes: 1593123a6a49 ("tipc: add name table dump to new netlink api")
> Fixes: 1a1a143daf84 ("tipc: add publication dump to new netlink api")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net] tipc: Fix end of loop tests for list_for_each_entry()
    https://git.kernel.org/netdev/net/c/a1f8fec4dac8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


