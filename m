Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD83C001DF
	for <kernel-janitors@archiver.kernel.org>; Fri, 20 Oct 2023 16:36:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377902AbjJTQge (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 20 Oct 2023 12:36:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377874AbjJTQgc (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 20 Oct 2023 12:36:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3BB2D73
        for <kernel-janitors@vger.kernel.org>; Fri, 20 Oct 2023 09:36:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A383C433C8;
        Fri, 20 Oct 2023 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1697819787;
        bh=Idv+lXk7jniUX1EPAr8yWfIxOZuMRZr+NxxGrH1RFgg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XtDvD2WdqQAnY+YSwsHXrED2stGOvLENWkLWnEjnRkuoFWtPjW9/U608u7PjGh8vv
         dHjAkf571sOQKd3QvfRimLVSWrKQxw8in3Fe4wGdLbnE3SsSwGGS0AXJ7aXYL1QUJP
         aePdqcZnV2xRS9b9k7hKJC78DKpJ9kpdHv1GHerk=
Date:   Fri, 20 Oct 2023 09:36:26 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Vishal Moola <vishal.moola@gmail.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/khugepaged: Fix a NULL vs IS_ERR() bug in
 collapse_pte_mapped_thp()
Message-Id: <20231020093626.bae70759c0f0fe5ee5159eae@linux-foundation.org>
In-Reply-To: <0882a964-770e-418c-9c34-1a64195baafc@moroto.mountain>
References: <a1f3242f-1aae-4b46-9893-36b11ee0a6dd@moroto.mountain>
        <0882a964-770e-418c-9c34-1a64195baafc@moroto.mountain>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Fri, 20 Oct 2023 17:14:36 +0300 Dan Carpenter <dan.carpenter@linaro.org> wrote:

> This was changed from find_lock_page() which returns NULL to
> filemap_lock_folio() which returns error pointers.  Update the
> error checking to match.
> 
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1508,7 +1508,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>  
>  	folio = filemap_lock_folio(vma->vm_file->f_mapping,
>  			       linear_page_index(vma, haddr));
> -	if (!folio)
> +	if (IS_ERR(folio))
>  		return SCAN_PAGE_NULL;
>  
>  	if (folio_order(folio) != HPAGE_PMD_ORDER) {

Also doesn't appear applicable to current kernels?
