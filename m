Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCD4C47080
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 23:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AD8F613C3
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 23:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbhFAXBr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 19:01:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:40932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234766AbhFAXBp (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 19:01:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 715B0613C5;
        Tue,  1 Jun 2021 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622588403;
        bh=iLhyLUw2mYamC6iFH0dPrfhONhGrSeaNEsfGwlmJ4Uo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LB8Qzv0NirOeYUdEqU0/+H3GnPGLTrKCl43R6VhgfOgfd9sbrgcihRi/617NeG1Hr
         yg37gj6XUVQS+aoWXe7HI8OEgptrxW79VR8K5QSkJZJV5QXIkBAIaOpiEd1CCg8bUT
         uPSUeX/9iqNyaL1Ni6F4R5vmg2mZYV0cTiNKmpHAZUTEj0WZrTwjN2T9nphrNmbwZL
         6neb88jkGvyRjhRshnCCf6wgoiuVmTmC7PIESh7gUUsIBuILFMLxS+V0N8+31VOwFX
         cPARS7qg00oqNnQSN7uVYKoyBsnnEgyLTyE1uBrntpR7srhGzIUjyI5Hg9EwlIuLOl
         ueViBfTgRQprw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] octeontx2-af: Fix spelling mistake "vesion" ->
 "version"
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162258840343.25475.840773037649617405.git-patchwork-notify@kernel.org>
Date:   Tue, 01 Jun 2021 23:00:03 +0000
References: <20210601103144.9213-1-colin.king@canonical.com>
In-Reply-To: <20210601103144.9213-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
        jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue,  1 Jun 2021 11:31:44 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_warning message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] octeontx2-af: Fix spelling mistake "vesion" -> "version"
    https://git.kernel.org/netdev/net-next/c/b934b6d1d933

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


