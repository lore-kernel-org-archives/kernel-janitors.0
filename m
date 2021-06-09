Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6A7C48BCD
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 21:20:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53393613F2
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 21:20:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhFIVWD (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 17:22:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:58114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229689AbhFIVWA (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 17:22:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 68CC1613F9;
        Wed,  9 Jun 2021 21:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623273605;
        bh=UcYrvICvDlac5FlUB606gCPD6/q7sEx0CvVxyl8+p2M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PxO561wGZn/SruPj/8LV20hfrGw4JQEQTtBKSk0qzO5xmnzLgqTRCI7C7hLI0lYG6
         7neJ6OTdXzhF2lI9e7q3Yu3UoaT9w55Nk59zgDZBIez7ON4whVCt06+SEAl1wnZ0yL
         xdl0uCmJatAhGav8nJMjNtOnS90LpzPz9dPlvi8U60LdPeKHJJA890ZbiWi/EW8Xho
         +93dEA5ef0VVLkcvpV3t1ulzFKjXdfEABxAD5zjsLKmM+hEmCA36pFO6dQp3QM/j/m
         TvAwnORsbzSYqSVC4Xd+qk+DKuJryejuWR40GaonPshgvFKmRpQIiWvqgJgvg38bH1
         5ffolbbrbEpsw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] netdevsim: delete unnecessary debugfs checking
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162327360537.22106.14280192879737938519.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Jun 2021 21:20:05 +0000
References: <YMCQXQx4kHdk7Whx@mwanda>
In-Reply-To: <YMCQXQx4kHdk7Whx@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kuba@kernel.org, vladbu@nvidia.com, dlinkin@nvidia.com,
        davem@davemloft.net, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        jiri@nvidia.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 9 Jun 2021 12:56:45 +0300 you wrote:
> In normal situations where the driver doesn't dereference
> "nsim_node->ddir" or "nsim_node->rate_parent" itself then we are not
> supposed to check the return from debugfs functions.  In the case of
> debugfs_create_dir() the check was wrong as well because it doesn't
> return NULL, it returns error pointers.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net-next] netdevsim: delete unnecessary debugfs checking
    https://git.kernel.org/netdev/net-next/c/4e744cb8126d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


