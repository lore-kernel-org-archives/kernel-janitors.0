Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39175C48BE6
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Jun 2021 19:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FF1D613BF
	for <kernel-janitors@archiver.kernel.org>; Wed, 16 Jun 2021 19:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232990AbhFPTwQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 16 Jun 2021 15:52:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:55176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232968AbhFPTwN (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 16 Jun 2021 15:52:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C2044613D8;
        Wed, 16 Jun 2021 19:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623873006;
        bh=/vPuRinRAI0UX3EKBFeOHiRQsklNUdf6VkgcsIsyJ9Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=AN+i3NEJMvvlXChUziwWYaE62Owru/UoyQ/mEQllJMzbF8hBbLSJOqjLplDZByoLy
         0nX74wfOtBiJVnRmoZSNQjBYWKd3dzcyBr+rf7O+rgb7X9H1c4oO1yDzx9BoTBv68+
         sv6ycxNxD2XStqxG5P2PNSCOMolF4MLsEBGAxfq03t4pa3EczTxNM1/bQdEj9X5kmd
         WWtfWHDLI0pAIFMf2nIZPLewCXJAeOh5xuIjfllzJ0o+0bK+R5orL2I8WXYXsjiENm
         qIAaVaCHhnsbwJAfloYqB4b+KS3hIFNAyAxdoHvJoOIiW7OWad04jywO3NCaesGOXr
         zgJMpv35c/Dxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mlxsw: spectrum_router: remove redundant continue statement
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162387300676.13042.13822119163379917626.git-patchwork-notify@kernel.org>
Date:   Wed, 16 Jun 2021 19:50:06 +0000
References: <20210616130258.9779-1-colin.king@canonical.com>
In-Reply-To: <20210616130258.9779-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     jiri@nvidia.com, idosch@nvidia.com, davem@davemloft.net,
        kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 16 Jun 2021 14:02:58 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The continue statement at the end of a for-loop has no effect,
> remove it.
> 
> Addresses-Coverity: ("Continue has no effect")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - mlxsw: spectrum_router: remove redundant continue statement
    https://git.kernel.org/netdev/net-next/c/fb0a1dacf2be

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


