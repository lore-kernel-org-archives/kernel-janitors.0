Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03274C433FE
	for <kernel-janitors@archiver.kernel.org>; Mon,  7 Mar 2022 23:30:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343557AbiCGXbH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 7 Mar 2022 18:31:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240124AbiCGXbG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 7 Mar 2022 18:31:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5679F24F25;
        Mon,  7 Mar 2022 15:30:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D60E36122C;
        Mon,  7 Mar 2022 23:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4616EC340F4;
        Mon,  7 Mar 2022 23:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646695810;
        bh=U+rWhl3oOvuEaen7v0Bp5SCF/5OB6Y92K5CtNu4t+7w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=W5Kp0Cs7egMyRTFhlBpNyIXgCE8M+P+gGUhvuLeN+uqgKCC6d8QBeUlqwuQDwHNcA
         ETOXYjXxTkGqU1MzFx1TZt6Jbw8lPgPX/Xvv3r6ADC96EUU8ZeFYBbX5iuhQdeYkQm
         vWwKAP3RNcJ4Cqzl29ThGIfHiHfeGiH2G31WNPj++9scij2w0CZFOvB+4feR4bBBgA
         sKkwiWYGXqmdrSnrZR4LTR8h0xic1MbFh2GOJr3Eq+PMgDuUzSj6Op0oqOdK89cClM
         kLSMrC8f4J/a9k9GRFegc/JuBNWUEQNtXKi4jH7DM+bzggpyrIx53Igq7gUDD/DA0e
         OEeGHeTvLmzPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 267DAEAC095;
        Mon,  7 Mar 2022 23:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ptp: ocp: off by in in ptp_ocp_tod_gnss_name()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164669581015.18752.8236550371182241860.git-patchwork-notify@kernel.org>
Date:   Mon, 07 Mar 2022 23:30:10 +0000
References: <20220307141318.GA18867@kili>
In-Reply-To: <20220307141318.GA18867@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     richardcochran@gmail.com, vadfed@fb.com, jonathan.lemon@gmail.com,
        davem@davemloft.net, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 7 Mar 2022 17:13:18 +0300 you wrote:
> The > ARRAY_SIZE() needs to be >= ARRAY_SIZE() to prevent an out of
> bounds access.
> 
> Fixes: 9f492c4cb235 ("ptp: ocp: add TOD debug information")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/ptp/ptp_ocp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] ptp: ocp: off by in in ptp_ocp_tod_gnss_name()
    https://git.kernel.org/netdev/net-next/c/72f00505f2d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


