Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BCAC2B9F4
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 18:30:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A61E0610A5
	for <kernel-janitors@archiver.kernel.org>; Thu, 17 Jun 2021 18:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbhFQScM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 17 Jun 2021 14:32:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:42468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231840AbhFQScL (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 17 Jun 2021 14:32:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C7B1C613DF;
        Thu, 17 Jun 2021 18:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623954603;
        bh=saXO2ZGugOctgdxdneoA2CdZgQSmapyrK/1GUJ9Np6U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vPM3TZ3wnS7rjWc0JJNHqUHuUvMy5YTsGnIakN+RszJb/NMD5sm4pXiKToO5iXseh
         OmwbYnSLO8vpIrjrmjlMiOPMJDrgl+LWhCyDpgmOOKHGjLa/VHb2Kt20dgR1ysbBgi
         zQyAiLfuTKCJ/+Qd/uqdYBHPcuPnoNTYax5AYc4BgxyCoQ7geOMi68sp3ptMW841gz
         gjKEMj49qIi8PaSEnIvjnfgWAmsMZR6ebNE0cOLfa+q57SBxACZHn1hDRznFFkHnc5
         IM7Lg2PpBs0r3+20TXJGdNMzL1H9E3bbiVOJAgGkF2i2F/s35ocWjs9AYpRbfWG4YN
         J7I8af+84PmUw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] be2net: Fix an error handling path in 'be_probe()'
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162395460373.29839.17951894643657903550.git-patchwork-notify@kernel.org>
Date:   Thu, 17 Jun 2021 18:30:03 +0000
References: <971dd676b5f6a9986c5b4b0c85cf14fa667d53a2.1623868840.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <971dd676b5f6a9986c5b4b0c85cf14fa667d53a2.1623868840.git.christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     ajit.khaparde@broadcom.com, sriharsha.basavapatna@broadcom.com,
        somnath.kotur@broadcom.com, davem@davemloft.net, kuba@kernel.org,
        sathya.perla@emulex.com, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Wed, 16 Jun 2021 20:43:37 +0200 you wrote:
> If an error occurs after a 'pci_enable_pcie_error_reporting()' call, it
> must be undone by a corresponding 'pci_disable_pcie_error_reporting()'
> call, as already done in the remove function.
> 
> Fixes: d6b6d9877878 ("be2net: use PCIe AER capability")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> [...]

Here is the summary with links:
  - be2net: Fix an error handling path in 'be_probe()'
    https://git.kernel.org/netdev/net/c/c19c8c0e666f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


