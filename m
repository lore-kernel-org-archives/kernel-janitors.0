Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF28C433ED
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Apr 2021 08:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1EAF6137B
	for <kernel-janitors@archiver.kernel.org>; Sun,  4 Apr 2021 08:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhDDIuU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sun, 4 Apr 2021 04:50:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:60844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229483AbhDDIuR (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Sun, 4 Apr 2021 04:50:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 88DCE6137E;
        Sun,  4 Apr 2021 08:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617526211;
        bh=QoGC1yhoni9jvAVL/D0z5cbqyRjVPgg1UllGcfy5T34=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZoClquFp9RLSuqtR/k2xlI67zXHnS5Ko4gfTQxfZxvPNq7FujNHuUhbwYszutQxYq
         NGtnl09xPQFzZM6QQGWetQEULmClJBe0CGo/OZyXStSOBuAXrthe9E4c+1LMZjiVXB
         bgOYPRWU07BdQ2paa5m661+R+5cLRD6B1DxPsVpQYjX38XIEuRfNyRBm3XGxM2rCTn
         4peh8jK0dajPfihBBZL3Z+8bznzMpyfrtfZoV3FCZDz4k166wBUHLsDa4vqIhTgMnY
         eglVWl3r2r4377eIlF9KaiodmZHcynTYsBx5SQid27p0cPSimMUcjpAQc/hkWWcRCK
         sb+DjzuyyH8eQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: openvswitch: Use 'skb_push_rcsum()' instead of hand
 coding it
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161752621149.8645.8680879512074696672.git-patchwork-notify@kernel.org>
Date:   Sun, 04 Apr 2021 08:50:11 +0000
References: <0c50411744412a25332ada56836c6181674843df.1617520174.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <0c50411744412a25332ada56836c6181674843df.1617520174.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     pshelar@ovn.org, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, dev@openvswitch.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun,  4 Apr 2021 09:11:03 +0200 you wrote:
> 'skb_push()'/'skb_postpush_rcsum()' can be replaced by an equivalent
> 'skb_push_rcsum()' which is less verbose.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  net/openvswitch/conntrack.c    | 6 ++----
>  net/openvswitch/vport-netdev.c | 7 +++----
>  2 files changed, 5 insertions(+), 8 deletions(-)

Here is the summary with links:
  - net: openvswitch: Use 'skb_push_rcsum()' instead of hand coding it
    https://git.kernel.org/netdev/net-next/c/7d42e84eb99d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


