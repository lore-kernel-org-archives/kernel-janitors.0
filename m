Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC20C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Sep 2021 11:40:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4AFB610E5
	for <kernel-janitors@archiver.kernel.org>; Fri,  3 Sep 2021 11:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348247AbhICLlG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 3 Sep 2021 07:41:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234758AbhICLlF (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 3 Sep 2021 07:41:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BA19610CE;
        Fri,  3 Sep 2021 11:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630669206;
        bh=ZbEm+2nbPeStD6+X7T+DxuQ3gQ3W3sM/epKsqPLVTas=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YSCQjHFv7NfirerRe/F/X49yZ4P2UbJl+9qyVebry/HY/RtIWk4llGluIYVvmboPI
         /tekI9RVowYWMVMfeF+9QReQ3hrYApdGkocPD14bx4ws8wqNRAFiutDECJ/qwIVNfQ
         RcwcJoq2RDHppnFRvbatwOANA2pueGJ0YEAXisRyY8CkD03+ZVCy3DU944xJMScQ0d
         HGMBhwnFVw+gDHou0fX1tgS3q8LJYpf8CREJyCCs0bWvrfNgX3l6cJh7jEsaqYilpg
         DitSj2okBp4qarS7PeY8/gqINuSEplMS3Y7KEK6DlKeX7nTLlsxSIg5gXKRZOzumiQ
         O0b+JufgyVspA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] seg6_iptunnel: Remove redundant initialization of variable
 err
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163066920599.926.10827496368400005217.git-patchwork-notify@kernel.org>
Date:   Fri, 03 Sep 2021 11:40:05 +0000
References: <20210902143506.41956-1-colin.king@canonical.com>
In-Reply-To: <20210902143506.41956-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     davem@davemloft.net, yoshfuji@linux-ipv6.org, dsahern@kernel.org,
        kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Thu,  2 Sep 2021 15:35:05 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read, it
> is being updated later on. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - seg6_iptunnel: Remove redundant initialization of variable err
    https://git.kernel.org/netdev/net/c/bf0df73a2f0d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


