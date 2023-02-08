Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87813C636D3
	for <kernel-janitors@archiver.kernel.org>; Wed,  8 Feb 2023 21:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231899AbjBHVkW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 8 Feb 2023 16:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjBHVkV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 8 Feb 2023 16:40:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75785252A9;
        Wed,  8 Feb 2023 13:40:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 111B8B81FAE;
        Wed,  8 Feb 2023 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DEA2C4339B;
        Wed,  8 Feb 2023 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675892417;
        bh=qHgsZbSwZoop6pt0Lvd+w9qEn/HC8fGsPdqFcVeuxQw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=f4tjtpG4wz0SZx71upU98oWMDT3arru83fkAbJ4xU15SnrveXwQtJxtV8bxZjqXTJ
         vF2S6V2LRclCD9UYnSrnGHxW8guUAHJEFl2+sUSkH4w1IQilXGt5dMvdUuQTImNIOo
         RPBULB/dReTYZEC4W+d0OCZ6UN7HTcxCjK6JXWVdNi4aoxrpQ14ivzN+wBwiAZkQxa
         8X1knPDtw2WX3sZpss2CStUoDgI+E0AyaTYrCpUCsHNDaerXVf8Iya6IRHfhiTBsAa
         ZSL4yXEcRIwP74uw7Ark3U/VEIbldVDhAnHiSJEQWtSambWr00VnqEFjs2MySKe6pS
         AwAaDqsTFy5hQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 83724E21ECB;
        Wed,  8 Feb 2023 21:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] platform/chrome: Fix spelling mistake "Attenetion" ->
 "attention"
From:   patchwork-bot+chrome-platform@kernel.org
Message-Id: <167589241753.24332.6338126948217091476.git-patchwork-notify@kernel.org>
Date:   Wed, 08 Feb 2023 21:40:17 +0000
References: <20230207091443.143995-1-colin.i.king@gmail.com>
In-Reply-To: <20230207091443.143995-1-colin.i.king@gmail.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     pmalani@chromium.org, bleung@chromium.org, groeck@chromium.org,
        chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Prashant Malani <pmalani@chromium.org>:

On Tue,  7 Feb 2023 09:14:43 +0000 you wrote:
> There is a spelling mistake in a dev_warn message, make it lower case
> and fix the spelling.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] platform/chrome: Fix spelling mistake "Attenetion" -> "attention"
    https://git.kernel.org/chrome-platform/c/b0d8a67715da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


