Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAC5EB64D7
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Jun 2023 23:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234108AbjFPXuX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Jun 2023 19:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233633AbjFPXuW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Jun 2023 19:50:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E53297F;
        Fri, 16 Jun 2023 16:50:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2CCFE61CEF;
        Fri, 16 Jun 2023 23:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 791A3C433C0;
        Fri, 16 Jun 2023 23:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686959420;
        bh=tpI1nNLOMsidJC5LfSO36HzZCJ3rAkUYRMbae3G5Lwo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=c3VbRa0W6onMFD9QuFdy2MAp7G79AjuUTBFfWAdP3AGiXtXpc4R/zDv62uaJi0T6s
         tDnrUx3i00OXJJJ1hNNVXp5yUHHy4Krk7aFOKowa3djChv+jfl6pN+z8lvwc7+RXBg
         F57HhtGQQwtvj5kP5f9hfaCsIfSGtY4J5o5+L+8A6bVJGSfk3cXzxJ96z8gZPJUob+
         Kgv0Ga0wy4Dl2lw6NurWhxefAY9qdRzyGtKahhKCLx3PL8ylwkQT+UPzFcX4hn7SYz
         pItD18Ca7Hc486kQb9SNRcmw+z9OhjmRNhaJ6hIEFxSEXZjAT2GGHfu2QZppy5+QRr
         /wZnFcbvVgn0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E4DDE21EE4;
        Fri, 16 Jun 2023 23:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [f2fs-dev] [PATCH][next] f2fs: remove redundant assignment to
 variable err
From:   patchwork-bot+f2fs@kernel.org
Message-Id: <168695942038.30361.15438439169807836528.git-patchwork-notify@kernel.org>
Date:   Fri, 16 Jun 2023 23:50:20 +0000
References: <20230616142009.2332411-1-colin.i.king@gmail.com>
In-Reply-To: <20230616142009.2332411-1-colin.i.king@gmail.com>
To:     Colin Ian King <colin.i.king@gmail.com>
Cc:     jaegeuk@kernel.org, chao@kernel.org,
        linux-f2fs-devel@lists.sourceforge.net,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to jaegeuk/f2fs.git (dev)
by Jaegeuk Kim <jaegeuk@kernel.org>:

On Fri, 16 Jun 2023 15:20:09 +0100 you wrote:
> The assignment to variable err is redundant since the code jumps to
> label next and err is then re-assigned a new value on the call to
> sanity_check_node_chain. Remove the assignment.
> 
> Cleans up clang scan build warning:
> fs/f2fs/recovery.c:464:6: warning: Value stored to 'err' is never read [deadcode.DeadStores]
> 
> [...]

Here is the summary with links:
  - [f2fs-dev,next] f2fs: remove redundant assignment to variable err
    https://git.kernel.org/jaegeuk/f2fs/c/71a1277a46da

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


