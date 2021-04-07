Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE59AC43470
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 22:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0B5D61262
	for <kernel-janitors@archiver.kernel.org>; Wed,  7 Apr 2021 22:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhDGWUn (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 7 Apr 2021 18:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:53492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229780AbhDGWUk (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 7 Apr 2021 18:20:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3B3AD61363;
        Wed,  7 Apr 2021 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617834030;
        bh=LM/ydTKs/if4OouqmqENspCwVlHovbniGGzsUVvHTwA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hxw1w/+YgaIzcQqU28bDVI+dNtAgmO1jbERLDPLsDvPgw8wH8Cfyxi1WMMmm5FaEY
         bbbIhXPsAzLxe7vmMFsYdoth46jFnT6BmJqOJzCqdtTEnRC9o0t/edRg7vsqXCUM3r
         kQb2DSOfJryprz6Bb67N39uglGA3d/uHKqRTe6hJgSqUiwAd028EXvd0ZkNY8SDXaV
         YjVva6E+S2LYYvT3qeLxcfc2vHETqQy+w7+PGb5FFI/2V8+gtNF1yBabJwQsJrcruF
         J2mM4eWbZrkJzPt6LH44Fn8l/BImGHbLle2OqxPEcNjrtv6YoW2T6NhD4XSGJfemkn
         GsLAI6iM3qfcw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] tulip: de2104x: use module_pci_driver to simplify
 the code
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161783403021.11274.10026089394881978951.git-patchwork-notify@kernel.org>
Date:   Wed, 07 Apr 2021 22:20:30 +0000
References: <20210407150708.364091-1-weiyongjun1@huawei.com>
In-Reply-To: <20210407150708.364091-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     kuba@kernel.org, mdf@kernel.org, christophe.jaillet@wanadoo.fr,
        vaibhavgupta40@gmail.com, lucyyan@google.com,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Wed, 7 Apr 2021 15:07:08 +0000 you wrote:
> Use the module_pci_driver() macro to make the code simpler
> by eliminating module_init and module_exit calls.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  .../net/ethernet/dec/tulip/de2104x.c    | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)

Here is the summary with links:
  - [net-next] tulip: de2104x: use module_pci_driver to simplify the code
    https://git.kernel.org/netdev/net-next/c/02f2743ecd7b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


