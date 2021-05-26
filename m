Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B252DC47088
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 16:49:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 917866113D
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 16:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbhEZQvL (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 12:51:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhEZQvJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 12:51:09 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBD8C061574
        for <kernel-janitors@vger.kernel.org>; Wed, 26 May 2021 09:49:37 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id j184so1641710qkd.6
        for <kernel-janitors@vger.kernel.org>; Wed, 26 May 2021 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C+1GNfV1+wpE6FJNpUedBO+JQbCvS5qLbCtmsgVd4dM=;
        b=EDhzTJ5PmnLhjw6osyX4ttpz30oEIlfRO7d3u6PcYUemIcz6UCFFzp3RKbXcij1Wzi
         2d8Oc3zOVEhMZhcfu8hnUShBsh3sxbl0EKkbuRPPbKs2pG+BWjDLisUNMQ6W/Ts/cDed
         SG/pcN016zS0iBksnGHZMZ4HloTZG6BwUQUpxL2xA0WKfbh+m0fPXzP6t5noeye+Cmuw
         2hm/orXeB0fOx6twPm2DnQyhVnsCEE0S9cRtrRSv+ZNTMY4l+m5sgxpiZrhetkFKeYGB
         1q9WcHJWgXFwNh4g70I08kq92mPyetXOcmUPNvwC5cMPuKxgRYvTgOVv/hSPTUZ97k00
         WK9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C+1GNfV1+wpE6FJNpUedBO+JQbCvS5qLbCtmsgVd4dM=;
        b=f6/lywTgg0k5zSR3sb6kfPq2jH9AKfW3/hYuMg4zfeF+FvQrxHOrCdh90zOUXtAlwc
         qumBrGUgxHYxUkAJp7wQDZNlZngy7HVfliDBiuFA0M570xx3jXV3mcOINvln/4kKzmHC
         wYi0+O2dIAZR6ggPI7JbLN7rm/TgnXaq5m6xU8v1w+beMvbNF/qtXNFT0aPMValkEdH/
         AQ9FC1vME89qsUWH8fbFdRLYfqdiXZL0y9wWxOF77nEW9XCeDFVVe1r9xGhRYIWQV7P+
         vWb4IUix2kBY60tLU4ZBqj9vVsn0RYjtXNQy7bODpExCrqVz2soiQIrNwyMZvvfFsrwT
         t/Fg==
X-Gm-Message-State: AOAM533cCBM0V+pwUq9qXC2HxNusuYmw5r5ol4Ykk7+IBmkXQe94+AzU
        YTzkGbeoEJgOO7VwVQGVjz9ntA==
X-Google-Smtp-Source: ABdhPJy3JhTUaYioJDxIsNhfjw5ZVnKtNIvVYD9hwieO3TzuuAH5M4nce2RL8cr4SoIlIvIicyE0Dw==
X-Received: by 2002:ae9:e41a:: with SMTP id q26mr42764502qkc.78.1622047776397;
        Wed, 26 May 2021 09:49:36 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id d11sm1912764qkj.24.2021.05.26.09.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 09:49:35 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1llwis-00FEKy-GU; Wed, 26 May 2021 13:49:34 -0300
Date:   Wed, 26 May 2021 13:49:34 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Alistair Popple <apopple@nvidia.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mm: selftests: fix potential integer overflow on
 shift of a int
Message-ID: <20210526164934.GD1096940@ziepe.ca>
References: <20210526150947.3751728-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526150947.3751728-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 26, 2021 at 04:09:47PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The left shift of the int mapped is evaluated using 32 bit arithmetic
> and then assigned to an unsigned long. In the case where mapped is
> 0x80000 when PAGE_SHIFT is 12 will lead to the upper bits being
> sign extended in the unsigned long. Larger values can lead to an
> int overflow. Avoid this by casting mapped to unsigned long before
> shifting.
> 
> Addresses-Coverity: ("Uninitentional integer overflow")
> Fixes: 8b2a105c3794 ("mm: selftests for exclusive device memory")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>  lib/test_hmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 74d69f87691e..b54657701b3a 100644
> +++ b/lib/test_hmm.c
> @@ -749,7 +749,7 @@ static int dmirror_exclusive(struct dmirror *dmirror,
>  			}
>  		}
>  
> -		if (addr + (mapped << PAGE_SHIFT) < next) {
> +		if (addr + ((unsigned int)mapped << PAGE_SHIFT) < next) {

Just fix the type for mapped. It started out as an unsigned long in
dmirror_atomic_map() and wrongly became an int here

Jason
