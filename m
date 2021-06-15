Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37991C49361
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 18:30:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1645061350
	for <kernel-janitors@archiver.kernel.org>; Tue, 15 Jun 2021 18:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhFOScJ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 15 Jun 2021 14:32:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:41382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231202AbhFOScI (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 15 Jun 2021 14:32:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 09A6661241;
        Tue, 15 Jun 2021 18:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623781804;
        bh=v5h7MPUXi06R05KquUDYydTT6Ws84glO6Sqno5wx7dY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tF2cAxVE5fOCVnpbvAqkqrqgAhwdj7vDTU7m/s6fB6pzAcNBVeC+4cCU6KR0ilmY3
         05mE7+kPAIIqGiZ7tfb/kmXdV+botLXFKCFQYDd8G4FpdDpVdKlmNKXiT5fvoJPMSI
         CMUz5tp6BxymDSsrlJFmFQ6whmFMhXucWcBDWrLRusiCtPowjcaRqLQz6I3wj5nb86
         WmUG928PIjzYVo3Tcn0N7wx3tpMNJa8LeQsq2savZPUFyaklkyS6ZR2G8fl0YQ3FgL
         9mxYNtc+/73WkSkYa8NGYxxsB83Hlxt3xyAbzzaHUzzx1rym7M0ffQs5V1K9UktSwb
         JKAsq8IkG1woA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][V2] net: dsa: b53: remove redundant null check on dev
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162378180400.31286.14718530027815032783.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Jun 2021 18:30:04 +0000
References: <20210615090516.5906-1-colin.king@canonical.com>
In-Reply-To: <20210615090516.5906-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     f.fainelli@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com,
        olteanv@gmail.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 15 Jun 2021 10:05:16 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer dev can never be null, the null check is redundant
> and can be removed. Cleans up a static analysis warning that
> pointer priv is dereferencing dev before dev is being null
> checked.
> 
> [...]

Here is the summary with links:
  - [V2] net: dsa: b53: remove redundant null check on dev
    https://git.kernel.org/netdev/net-next/c/11b57faf951c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


