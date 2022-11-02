Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2834EC4332F
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Nov 2022 12:30:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiKBMaW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 2 Nov 2022 08:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiKBMaV (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 2 Nov 2022 08:30:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D77252BD;
        Wed,  2 Nov 2022 05:30:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A76A66193E;
        Wed,  2 Nov 2022 12:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11985C43141;
        Wed,  2 Nov 2022 12:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667392220;
        bh=IJFUHSV6m9ANbKVtZTmmfp3JBGFPo/VemZxw16Q1KMc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Hax6rGxpVfNTJ0zMPnMFqcEQDXrt6OxCDSxqZvraNDON20WvZHgxsQjWzOU2LIyVK
         ftdD5UslAwKSVcYIL8itbRbgRw0qybtLYebrIn0HgijJxOX22mk8DceA5/e4bfpmlK
         mVJ2sIKD+5RHtdbcWRC7/rMW6sDQETIUqsArSQ7OqGDJAWUd2nrh+vZRJTxblPVUAe
         eXndA07nh17X15lozJw/7NDCGf9ApVOW3CdRFT6GDbxeXVheweEkP1osGfj8Wk3En0
         bJFd7EWnViqW0yPZ0Jg5LVmDYUFGaCOjcqPHTfrQIOA8w+zxneCZZb2CeLtaeAcdNp
         NpXWTZGPuxPdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E42BCE29F4D;
        Wed,  2 Nov 2022 12:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 13/30] platform/chrome: Use kstrtobool() instead of
 strtobool()
From:   patchwork-bot+chrome-platform@kernel.org
Message-Id: <166739221992.25408.14101435608280846457.git-patchwork-notify@kernel.org>
Date:   Wed, 02 Nov 2022 12:30:19 +0000
References: <8d66b4688c05a44b592a4d20e2660e9067163276.1667336095.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <8d66b4688c05a44b592a4d20e2660e9067163276.1667336095.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     bleung@chromium.org, groeck@chromium.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        chrome-platform@lists.linux.dev
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-next)
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Tue,  1 Nov 2022 22:14:01 +0100 you wrote:
> strtobool() is the same as kstrtobool().
> However, the latter is more used within the kernel.
> 
> In order to remove strtobool() and slightly simplify kstrtox.h, switch to
> the other function name.
> 
> While at it, include the corresponding header file (<linux/kstrtox.h>)
> 
> [...]

Here is the summary with links:
  - [13/30] platform/chrome: Use kstrtobool() instead of strtobool()
    https://git.kernel.org/chrome-platform/c/58f23a6795a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


