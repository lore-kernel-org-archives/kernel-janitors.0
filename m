Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85D1C4743C
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 21:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9CAA6134F
	for <kernel-janitors@archiver.kernel.org>; Mon, 21 Jun 2021 21:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbhFUVmT (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 21 Jun 2021 17:42:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:42646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231321AbhFUVmT (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 21 Jun 2021 17:42:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8A9E1610C7;
        Mon, 21 Jun 2021 21:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624311604;
        bh=XbOOzVLK3eCRXK7wGpriIjlSKnBU7IQXgHg3u1HZU3I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bYDLhp9HPZSzUts9rj4IpwI7jP9BxfV18c669DdO0lD9BB63JoP/nmXZSOj0BqndX
         E9tkyCSqO7SzTkCiVyEsDXo7Kv7CmoHq5G/CTYyCStHBwU5+9l+Pi65IaH7MITVB2E
         W746/oUIfhfryyHlsrV9nOvcD9VDf0obLTBlP4C8D1W4RqGhPF55TQOcfBJb6s79OY
         v4/SRXKYpTYrHYZ/PogYiEZ/Y1x3pyRsASyVrJG6lXacd5hxo3HNQo6JTg55+YzJqr
         kYtIs4d8+cJllGh2oq62SULZG2mvmDI7hp2Gh0majjddE9+VCq+rvM+RSR6y6jSxhZ
         MAgpSrkgkOyQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: hns3: Fix a memory leak in an error handling path in
 'hclge_handle_error_info_log()'
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162431160448.11017.15355294728321979722.git-patchwork-notify@kernel.org>
Date:   Mon, 21 Jun 2021 21:40:04 +0000
References: <bcf0186881d4a735fb1d356546c0cf00da40bb36.1624182453.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <bcf0186881d4a735fb1d356546c0cf00da40bb36.1624182453.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     yisen.zhuang@huawei.com, salil.mehta@huawei.com,
        davem@davemloft.net, kuba@kernel.org, huangguangbin2@huawei.com,
        tanhuazhong@huawei.com, zhangjiaran@huawei.com,
        moyufeng@huawei.com, lipeng321@huawei.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Sun, 20 Jun 2021 11:49:40 +0200 you wrote:
> If this 'kzalloc()' fails we must free some resources as in all the other
> error handling paths of this function.
> 
> Fixes: 2e2deee7618b ("net: hns3: add the RAS compatibility adaptation solution")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Here is the summary with links:
  - net: hns3: Fix a memory leak in an error handling path in 'hclge_handle_error_info_log()'
    https://git.kernel.org/netdev/net-next/c/b40d7af798a0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


