Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2077DC433B4
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Apr 2021 21:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8D3E61181
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Apr 2021 21:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235241AbhDBVaQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Apr 2021 17:30:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234821AbhDBVaO (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Apr 2021 17:30:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B0A6961185;
        Fri,  2 Apr 2021 21:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617399012;
        bh=tGJnlXXLwsH1rKOWBpmfiU6/kTfA9l5AiZGTI1R1pP4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hGHdZEBjjOoArq45HZ/Ns0rItOYrzU+tZ/MoSx4HKTopl09xDj9t3LBFAfiLytzr8
         BKM8KURW+3hrNMmmyZDvMbpfquHfjVJFOAM6IUA+SoJURveuzbRGIBRYuwGE0zJIFi
         Qp334tFSUlFXxTNQA1V0u7YwIyJLcG37JCB+r14Su9J8dyS0Ru93zaoP9MSQ3uQ32l
         PhWj+7jDqGPHxFLWZppbmxAH6QjoJHysKidoZfMCLC731dWonFBPqCnFbY9fO/8ap6
         B4QW3l3egiDv+kfrgcBO8S5o+DtBRFaoM/a58E/zkhnv85+bdXwZ4zb4c+B4NkoU3m
         QnDcJuloBiCvg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] nfc: pn533: prevent potential memory corruption
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <161739901265.1946.17798019048869981183.git-patchwork-notify@kernel.org>
Date:   Fri, 02 Apr 2021 21:30:12 +0000
References: <YGcDqkN1v/NVZA9z@mwanda>
In-Reply-To: <YGcDqkN1v/NVZA9z@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kuba@kernel.org, sameo@linux.intel.com, linville@tuxdriver.com,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Fri, 2 Apr 2021 14:44:42 +0300 you wrote:
> If the "type_a->nfcid_len" is too large then it would lead to memory
> corruption in pn533_target_found_type_a() when we do:
> 
> 	memcpy(nfc_tgt->nfcid1, tgt_type_a->nfcid_data, nfc_tgt->nfcid1_len);
> 
> Fixes: c3b1e1e8a76f ("NFC: Export NFCID1 from pn533")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]

Here is the summary with links:
  - [net-next] nfc: pn533: prevent potential memory corruption
    https://git.kernel.org/netdev/net-next/c/ca4d4c34ae9a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


