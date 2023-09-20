Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120F8CE79CC
	for <kernel-janitors@archiver.kernel.org>; Wed, 20 Sep 2023 11:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234374AbjITLAc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 20 Sep 2023 07:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbjITLAa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 Sep 2023 07:00:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7EFB4;
        Wed, 20 Sep 2023 04:00:24 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFB9BC43395;
        Wed, 20 Sep 2023 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695207624;
        bh=q6NPHTdLIJ7RI/7zOZQ3KCd40OPqqToSztFaLpAMoDE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cZ6uPpXzLFkqWWxeVxd2b965QMsTokYpUUM7ExuDOaRlFo9PxQMonp4Vx1m+vudu8
         bt3vSfhXuartYFs3siC93UTyiSWQK6ycbj6mw7mK+mFPAyuyav3VheB7NOWcuvotXw
         4G33d0GVB2Cqg1JTTRIXca+qHc7hB5prR9ePmI5Uz+e3srDuPtKV0AuLXnUrdu/GSD
         WG/1aY9C96nMQskYVT22CAPmnHnZfH9xzwTv7c3ibfUScccgyO8nZsmw5AtUSATYdM
         1fDtEcPkAAK8MBrS0JMEBpQ3Oq/g3liUNOzBpr0auQzidJkjkYcuzZTC2i1llZWBTE
         v7H7jhkvZHOOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8FBCC595C0;
        Wed, 20 Sep 2023 11:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] net: dsa: mv88e6xxx: make const read-only array lanes
 static
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169520762388.31903.489961378827553101.git-patchwork-notify@kernel.org>
Date:   Wed, 20 Sep 2023 11:00:23 +0000
References: <20230919094021.24699-1-colin.i.king@gmail.com>
In-Reply-To: <20230919094021.24699-1-colin.i.king@gmail.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 19 Sep 2023 10:40:21 +0100 you wrote:
> Don't populate the const read-only array lanes on the stack, instead make
> it static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/net/dsa/mv88e6xxx/pcs-639x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] net: dsa: mv88e6xxx: make const read-only array lanes static
    https://git.kernel.org/netdev/net-next/c/ccd663caffc7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


