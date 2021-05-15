Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D76EC433B4
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 21:04:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB70E61353
	for <kernel-janitors@archiver.kernel.org>; Sat, 15 May 2021 21:04:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbhEOVGK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 15 May 2021 17:06:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbhEOVGK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 15 May 2021 17:06:10 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3944C061573;
        Sat, 15 May 2021 14:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=RJWqyMKE1PxEzZ0wQRXQI9bbKJMETBb0mIpGg8RhjH8=; b=WL7jvMlbkEOGS+ud1cSYdSsj51
        dcGDvBs6x08LSEc35XBKUpkF70LUSNc+hhemtk2S4+c/tAmfggUjHeHHRPKMihpbtwZHXXWMH7Vu4
        1pA/R4PKWYRZDdwjyyFnsshOyT7UgrsIh5iWyznZPdtGkAF1Pc1oNjogb3DylTIhFyU9phh9d3pGf
        ehmC609SriC51RX55TShs5fP1dxzA/Qczob6GsJPBx8tNGP/k72m4q5u+GNNSS43YWRBSz2ZtLGxl
        cYE/dM/R3RYiTQ0bPwz8sOR+zs3Xd5h7j/HOlfigVJeR8HuoYCbsxoQqiNNm2bdlewu0oslRaFlFI
        +DX5qvHA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1li1SD-00BW6D-4a; Sat, 15 May 2021 21:04:11 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id 5AD4C98659E; Sat, 15 May 2021 23:04:06 +0200 (CEST)
Date:   Sat, 15 May 2021 23:04:06 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Khaled ROMDHANI <khaledromdhani216@gmail.com>
Cc:     mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH-next] sched: Fix Dereference after null check
Message-ID: <20210515210406.GH5618@worktop.programming.kicks-ass.net>
References: <20210515171117.23240-1-khaledromdhani216@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515171117.23240-1-khaledromdhani216@gmail.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Sat, May 15, 2021 at 06:11:17PM +0100, Khaled ROMDHANI wrote:
> The group_cfs_rq derefrence the 'se' variable that could
> be passed as NULL pointer. Fix this by adding a check
> against the sched entity 'se' before the derefrence.
> 
> Addresses-Coverity: ("Dereference after null check")
> Signed-off-by: Khaled ROMDHANI <khaledromdhani216@gmail.com>

Please, burn that piece of garbage known as Coverity and go do something
useful.
