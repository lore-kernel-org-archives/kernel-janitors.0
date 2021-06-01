Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A93C47080
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 10:52:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5863D613BD
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 10:52:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbhFAKyd (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 06:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbhFAKyc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 06:54:32 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74705C06174A
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Jun 2021 03:52:50 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 6so10381919pgk.5
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jun 2021 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gCRowJKEF6abtOyiSLRhg1Y3idIlIdXjyYVD3tmG9YY=;
        b=kQ06QptlyaouHmPEZoKAx6vMrnJfCWjKQgzgmVeiLtojUjNkX+/CCe7yJbhmpWhet6
         JSk4MB/c5YOt+3BLXcIy9HLf0+I3TjnIapaLK3tmJXxYUiHdLDCq3JhQ/2vMx2I4PYpg
         qBxz0/9Op8rZ2gREcRC+jL1HXkac8zWL7mer5VuI6LmU0uNv8BIvffW28fvMDM5oauom
         KYRghkfi/SGT53URu8216lBfFK0/jlmWvJfdGwirPO4hEWgWLRxZzxbd5AOXcJ8OF7LX
         o6iXo0THhRAyc5FPhv3BwPTKTaCyyTgbWiRxcLhynqAzUhq03ke2unKFRvuzRwSc2hRl
         dZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gCRowJKEF6abtOyiSLRhg1Y3idIlIdXjyYVD3tmG9YY=;
        b=qTnXt4DfTiEOkMpyNzfPMt1GGt+EsoHP7WkTKbecqCowr8AbR/P40mP2TVzM5OOwAa
         UmLYf6aWEX/mhcCalVLt9yEx/MEeEfmqqf24VOXUS/8eVuaNUfb8RQXXrVq9IB7soZKz
         IMQuBw5siH3nG0cpRfdHe68RclEDHaP0wTRq+KWJ/3BvB211Uzd+tuThkEA1gvhFZMGY
         tYp0f2P/chA379go+ReKrHmAvznBkfkuTvA807QzJHQ1z3xFgS5GEavBm6WvVm8fGDCF
         nRWGbmln370JpcGuu52U942+3YZe3tot06yq9ISlJDLrZSKpHuU3EWE28TzjlM5r6Zf3
         tRHA==
X-Gm-Message-State: AOAM531T7p5jbFcncXDdbRlAXYL78LNWBbnz54g2dvDl9qaqVZJIrqMi
        VnUJiD1WmbrhapZX1tZ0sr142hIkrzNzGpp2aqVO7A==
X-Google-Smtp-Source: ABdhPJyY3Og9DuDfi3jlT2rFT/1OIbsdz5p57E5ro/YoqnayLxkjkO+KqnCp9w6rmNR0cRd+mbEfe4iFfC3fOgwxh/c=
X-Received: by 2002:a05:6a00:c86:b029:2e9:3041:162f with SMTP id
 a6-20020a056a000c86b02902e93041162fmr21353488pfv.78.1622544769781; Tue, 01
 Jun 2021 03:52:49 -0700 (PDT)
MIME-Version: 1.0
References: <YLX9FCOU0Il8Ejoy@mwanda>
In-Reply-To: <YLX9FCOU0Il8Ejoy@mwanda>
From:   Mina Almasry <almasrymina@google.com>
Date:   Tue, 1 Jun 2021 03:52:38 -0700
Message-ID: <CAHS8izMrnLPD1_J5wPPREZixX6WaOtb6qjMZ_nYNjzYo5Zw3_g@mail.gmail.com>
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-MM <linux-mm@kvack.org>,
        open list <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 1, 2021 at 2:26 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The alloc_migrate_huge_page() doesn't return error pointers, it returns
> NULL.
>
> Fixes: ab45bc8b5910 ("mm, hugetlb: fix resv_huge_pages underflow on UFFDIO_COPY")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  mm/hugetlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Gah, my bad.

Reviewed-by: Mina Almasry <almasrymina@google.com>

> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 69a4b551c157..3221c94b4749 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5103,7 +5103,7 @@ int hugetlb_mcopy_atomic_pte(struct mm_struct *dst_mm,
>                          */
>                         page = alloc_migrate_huge_page(h, gfp_mask, node,
>                                                        nodemask);
> -                       if (IS_ERR(page)) {
> +                       if (!page) {
>                                 ret = -ENOMEM;
>                                 goto out;
>                         }
> --
> 2.30.2
>
