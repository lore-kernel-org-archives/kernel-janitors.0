Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F78DC4338F
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Aug 2021 22:10:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08D1760F4C
	for <kernel-janitors@archiver.kernel.org>; Mon,  2 Aug 2021 22:10:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233020AbhHBWKU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 2 Aug 2021 18:10:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:56958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232111AbhHBWKQ (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 2 Aug 2021 18:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8D24260FC2;
        Mon,  2 Aug 2021 22:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627942206;
        bh=n+0NuXS4iaEd59KXMxsUekQxWsSaOrWWE+0vIT2maPI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=baQiQAkl1pQKK7eeZB4VUAyfc9dk+wDfBD35bWQiOEOcVafHDpTc2qhexu9hpRCMG
         CXiqRCnuGS5AyWGKRHd7Q4l8Dyou0DvUbqj2VRxv0sbb05mUIPtYOtvYn1Y7dPODDV
         JFkz9Dbiu3Kjdko6XU5890MslvDMfs5v/CR93gj0Qenmyl15IgHX8JPAmoYkl13Q3F
         lrNT3HbfdpE6FL03gYN+Wvx5vYPJgXkVOeX3t4mK/0DKvaA78Q0KS4z0tl3rLa5s72
         1Ctyjs46DxZVpxNi5pFoFXDnAAZWzixx+zcc5w9Sb3SkR9hOGkq5xSqfNTIegg2Ffw
         4Yb1ZUMZ45C4A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: marvell: make the array name static,
 makes object smaller
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162794220654.7989.1896210667750106238.git-patchwork-notify@kernel.org>
Date:   Mon, 02 Aug 2021 22:10:06 +0000
References: <20210801150647.145728-1-colin.king@canonical.com>
In-Reply-To: <20210801150647.145728-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     mlindner@marvell.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun,  1 Aug 2021 16:06:47 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array name on the stack but instead it
> static. Makes the object code smaller by 28 bytes. Add a missing
> const to clean up a checkpatch warning.
> 
> Before:
>    text    data   bss     dec     hex filename
>  124565   31565   384  156514   26362 drivers/net/ethernet/marvell/sky2.o
> 
> [...]

Here is the summary with links:
  - net: marvell: make the array name static, makes object smaller
    https://git.kernel.org/netdev/net-next/c/628fe1cedda6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


