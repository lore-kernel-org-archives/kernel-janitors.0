Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B60C4708F
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 00:10:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC1D1613B1
	for <kernel-janitors@archiver.kernel.org>; Wed,  2 Jun 2021 00:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235307AbhFBALv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 20:11:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:56034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235257AbhFBALu (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 20:11:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 24D64613D0;
        Wed,  2 Jun 2021 00:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622592608;
        bh=DijD4BsDF0b2eVVKw56svSWUO3/dPAhH+pwePeLp5lk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=T+w+SAbs9tgddpm2R+7h+AUayHJ+goDG/Xgp6b7GMLqcQGX9giwKu3DfaCUQ/l81Q
         QU52nGFF/r2/+zX3ThT3NRZm3kAWvnLGwWBaYy8CT1upGtnVLDiMaawON7wXXNHjCG
         wPMQqkYUfdAfXtWbu5kFgGmUev2TCvRjkNUm7SiG5XMHHqsaXtfKjb/lHuzePMiwb6
         8Ai8UfRNGNUpsEpoJ8qpDEsz1WWrqkllzSYbPNN5brq412gsvLx5hFKCjrsjLdAjQB
         FiHf9IW36jE2I503wYHz0c+OpicWyqijCCryLlv7wYZT2bUkdiyPcnZMgGPINLgIpI
         zVNWq1oX2C7fg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] NFC: microread: Remove redundant assignment to variable
 err
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162259260810.22595.4210179382569417389.git-patchwork-notify@kernel.org>
Date:   Wed, 02 Jun 2021 00:10:08 +0000
References: <YLY3pSMrpbQxIJxO@fedora>
In-Reply-To: <YLY3pSMrpbQxIJxO@fedora>
To:     Nigel Christian <nigel.l.christian@gmail.com>
Cc:     krzysztof.kozlowski@canonical.com, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Tue, 1 Jun 2021 09:35:33 -0400 you wrote:
> In the case MICROREAD_CB_TYPE_READER_ALL clang reports a dead code
> warning. The error code assigned to variable err is already passed
> to async_cb(). The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Nigel Christian <nigel.l.christian@gmail.com>
> 
> [...]

Here is the summary with links:
  - [v2] NFC: microread: Remove redundant assignment to variable err
    https://git.kernel.org/netdev/net-next/c/e5432cc71ab6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


