Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53C7C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Mar 2022 23:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbiCQXve (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Mar 2022 19:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbiCQXvb (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Mar 2022 19:51:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8118D2B04F1;
        Thu, 17 Mar 2022 16:50:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1C02961337;
        Thu, 17 Mar 2022 23:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3FCDC340FA;
        Thu, 17 Mar 2022 23:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647561013;
        bh=GSOTd2RxSS2kcmyFx4FLiHgoTudEzwGqgoH4ZKQYRv0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SGDYuBs2TF9rGRZ60vJCgfRlPYr2aqy+9e6lWoy5MiU5bDekN1eshO9NX8qtKCdCJ
         Yxd5EveoNUGIcZkVfUy1K+aMu75g2AUlRntP5XQr0PcvJK6iwTZLs4oJa7BspN5krx
         pmKcrWMuH3Fa7ds9pQhaXZkjWCNOhPBf5Hsdk7VUraHroid96td1kzMOmbjNVfnsQr
         lRikQk32sqfI8h5AYLF9kacET9IiWdczwR9UmXSNqSCVmq5wMITpL90EjL18yL9fvf
         oRe30Mht1yHus+x2NEZ4RDFycLkDUzd5WGbnCNaXnWNzyVWIzoDl8KkclEjiPArcg6
         OClPeApAfv1tQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE2F3F03846;
        Thu, 17 Mar 2022 23:50:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] gtp: Remove a bogus tab
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <164756101290.14093.7117497281533622987.git-patchwork-notify@kernel.org>
Date:   Thu, 17 Mar 2022 23:50:12 +0000
References: <20220317075642.GD25237@kili>
In-Reply-To: <20220317075642.GD25237@kili>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     pablo@netfilter.org, laforge@gnumonks.org, davem@davemloft.net,
        kuba@kernel.org, osmocom-net-gprs@lists.osmocom.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by Tony Nguyen <anthony.l.nguyen@intel.com>:

On Thu, 17 Mar 2022 10:56:42 +0300 you wrote:
> The "kfree_skb(skb_to_send);" is not supposed to be indented that far.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/gtp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - [net-next] gtp: Remove a bogus tab
    https://git.kernel.org/netdev/net-next/c/02f393381d14

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


