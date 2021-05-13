Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2967DC43460
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 23:00:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CD1761435
	for <kernel-janitors@archiver.kernel.org>; Thu, 13 May 2021 23:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhEMXB0 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 13 May 2021 19:01:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:48722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231307AbhEMXBW (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 13 May 2021 19:01:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7455C61454;
        Thu, 13 May 2021 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620946811;
        bh=20GcvdJUhfCWiDT7SzttnBcPjObHN5KFdOddPzBDxas=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=e3O203q3WPBj6qFopnW1i1q4KVnkyzHpknidFokIv9imaTPTkAv7u23PmkuspVm9u
         axCpVYebL8yVoiNrkDDuPgfjyNTS9mZfgWHQh/cxXFp6+7EicWjnoyrrJN5PaZ1aqU
         jFsH/2IFX9j5raUVI95N0h5Vpsgnxfg40y/x1vI5DrW9ieI8iCK4qSF7cmc/A6X4U3
         EaV8nP9fBOdXgaLUKAOatDrasQQLSgNd5nENScCTKgCe30fvItEbkvUJxDFLwN8Z9D
         jLanFjSr+QpV+gIq/sWqrZxgFvXiIn4nCdbAm39+4H6CFj7tnHkM9bKXxy1Y4AzkLi
         EHToRPTvUKGVA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: qed: remove redundant initialization of variable rc
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <162094681142.5074.9135283507043875343.git-patchwork-notify@kernel.org>
Date:   Thu, 13 May 2021 23:00:11 +0000
References: <20210513114910.57915-1-colin.king@canonical.com>
In-Reply-To: <20210513114910.57915-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     aelior@marvell.com, GR-everest-linux-l2@marvell.com,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 13 May 2021 12:49:10 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable rc is being initialized with a value that is never read,
> it is being updated later on.  The assignment is redundant and can be
> removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - net: qed: remove redundant initialization of variable rc
    https://git.kernel.org/netdev/net-next/c/5efe2575316f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


