Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ADEC432BE
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 03:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E345E61039
	for <kernel-janitors@archiver.kernel.org>; Tue, 31 Aug 2021 03:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239603AbhHaDlC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 30 Aug 2021 23:41:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:43996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239585AbhHaDlA (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 30 Aug 2021 23:41:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8B9AF60462;
        Tue, 31 Aug 2021 03:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630381205;
        bh=QMA1pgfvnMOipT1nI60E9hxKbksLelRwRSZMWdWwcQw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ko55ltK0/St1KwTbHgfzVAAxQI8aDwz4cQfqyXw1my9YY0p2LJJSPEWv7J5n4WFbL
         NNmRrVuxL4zRdovdUZCihSdreLa0xZyNxCXsl4lmVDAWZEygUUV62oDA0W5zEubDYi
         U3X+LY3Qyp+TOTenm/ip/UDcfbkeeNipc5nN4s/pkBH6IJWQbrBjqk9wsWu/7GQRDo
         zL0if8NZfRhuGQbjPaKbOpL91jHycIVnc1Y7PPQvDm3pFZLOoeKQi90wtpxlemzMk1
         OlLXDlBKVKfRRFMqdyRJQEf8jqKjyc0cOMLthGK2kF83twqV0V32wjp38OSOvleq1d
         LSg9zUZO1GsVg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: pasemi: Remove usage of the deprecated
 "pci-dma-compat.h" API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163038120552.6773.17379374369003836648.git-patchwork-notify@kernel.org>
Date:   Tue, 31 Aug 2021 03:40:05 +0000
References: <bc6cd281eae024b26fd9c7ef6678d2d1dc9d74fd.1630150008.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <bc6cd281eae024b26fd9c7ef6678d2d1dc9d74fd.1630150008.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sat, 28 Aug 2021 13:28:48 +0200 you wrote:
> In [1], Christoph Hellwig has proposed to remove the wrappers in
> include/linux/pci-dma-compat.h.
> 
> Some reasons why this API should be removed have been given by Julia
> Lawall in [2].
> 
> A coccinelle script has been used to perform the needed transformation
> Only relevant parts are given below.
> 
> [...]

Here is the summary with links:
  - net: pasemi: Remove usage of the deprecated "pci-dma-compat.h" API
    https://git.kernel.org/netdev/net-next/c/a16ef91aa61a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


