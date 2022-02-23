Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD91DC4332F
	for <kernel-janitors@archiver.kernel.org>; Wed, 23 Feb 2022 12:40:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240516AbiBWMkk (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 23 Feb 2022 07:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbiBWMkj (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 23 Feb 2022 07:40:39 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A5DA1BC4;
        Wed, 23 Feb 2022 04:40:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 529F2612B9;
        Wed, 23 Feb 2022 12:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AF491C340F3;
        Wed, 23 Feb 2022 12:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645620010;
        bh=89Y2IQGK+w5/B5kYgTvTvLfJ3sURDQMWHejkJaqeWBg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o78FJbNM0Ka7cNFWGomWLjEG3taHbBz3HqcJorjNNzwxai8XR1hVK1NRZ5EFYTt1U
         CgpWxaVyeOxYz4EKJM3hvHPfYppLZioXLhcz1xYHTDb2Y8iwOd0/EKk8tY9pI6nLS2
         Sod9vhdc0ZHREV91Lk+9KP/AWdSTmWGfBBBgqx6SI4eHRKRX7n3DxcfLLpLuQVldxc
         LUedqZtuukZNo/nSAeAcU9MUEVDooRjhg1zIKmdD/GLjIfMe+LZpm9lDw8Z+LH7+eE
         dM6VlSZjeitGijtfxeVIQxwriT8Rfmmas5LHOXut2UG5MRxUpoTioB8iQYbgpkaR5k
         4GzI9asxJULwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9460AE6D528;
        Wed, 23 Feb 2022 12:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] udp_tunnel: Fix end of loop test in
 udp_tunnel_nic_unregister()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164562001060.25344.12731632032260958454.git-patchwork-notify@kernel.org>
Date:   Wed, 23 Feb 2022 12:40:10 +0000
References: <20220222134251.GA2271@kili>
In-Reply-To: <20220222134251.GA2271@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     davem@davemloft.net, kuba@kernel.org, yoshfuji@linux-ipv6.org,
        dsahern@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Tue, 22 Feb 2022 16:42:51 +0300 you wrote:
> This test is checking if we exited the list via break or not.  However
> if it did not exit via a break then "node" does not point to a valid
> udp_tunnel_nic_shared_node struct.  It will work because of the way
> the structs are laid out it's the equivalent of
> "if (info->shared->udp_tunnel_nic_info != dev)" which will always be
> true, but it's not the right way to test.
> 
> [...]

Here is the summary with links:
  - [net] udp_tunnel: Fix end of loop test in udp_tunnel_nic_unregister()
    https://git.kernel.org/netdev/net/c/de7b2efacf4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


