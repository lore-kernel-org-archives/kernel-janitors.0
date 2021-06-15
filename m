Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0221FC48BDF
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 18:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4D4761350
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 18:40:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbhFOSmI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 14:42:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:45742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229943AbhFOSmI (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 14:42:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 859D161241;
        Tue, 15 Jun 2021 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623782403;
        bh=6qqCTPZL3C/M7cqpyoyDwDU2TPVgWLs++KVjDiqeSKs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Xj5s9R7JlA8WojDTQThWwToY6whN1Sg4kaYgHxl14w4PUhF57nDAMrsCC5I6JR+7Q
         7kouKwd5Q44zD+aKktRqjAAgs6+rqSLFGo37IPasbrPVanulRI0o0iA7ykKFKEbrm8
         nsGEa5KuA76qwXKNSeMI3llBcM18N+VFqCfn9XAtjvyIxaxP4OEx+fvz313LE4RAm/
         QqCS8IhBERjHOsC2OUKiJAy+I6pwqlwAqIIKIFudBHFfGygTLrZuLbsHcwvJNpP7H2
         ZOS5oIFVFCyMEZcyY67PrWBYMBsGlycDb7Eqd83QU855J2AAVbcR1dCa4HRM9yJWco
         RbCwQ7BIEkbiA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] octeontx2-pf: Fix spelling mistake "morethan" -> "more
 than"
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162378240348.3603.777097076897975081.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Jun 2021 18:40:03 +0000
References: <20210615101457.9704-1-colin.king@canonical.com>
In-Reply-To: <20210615101457.9704-1-colin.king@canonical.com>
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

On Tue, 15 Jun 2021 11:14:57 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/marvell/octeontx2/af/rvu_npc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [next] octeontx2-pf: Fix spelling mistake "morethan" -> "more than"
    https://git.kernel.org/netdev/net-next/c/f25dcde97439

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


