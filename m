Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD2BC433F5
	for <kernel-janitors@archiver.kernel.org>; Wed,  1 Jun 2022 10:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351370AbiFAKAV (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 1 Jun 2022 06:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351664AbiFAKAR (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 1 Jun 2022 06:00:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D21633BF;
        Wed,  1 Jun 2022 03:00:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E522FB81879;
        Wed,  1 Jun 2022 10:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88FB5C3411D;
        Wed,  1 Jun 2022 10:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654077613;
        bh=SUNGJJJsc37BnKZCLFH/YDYDT5gfEd5kdxzwC12leT4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Te/VTC/JCD/soRG1TYrWBQyOGZ6KdMN7BILWsbMhGBArNMuBvGuZkEv9JpVEyr5Xa
         M1gG6k2/I4YuSQB6LLh3qx6S3xnVL9D/yHQDu03d2Rr85MHhT985o4zMij/GxAMtEr
         BkXSJcPizmpY33l6nQwmEddmBJ8C36bLW6ZfCoOUaxiczYNfU+x6B62qNtzNlVCzGV
         748QAlaHYDcgg528sOWwYBCTQI7kaX25u9yswslQ/LVprBnbGp+jq8vVtMyAMCuBCb
         4bquPX6dHl42DRVfS+hX+IUtmfJJO3ZYZM4oeU1+yUVA4teajslFS57YubR/voMuqC
         CdK3YjYAtBRgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 70E8BF0394E;
        Wed,  1 Jun 2022 10:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] octeontx2-af: fix error code in is_valid_offset()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <165407761345.1365.5840991906743453184.git-patchwork-notify@kernel.org>
Date:   Wed, 01 Jun 2022 10:00:13 +0000
References: <YpXDrTPb8qV01JSP@kili>
In-Reply-To: <YpXDrTPb8qV01JSP@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com,
        jerinj@marvell.com, hkelam@marvell.com, sbhatta@marvell.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, schalla@marvell.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 31 May 2022 10:28:45 +0300 you wrote:
> The is_valid_offset() function returns success/true if the call to
> validate_and_get_cpt_blkaddr() fails.
> 
> Fixes: ecad2ce8c48f ("octeontx2-af: cn10k: Add mailbox to configure reassembly timeout")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_cpt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net] octeontx2-af: fix error code in is_valid_offset()
    https://git.kernel.org/netdev/net/c/f3d671c71109

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


