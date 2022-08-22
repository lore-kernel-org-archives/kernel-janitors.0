Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8304BC32789
	for <kernel-janitors@archiver.kernel.org>; Mon, 22 Aug 2022 07:00:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbiHVHAU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 22 Aug 2022 03:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbiHVHAS (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 22 Aug 2022 03:00:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C0E1CFE3
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Aug 2022 00:00:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8D46EB80E63
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Aug 2022 07:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 389FDC433D7;
        Mon, 22 Aug 2022 07:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661151615;
        bh=nJ9ezOubMRTIQyKM8IG9wbH6QFaLhz6Uvbi6nRndyBI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y8z/uVGLT3L1S2cNBVTknVclr9Rwv2cLo1ExmfGDeos9LsggRZrIJEkoGZ06Hvb6O
         ekpMNg52eeHuxwTZ8z9D1NR6BORDs+sfSG5jR54EpY+Be0ZytC4yL5OVHBK+o17aMQ
         tRqqq++QQajXn6RMJXiyfwJBnDRTItbnDVWS9THno8TU/INU2uBPSl7q2l0TWTnm+P
         FN/QiG1plhutURoxW4wLsyCqEmVjfFouxeS0O4/yi4cbcaXaefLTFdGwp/f1pnIFxj
         SJGP/dtgz+WVPJy4shT0WdZafsjlKoNwTYrVJDbccoJNAXawv0hbHd8j++qQPvcFEW
         gDu9VNRb1Nwgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1E19CC04E59;
        Mon, 22 Aug 2022 07:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform/chrome: fix memory corruption in ioctl
From:   patchwork-bot+chrome-platform@kernel.org
Message-Id: <166115161511.13978.9867179153698669785.git-patchwork-notify@kernel.org>
Date:   Mon, 22 Aug 2022 07:00:15 +0000
References: <Yv8dpCFZJdbUT5ye@kili>
In-Reply-To: <Yv8dpCFZJdbUT5ye@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     bleung@chromium.org, enric.balletbo@collabora.com,
        groeck@chromium.org, andriy.shevchenko@linux.intel.com,
        lee.jones@linaro.org, gwendal@chromium.org,
        chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 19 Aug 2022 08:20:36 +0300 you wrote:
> If "s_mem.bytes" is larger than the buffer size it leads to memory
> corruption.
> 
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/chrome/cros_ec_chardev.c | 3 +++
>  1 file changed, 3 insertions(+)

Here is the summary with links:
  - platform/chrome: fix memory corruption in ioctl
    https://git.kernel.org/chrome-platform/c/8a07b45fd3c2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


