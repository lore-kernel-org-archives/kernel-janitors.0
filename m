Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F096C43217
	for <kernel-janitors@archiver.kernel.org>; Thu,  1 Dec 2022 10:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiLAKVB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbiLAKUW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 1 Dec 2022 05:20:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDC699F4C;
        Thu,  1 Dec 2022 02:20:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2A8D5B81E8A;
        Thu,  1 Dec 2022 10:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE1FEC43470;
        Thu,  1 Dec 2022 10:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669890016;
        bh=DYxx4vEh+2vGSDoOeknz8Z6Ugc5bktxlfVKzCpHut+s=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uIGbeHTrCbDDv8uFTeHGKNpw+qHn7GgEI2Hsk+HbumL8ZljIWbXGolyNuhwbB7j5g
         8sMDnCdDBZw+RpKv6VXsnQmmUfNgLS9xdtK45XDkFRbT4rrPTMSgNmbaFNQnWodMdb
         +Jus4iBS8k8kbiSP9lXMv6A4w1T7aO411dbTDL/hjc5sRm3/blPuBqzJKenvOif8v5
         9x33hI1lLjJ61pD6KvhVdV76VFWdR5l7LZGLLvlxNvS4YyrJ3QOvMvoRzarniRBTcI
         CX6eIV6ZpWIPoZrfjbQSOL+F2d9ZwJZvLWkDj387yTlExd5v64TweCdoH7Q7AviwLI
         edCD+bUMJ4cXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A27EAE270C8;
        Thu,  1 Dec 2022 10:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] bonding: uninitialized variable in
 bond_miimon_inspect()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166989001666.8639.6355322263297688114.git-patchwork-notify@kernel.org>
Date:   Thu, 01 Dec 2022 10:20:16 +0000
References: <Y4SWJlh3ohJ6EPTL@kili>
In-Reply-To: <Y4SWJlh3ohJ6EPTL@kili>
To:     Dan Carpenter <error27@gmail.com>
Cc:     j.vosburgh@gmail.com, jtoppins@redhat.com,
        pavan.chebbi@broadcom.com, vfalico@gmail.com, andy@greyhouse.net,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 28 Nov 2022 14:06:14 +0300 you wrote:
> The "ignore_updelay" variable needs to be initialized to false.
> 
> Fixes: f8a65ab2f3ff ("bonding: fix link recovery in mode 2 when updelay is nonzero")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> v2: Re-order so the declarations are in reverse Christmas tree order
> 
> [...]

Here is the summary with links:
  - [net-next,v2] bonding: uninitialized variable in bond_miimon_inspect()
    https://git.kernel.org/netdev/net-next/c/e5214f363dab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


