Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E82C433C1
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 03:43:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05D0D61A42
	for <kernel-janitors@archiver.kernel.org>; Fri, 26 Mar 2021 03:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhCZDmz (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 Mar 2021 23:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhCZDm0 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 Mar 2021 23:42:26 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D992C06174A;
        Thu, 25 Mar 2021 20:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=S3aM59LzwZv2lhTP9C0ITO0CQL7/3mTFFH7WMQjCEiU=; b=N4Z+WQ/0D63wmvnhgzwQTM+nmf
        yHCwotlJqph2PP5rp2afCDzn0M0r/qd4LphT504V1vClIfCS42aw/ChtGSLtQR25PPTZpEVR7mBfV
        xetgewEuFA0Z5yR0TWnadlD+i3Ge967HX8RMosXugO2B7130o39Lf5qyClEiLkQ6U1iSUDuQMdCXC
        mLLRQqrqGboWT3pw409QtubI7+bLlxGCvzhZ/anulvSkLdnMQ6lN2jyqnfRAZQUkSCX8K5yLEaiaA
        40nYIlasmrInug/FdILDGXfruXcYMGK657AdZcSd+VbxHYjywoAwWfEHTEe2I96ogXoE3/TFkC2O+
        FyF0F/fg==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lPdMO-00EEBG-Rh; Fri, 26 Mar 2021 03:42:10 +0000
Date:   Fri, 26 Mar 2021 03:42:08 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] mm/page_alloc: remove duplicated include from
 page_alloc.c
Message-ID: <20210326034208.GC1719932@casper.infradead.org>
References: <20210326025542.3565329-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326025542.3565329-1-miaoqinglang@huawei.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, Mar 26, 2021 at 10:55:42AM +0800, Qinglang Miao wrote:
> Remove duplicated include.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

can't you make hulk robot do something useful, like untangle the
mass of header includes?  For example, in -next, net/ipv4/tcp.c
has a dependency on pagemap.h.  Why?
