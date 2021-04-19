Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A371DC433ED
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8679160E09
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237381AbhDSEEv (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Apr 2021 00:04:51 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:42679 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233922AbhDSEEp (ORCPT <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Apr 2021 00:04:45 -0400
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4FNtVR03sGz9vGs; Mon, 19 Apr 2021 14:04:14 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Al Viro <viro@zeniv.linux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Bixuan Cui <cuibixuan@huawei.com>
Cc:     kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210409063855.57347-1-cuibixuan@huawei.com>
References: <20210409063855.57347-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/powernv: make symbol 'mpipl_kobj' static
Message-Id: <161880479893.1398509.5196822029182381609.b4-ty@ellerman.id.au>
Date:   Mon, 19 Apr 2021 13:59:58 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 9 Apr 2021 14:38:55 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/platforms/powernv/opal-core.c:74:16: warning:
>  symbol 'mpipl_kobj' was not declared.
> 
> This symbol is not used outside of opal-core.c, so marks it static.

Applied to powerpc/next.

[1/1] powerpc/powernv: make symbol 'mpipl_kobj' static
      https://git.kernel.org/powerpc/c/ff0b4155ae9903539d1299a9a4c8717fb7eb6009

cheers
