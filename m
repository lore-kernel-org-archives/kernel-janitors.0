Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1107FC433F5
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:40:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5903610FE
	for <kernel-janitors@archiver.kernel.org>; Tue,  7 Sep 2021 09:40:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233822AbhIGJlO (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 7 Sep 2021 05:41:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:35272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233059AbhIGJlM (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 7 Sep 2021 05:41:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1080660E94;
        Tue,  7 Sep 2021 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631007606;
        bh=qDsqXTfEHl+y2RDxIJnWS93V2MDiJ7/lsUysqJrLmYw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ohTAqdsPU4Tz3vq5KIimxb9cnh/Sb77Jbxa+1PyCoJo3U2XtV0EvbcEi2Q/hEFhvx
         /Rj/twDHiPkWuTOyf9sExndh1U5DfHydy+KrnCMo8zPLKxcT4OxYWHi53heUcMwPh+
         uhZmbbn6oIgve7GSLDndwqN5mSGy8En/LRSwX1WY3lJkpoMp9li4LLvAJ/gSsGX7Cf
         cVwihzulXIOdZoyjlkIAqSEVL4IVhTh1ikxHBEkkC7wkbiB+OLvWcjppSUVSks0qSA
         KGF2VGB2gP58vbEaIddYp+v9EXlsauuWwL9WIOKNWulW3nIcGHlwtbTpXR0oKzXDjV
         U1vzvK0f8/Kcw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bonding: 3ad: pass parameter bond_params by reference
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <163100760600.32009.3812329334596885476.git-patchwork-notify@kernel.org>
Date:   Tue, 07 Sep 2021 09:40:06 +0000
References: <20210907084534.10323-1-colin.king@canonical.com>
In-Reply-To: <20210907084534.10323-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     j.vosburgh@gmail.com, vfalico@gmail.com, andy@greyhouse.net,
        davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Tue,  7 Sep 2021 09:45:34 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The parameter bond_params is a relatively large 192 byte sized
> struct so pass it by reference rather than by value to reduce
> copying.
> 
> Addresses-Coverity: ("Big parameter passed by value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> [...]

Here is the summary with links:
  - bonding: 3ad: pass parameter bond_params by reference
    https://git.kernel.org/netdev/net/c/bbef56d861f1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


