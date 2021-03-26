Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812ECC433C1
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 00:01:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 528B2619F7
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 00:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhCZAAn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Mar 2021 20:00:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:59218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhCZAAK (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Mar 2021 20:00:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5685E619FE;
        Fri, 26 Mar 2021 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616716809;
        bh=746+1DwfvkmFmn0pmpXn9wAUMizJDVWfr1+nje1i2i0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bDl/o5xnWHPKH4YgvmB/O19Kr5q3mG6K+MctdU8CQ4q8ln9Gl3ngZeIGpmqYLJZJb
         XfBaHQZo+sS+2x372zRQIUU9qQePMdi4RnSsNw2BkmE0T+UM9PZ/qVf2RaC9S4sOBv
         rg+qjUeTDgS1Delp4pdTJzWA2iLO/t5hiPtNSz/36Vuw17OXnYcpvD+YnrDyvnRO5T
         CNclHTHEwZkehr7YRktRXfNn3Q6BahvUoIfMQPY4AwWwWHFJOpYcq336rCTddnmILr
         NPr8isGKPel7CjJ1ftcf4D6hxT1hdrK6xv+Dy1Bw20waxQ9XBSK93A0fd5SradpETs
         mom+vlKh+OJpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: usb: lan78xx: remove unused including
 <linux/version.h>
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161671680928.21425.1138306429204242003.git-patchwork-notify@kernel.org>
Date:   Fri, 26 Mar 2021 00:00:09 +0000
References: <20210325025108.1286677-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210325025108.1286677-1-zhengyongjun3@huawei.com>
To:     'Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     woojung.huh@microchip.com, UNGLinuxDriver@microchip.com,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        hulkci@huawei.com
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 25 Mar 2021 10:51:08 +0800 you wrote:
> From: Zheng Yongjun <zhengyongjun3@huawei.com>
> 
> Remove including <linux/version.h> that don't need it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> 
> [...]

Here is the summary with links:
  - [net-next] net: usb: lan78xx: remove unused including <linux/version.h>
    https://git.kernel.org/netdev/net-next/c/a9bada338b68

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


