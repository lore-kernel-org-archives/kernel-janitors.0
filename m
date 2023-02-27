Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867C6C64ED8
	for <kernel-janitors@archiver.kernel.org>; Mon, 27 Feb 2023 13:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjB0Nzl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 27 Feb 2023 08:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjB0Nzk (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 27 Feb 2023 08:55:40 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD89198F
        for <kernel-janitors@vger.kernel.org>; Mon, 27 Feb 2023 05:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=j7HtO74u6f+rEmJqXXUNSlzufGVB6OYhbM4LFnxiQus=; b=HIgnz6g90OgB0+kXbXc6goDf1c
        NyNHAFXUuBQTN1t+vaWFagwRQnFQC1xTGD6tsO0ORGo48vG2lxs/uaiNA2wEIFHyqkLwpR9tVrO/y
        Ue1vcm20CgQJ8cgWAuOfrE2GU2FTyKmneFCj/O36Pji8MAsVU5EuKXPdgvopYKSea6gjjTRBOw5jr
        OXJE5IDXgDxmobPOUMVXwCjMMa5K3UvdzMWH8HQlNEhPqB+iVigG7Mhn3WnOtuF86fVmi1MCHBnCq
        faMOFFL/hjii0oVVeZwc8i6bwEFSFvTR7lNReOXN9rIs5FHKHbdfdEB72sWunOk70PknGgtTS37RB
        t0yRVAhg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1pWdya-0009MB-5P; Mon, 27 Feb 2023 13:55:36 +0000
Date:   Mon, 27 Feb 2023 13:55:36 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     paulb@nvidia.com, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net/sched: cls_api: Support hardware miss to tc
 action
Message-ID: <Y/y2WL+ISgQU4ji1@casper.infradead.org>
References: <Y/y2DhV37BDxSwFc@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/y2DhV37BDxSwFc@kili>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Feb 27, 2023 at 04:54:22PM +0300, Dan Carpenter wrote:
>     100         err = xa_alloc_cyclic(&tcf_exts_miss_cookies_xa, &n->miss_cookie_base,
>     101                               n, xa_limit_32b, &next, GFP_KERNEL);
> --> 102         if (err)
> 
> xa_alloc_cyclic() returns 1 if it succeeds after wrapping.  I don't
> know if that applies here, but I feel like this check would be better as
> "if (err < 0)".

Smatch is correct, it should be err < 0.

