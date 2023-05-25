Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EE3C77B7A
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 11:19:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240824AbjEYLTo (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 07:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbjEYLTo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 07:19:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FAE910B;
        Thu, 25 May 2023 04:19:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6809644DB;
        Thu, 25 May 2023 11:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB594C433AC;
        Thu, 25 May 2023 11:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685013581;
        bh=v1ZTRGxVV2xlQBF1uYpuflSiapUKWdb/B+skdts2nlM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jUwroto6LuGog9Fmjhcy7XiDgknI09l7LNaYa6Yi0g0/yX5ZZ3SL6bEjuzfHrQcTr
         JOWxFd831HlS7E2UDpb+Kqmqper3jKbDwNG3Kfw3P0xd1oq81+24MoC9ReC57TGOo7
         La2g2q4HO1ztEtSo1azdL8etEp37ETqo3lqC71AGVvLWVcJvwxU0JJEedi73YhB77B
         4lJzTifBubzNZ/uVKy5qS5+wOc8w50JAHijmb6Qo1/rnmbXOPlMHioOSf7dBlR9aUR
         g1QxzAYSIEaDw6CTGcHuzXH8LR+UsS53ddKC31zlwJGZkn31fWcT9gTwNKdZK1yDv9
         SDNFe8K6/ZsGQ==
Date:   Thu, 25 May 2023 12:19:37 +0100
From:   Lee Jones <lee@kernel.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     =?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: wcd934x: Fix an error handling path in
 wcd934x_slim_probe()
Message-ID: <20230525111937.GC411262@google.com>
References: <02d8447f6d1df52cc8357aae698152e9a9be67c6.1684565021.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02d8447f6d1df52cc8357aae698152e9a9be67c6.1684565021.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, 20 May 2023, Christophe JAILLET wrote:

> If devm_gpiod_get_optional() fails, some resources need to be released, as
> already done in the .remove() function.
> 
> While at it, remove the unneeded error code from a dev_err_probe() call.
> It is already added in a human readable way by dev_err_probe() itself.
> 
> Fixes: 6a0ee2a61a31 ("mfd: wcd934x: Replace legacy gpio interface for gpiod")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/wcd934x.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
