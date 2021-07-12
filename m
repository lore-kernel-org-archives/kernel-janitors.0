Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9790C07E99
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 18:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8386261241
	for <kernel-janitors@archiver.kernel.org>; Mon, 12 Jul 2021 18:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235890AbhGLScw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 12 Jul 2021 14:32:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:40828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230477AbhGLScw (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jul 2021 14:32:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9FA5F61186;
        Mon, 12 Jul 2021 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626114603;
        bh=53oJ2AU+FZK9jxaEkJqYWcoLJ24v7HhvSVfykiOy/WU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=HgAIqQK5HpNgUX+zGdangvHWamccRH9KMGJnNwuQ8EEeTjnaqzyypXNOJ07xGm+As
         m1s8cyoWCsXn1yALlZN+eDo15rgeQstzpyeMR0NT/Gis/Pc8GSE7s515YMMaZSbHDf
         IQC75x7O9bMF3V6Bj5JbypOASJGurerrMt8wlCFDi+XDzvWL/FIxj/pprEJ3X7tacB
         N0s9JgDnCu0ZkQKBnfj7k5Yj+RDsNHauqEorPn5dFM9XXWEiCbdz8xQhN6haKvFG6P
         Rut7dgysuRsHQzV8LcQv6KsNiS7QF7qKeadmMJb0tjOJVLD2RUSue20Rzto/4DaePc
         1zKs0obc4IBWA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] octeontx2-pf: Fix uninitialized boolean variable pps
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162611460359.21721.179484108889864194.git-patchwork-notify@kernel.org>
Date:   Mon, 12 Jul 2021 18:30:03 +0000
References: <20210712143750.100890-1-colin.king@canonical.com>
In-Reply-To: <20210712143750.100890-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     sgoutham@marvell.com, gakula@marvell.com, sbhatta@marvell.com,
        hkelam@marvell.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Mon, 12 Jul 2021 15:37:50 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where act->id is FLOW_ACTION_POLICE and also
> act->police.rate_bytes_ps > 0 or act->police.rate_pkt_ps is not > 0
> the boolean variable pps contains an uninitialized value when
> function otx2_tc_act_set_police is called. Fix this by initializing
> pps to false.
> 
> [...]

Here is the summary with links:
  - octeontx2-pf: Fix uninitialized boolean variable pps
    https://git.kernel.org/netdev/net/c/71ce9d92fc70

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


