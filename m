Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3F10C77B61
	for <kernel-janitors@archiver.kernel.org>; Fri, 28 Apr 2023 08:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345547AbjD1Iuh (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 28 Apr 2023 04:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345494AbjD1Iub (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 28 Apr 2023 04:50:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1B61FCF;
        Fri, 28 Apr 2023 01:50:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DBE5864219;
        Fri, 28 Apr 2023 08:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AF98C433D2;
        Fri, 28 Apr 2023 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682671820;
        bh=8Tw+5rhC7oKIe4JFe7tcfXKZPFVqlfnT3qVqfqKTdqo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kCkUSmKh4oVdbcfxeCGgU7cllaBbvFIjFBXFv8DKLGFO/YJUWGWUAhk3NhYSUkfYF
         yqE83t2xDIQYlOB3w3SDIGxi+JgGi6IJGB8pXVPzzN5nI+rER02rs46268gZS+QWBT
         fy0LdUrI6k9m/D7pIcLYDQJFB8oxEHYL1x7GYbY0TGQ0Q/wr9ZspB/VJ3Z4Rx9Ca7U
         vPvAoodIssyUh7RoCkRN/Ur+tnB6OYY4JB5FPGC1lU351gpNgvcz9R1ONT0TXVXIeT
         LadqwSmcfEB3Z9gLQ5TZnuok1uiTBQDV9LpLPpknSjlD1dkGTuWa/miXxmQX7Zy9tj
         F3jbbDcu0Qe8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 367F3C41677;
        Fri, 28 Apr 2023 08:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mISDN: Use list_count_nodes()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <168267182021.3488.8534134513892654385.git-patchwork-notify@kernel.org>
Date:   Fri, 28 Apr 2023 08:50:20 +0000
References: <886a6fe86cfc3d787a2e3a5062ce8bd92323ed66.1682602766.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <886a6fe86cfc3d787a2e3a5062ce8bd92323ed66.1682602766.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     isdn@linux-pingi.de, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org, netdev@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 27 Apr 2023 15:39:48 +0200 you wrote:
> count_list_member() really looks the same as list_count_nodes(), so use the
> latter instead of hand writing it.
> 
> The first one return an int and the other a size_t, but that should be
> fine. It is really unlikely that we get so many parties in a conference.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - mISDN: Use list_count_nodes()
    https://git.kernel.org/netdev/net-next/c/e0807c430239

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


