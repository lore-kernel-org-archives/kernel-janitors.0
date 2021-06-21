Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE5AC48BC2
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 19:30:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6A446134F
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 19:30:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbhFUTcU (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Jun 2021 15:32:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:52566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231241AbhFUTcU (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Jun 2021 15:32:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 920516135A;
        Mon, 21 Jun 2021 19:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624303805;
        bh=sRn980rAY7YHKmboo5WdEUsaHvywLVtJadvruAzKVv4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=sQiR1zYlGxJ61F3qD4/ArVmkDqVdVswsvLdlyz9KjLKhShopif9ZvNDejGVpFVZ6t
         BkcFQYJx1eQmSmJsOkyXhkueItKVbudpkfy2hP70jV+AzuVkbjagmlRwJ3KCXyTkR2
         KbYnp/E86f24gsckMNhS1g+Tiq/tTsjrCixyX9J4uaG+EKxQzuxN061to57BusRuEo
         ot081M7MiNvrWmH+CHlFQ9wfbAKu136d9mtvhrA06VnevGygtKLFiR/O/JMS/X5vJk
         RGR/jpaENFgvl5byuaFfTTUSarDbqcxc9ZJJBZHXOV/wtemVwRAJIv3HxI1QdrvVkl
         3eFHobz/ZXDdg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: qualcomm: rmnet: fix two pointer math bugs
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162430380554.11970.17234328038547135962.git-patchwork-notify@kernel.org>
Date:   Mon, 21 Jun 2021 19:30:05 +0000
References: <YM32lkJIJdSgpR87@mwanda>
In-Reply-To: <YM32lkJIJdSgpR87@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     subashab@codeaurora.org, stranche@codeaurora.org,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sat, 19 Jun 2021 16:52:22 +0300 you wrote:
> We recently changed these two pointers from void pointers to struct
> pointers and it breaks the pointer math so now the "txphdr" points
> beyond the end of the buffer.
> 
> Fixes: 56a967c4f7e5 ("net: qualcomm: rmnet: Remove some unneeded casts")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: qualcomm: rmnet: fix two pointer math bugs
    https://git.kernel.org/netdev/net-next/c/753ba09aa3ea

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


