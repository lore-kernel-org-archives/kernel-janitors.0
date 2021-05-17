Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7326FC433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 21:00:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F8D961261
	for <kernel-janitors@archiver.kernel.org>; Mon, 17 May 2021 21:00:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244593AbhEQVB2 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 17 May 2021 17:01:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:48084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233271AbhEQVB0 (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 17 May 2021 17:01:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E9AE46124C;
        Mon, 17 May 2021 21:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621285210;
        bh=IUIMTh5PmCOGu2WUTJ5DT1tr2IfldLFFqWohzm4vPNI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=S9qSXeLpiFhhjzlTWLNjJ/td/3qPI2f18QP46RXLYCCm/X9zZDZjxF0m7J/M3FQTD
         +HtVroRQOkhm/DjRjtgEQwQKSAseugYrMOIJcYpmQdjJJInZWi4KyhyzRJw5H0mJwU
         6bRO03YrHnwjX0uvzOOyhASL5Bm8Wu09V7PEab7MuEkhz0yxXCgPmYBoAEzTnkv71d
         Qdgkdg6VveJrybl9QYIGnlcUk757hdDXedkmPA8S77lkyx1iXYJOrhx37Ttat4MBiG
         A5AkvyjKp+5UQzu2MWRukBSs5b60911dBjsc36CQ1nnTKuIHGzpP+Mz3O7p7dx+v4w
         l2cFldxgISmyQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 net] net: hso: check for allocation failure in
 hso_create_bulk_serial_device()
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162128520990.2358.2101615152759777465.git-patchwork-notify@kernel.org>
Date:   Mon, 17 May 2021 21:00:09 +0000
References: <YJ6IMH7jI9QFdGIX@mwanda>
In-Reply-To: <YJ6IMH7jI9QFdGIX@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     davem@davemloft.net, johan@kernel.org, kuba@kernel.org,
        oneukum@suse.com, mail@anirudhrb.com, zhengyongjun3@huawei.com,
        geert@linux-m68k.org, kernel@esmil.dk, rkovhaev@gmail.com,
        linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Fri, 14 May 2021 17:24:48 +0300 you wrote:
> In current kernels, small allocations never actually fail so this
> patch shouldn't affect runtime.
> 
> Originally this error handling code written with the idea that if
> the "serial->tiocmget" allocation failed, then we would continue
> operating instead of bailing out early.  But in later years we added
> an unchecked dereference on the next line.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: hso: check for allocation failure in hso_create_bulk_serial_device()
    https://git.kernel.org/netdev/net/c/31db0dbd7244

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


