Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2F7C433FE
	for <kernel-janitors@archiver.kernel.org>; Fri, 18 Nov 2022 12:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241706AbiKRMKX (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 18 Nov 2022 07:10:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241681AbiKRMKU (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 18 Nov 2022 07:10:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97B98FF96;
        Fri, 18 Nov 2022 04:10:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7F949B8239B;
        Fri, 18 Nov 2022 12:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2914C4314B;
        Fri, 18 Nov 2022 12:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668773417;
        bh=ANZ6V1aGh9EOk1nxhQz1CjwI0KqMAqItIJaxUQdN+/0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lQ+pOJKqZQaG76cb+ueaKC/mWnCOdug0SOp4V1hgi59CNroyUC2v6ViVB65XC1R3L
         EX23L7gjp0g9BOgrzVq72Gt+JXmzh2JfE6UfDfEvsQF/XB0zW8NzdKxWiJDnmjjJL+
         Cf73VZ7tpkPqWMWmTGtbav8+NcQqp6FxoDbj+CxxlWm2GEh/kEDmjRKX/5a4rK459K
         r8ocrSfGy+I7DOsxU7OwRB2PA9QXd1Dp/2iGNEh2Di6c7MAlRFYAN9qvGwRjtL7csd
         REBSplUxDo5iZ6ToCX+6KHdXuMN+6mbhXsEkJothDdEVyZ133AfXNcPjVoxQrkoK2K
         vOOZh6egHbDFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D59C5E524E4;
        Fri, 18 Nov 2022 12:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] rxrpc: uninitialized variable in
 rxrpc_send_ack_packet()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <166877341687.19277.857117652193582222.git-patchwork-notify@kernel.org>
Date:   Fri, 18 Nov 2022 12:10:16 +0000
References: <Y3XmQsOFwTHUBSLU@kili>
In-Reply-To: <Y3XmQsOFwTHUBSLU@kili>
To:     Dan Carpenter <error27@gmail.com>
Cc:     dhowells@redhat.com, marc.dionne@auristor.com, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        linux-afs@lists.infradead.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 17 Nov 2022 10:44:02 +0300 you wrote:
> The "pkt" was supposed to have been deleted in a previous patch.  It
> leads to an uninitialized variable bug.
> 
> Fixes: 72f0c6fb0579 ("rxrpc: Allocate ACK records at proposal and queue for transmission")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Applies to net-next.
> 
> [...]

Here is the summary with links:
  - [net-next] rxrpc: uninitialized variable in rxrpc_send_ack_packet()
    https://git.kernel.org/netdev/net-next/c/38461894838b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


