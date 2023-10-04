Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6030CE7C4FD
	for <kernel-janitors@archiver.kernel.org>; Wed,  4 Oct 2023 20:20:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244753AbjJDUU4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 4 Oct 2023 16:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244551AbjJDUUa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Oct 2023 16:20:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9335BCE
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Oct 2023 13:20:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 389B8C433C7;
        Wed,  4 Oct 2023 20:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696450827;
        bh=ZvmH7BIUXoz9+C8yaYMR64uYcJgl8a+wyuUOvtV2rS4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YHrjPkZeALDkpw8fgCbuwv/BTVhN1O8rIfpDk/8p1MJC0FKncy9c0qX+XkcYgs4Rr
         OIJwXfSW8Fms1z5hVAeZKjBC3mCs5YXS8L2OYJw1LLVl9NXqBsrl+rNaDeeP5rMXVN
         RNwIADN11/R3DZUGWNLEBu93Ml2//3mEUmE7wF+lpOqIVRNMSzbKiIuIEvSM7S/NFT
         adDZAFtBRQQKTwT4CPhgIN2R8DaL8ntnnGC0cQRIpwJubbvD7Myhp1c0/FCRo4Hoer
         j/+CykVG9GEGiShNOl3CkwYHXh9hJJlOk4tyIBTEVEyV0lIzpQWkK0yUq8bKZjcHb3
         6A6cdti+xOnCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2120FC395EC;
        Wed,  4 Oct 2023 20:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] ptp: ocp: fix error code in probe()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169645082713.3149.4125825140201127243.git-patchwork-notify@kernel.org>
Date:   Wed, 04 Oct 2023 20:20:27 +0000
References: <5c581336-0641-48bd-88f7-51984c3b1f79@moroto.mountain>
In-Reply-To: <5c581336-0641-48bd-88f7-51984c3b1f79@moroto.mountain>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     vadim.fedorenko@linux.dev, richardcochran@gmail.com,
        jonathan.lemon@gmail.com, vadfed@fb.com, davem@davemloft.net,
        jiri@resnulli.us, arkadiusz.kubalewski@intel.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Wed, 27 Sep 2023 15:55:10 +0300 you wrote:
> There is a copy and paste error so this uses a valid pointer instead of
> an error pointer.
> 
> Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/ptp/ptp_ocp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] ptp: ocp: fix error code in probe()
    https://git.kernel.org/netdev/net-next/c/24a0fbf48cbe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


