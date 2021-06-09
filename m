Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567ABC48BD1
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 22:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F4AA6139A
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Jun 2021 22:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbhFIWm3 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Jun 2021 18:42:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:38436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230084AbhFIWmU (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Jun 2021 18:42:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4A65E613EF;
        Wed,  9 Jun 2021 22:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623278425;
        bh=Illkht5WFpE954pZOZxc15dUTH5CLXx2m9a0e0ckTO0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NCJs8tjPi4KXJyp6rPi0MwJ989PBcYoNkElcTah1qwOAj9qfg0v1fCnLBYFcMvKzv
         jK0hfmkh1Hka9ec0MlQ9hNp8t3ir1hkEgPlKSz9/LdIh/Opq7gjNppyE/I5V/HrECA
         rtuxmloD4Q02vsG9BeFS/MZJWJ3hkZYv5dSfw1Ag4Y2UC6YW36vH5Y41FjkpPyfopp
         YkkXdfDXL46VGkr5ZdAtKR2wicjNNILsLfowMOA+QbwpHOpGi5+YuWPGxQiLFUjvIU
         Dx2s5zSj3P5aqzFbDmW2nbHrLoUq9x5uHeESSZwmpemG7YizYYbssxpkfMSCUNhkOM
         95cs85ePMmxSQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] mlxsw: thermal: Fix null dereference of NULL
 temperature parameter
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162327842525.25473.13374384894678302693.git-patchwork-notify@kernel.org>
Date:   Wed, 09 Jun 2021 22:40:25 +0000
References: <20210609175657.299112-1-colin.king@canonical.com>
In-Reply-To: <20210609175657.299112-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     jiri@nvidia.com, idosch@nvidia.com, davem@davemloft.net,
        kuba@kernel.org, c_mykolak@nvidia.com, vadimp@nvidia.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed,  9 Jun 2021 18:56:57 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The call to mlxsw_thermal_module_temp_and_thresholds_get passes a NULL
> pointer for the temperature and this can be dereferenced in this function
> if the mlxsw_reg_query call fails.  The simplist fix is to pass the
> address of dummy temperature variable instead of a NULL pointer.
> 
> [...]

Here is the summary with links:
  - [next] mlxsw: thermal: Fix null dereference of NULL temperature parameter
    https://git.kernel.org/netdev/net-next/c/f3b5a8907543

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


