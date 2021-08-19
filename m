Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCEDC4338F
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Aug 2021 12:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B46F561152
	for <kernel-janitors@archiver.kernel.org>; Thu, 19 Aug 2021 12:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239049AbhHSMao (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 19 Aug 2021 08:30:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:47370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231179AbhHSMan (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 19 Aug 2021 08:30:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4A4CF6113E;
        Thu, 19 Aug 2021 12:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629376207;
        bh=iqXcFMJvuCaJ4en8Q1z3xwM8yoR3225squLbfZ5v02c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OTyRPzSf3mdJdQLXiSUtQQKNexP8WDifaRPiZOJo0/T5IYdkbbfM0MQfucbQPA+nK
         l6+crepuO8cOJ+fH1t96MIhPrdQfFIohMKURg9mF7NhIvXLDzMjB5cV5HciTvI3M6t
         lZ29cN+rf4jaH+SZTrhiYi48gv2VJSS27tXO+RQswD7O0ebpIwD1DISkeB9cPA6fIr
         x+B1sTX9qFXqSlalUGoZEiCUlGUmh0fwkrqU8S1b5jMf0iMC3i028c48Jk7VV4o32l
         xDYZ/ROaLt4RFtQQdApzPKlTs9ahBW2J+cW4d1K4W/yT8FLmiIdu7pHZ85YCToBOD1
         hGuvQerpyZvng==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hinic: make array speeds static const, makes object smaller
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162937620725.15458.10480464318828001268.git-patchwork-notify@kernel.org>
Date:   Thu, 19 Aug 2021 12:30:07 +0000
References: <20210819115253.6324-1-colin.king@canonical.com>
In-Reply-To: <20210819115253.6324-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     luobin9@huawei.com, davem@davemloft.net, kuba@kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 19 Aug 2021 12:52:53 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array speeds on the stack but instead it
> static const. Makes the object code smaller by 17 bytes:
> 
> Before:
>    text    data     bss     dec     hex filename
>   39987   14200      64   54251    d3eb .../huawei/hinic/hinic_sriov.o
> 
> [...]

Here is the summary with links:
  - hinic: make array speeds static const, makes object smaller
    https://git.kernel.org/netdev/net-next/c/36d5825babbc

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


