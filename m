Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEB7C43460
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79926610A1
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237409AbhDSEEx (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Apr 2021 00:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233479AbhDSEEs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Apr 2021 00:04:48 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 388E2C06138F;
        Sun, 18 Apr 2021 21:04:19 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4FNtVS6yCjz9vH2; Mon, 19 Apr 2021 14:04:16 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Bixuan Cui <cuibixuan@huawei.com>,
        Nathan Lynch <nathanl@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Cc:     kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210409090114.59396-1-cuibixuan@huawei.com>
References: <20210409090114.59396-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/pseries/pmem: Make symbol 'drc_pmem_match' static
Message-Id: <161880479788.1398509.10114956156127750502.b4-ty@ellerman.id.au>
Date:   Mon, 19 Apr 2021 13:59:57 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 9 Apr 2021 17:01:14 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/platforms/pseries/pmem.c:142:27: warning:
>  symbol 'drc_pmem_match' was not declared. Should it be static?
> 
> This symbol is not used outside of pmem.c, so this
> commit marks it static.

Applied to powerpc/next.

[1/1] powerpc/pseries/pmem: Make symbol 'drc_pmem_match' static
      https://git.kernel.org/powerpc/c/2235dea17d56238642121a8085b71d68598534bb

cheers
