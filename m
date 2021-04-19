Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61D9C43603
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B2D9613AA
	for <kernel-janitors@archiver.kernel.org>; Mon, 19 Apr 2021 04:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237393AbhDSEEw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 19 Apr 2021 00:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234109AbhDSEEs (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 19 Apr 2021 00:04:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7C8C06138E;
        Sun, 18 Apr 2021 21:04:18 -0700 (PDT)
Received: by ozlabs.org (Postfix, from userid 1034)
        id 4FNtVR5nzHz9tl3; Mon, 19 Apr 2021 14:04:15 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        Bixuan Cui <cuibixuan@huawei.com>,
        Liu Shixin <liushixin2@huawei.com>
Cc:     kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20210409090109.59347-1-cuibixuan@huawei.com>
References: <20210409090109.59347-1-cuibixuan@huawei.com>
Subject: Re: [PATCH -next] powerpc/pseries: Make symbol '__pcpu_scope_hcall_stats' static
Message-Id: <161880479761.1398509.15398715314309643145.b4-ty@ellerman.id.au>
Date:   Mon, 19 Apr 2021 13:59:57 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 9 Apr 2021 17:01:09 +0800, Bixuan Cui wrote:
> The sparse tool complains as follows:
> 
> arch/powerpc/platforms/pseries/hvCall_inst.c:29:1: warning:
>  symbol '__pcpu_scope_hcall_stats' was not declared. Should it be static?
> 
> This symbol is not used outside of hvCall_inst.c, so this
> commit marks it static.

Applied to powerpc/next.

[1/1] powerpc/pseries: Make symbol '__pcpu_scope_hcall_stats' static
      https://git.kernel.org/powerpc/c/193e4cd8ed9dd01092d01df7706a6b344c946af4

cheers
