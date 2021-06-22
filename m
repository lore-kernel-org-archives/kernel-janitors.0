Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 024C2C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 20:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DA8DB61027
	for <kernel-janitors@archiver.kernel.org>; Tue, 22 Jun 2021 20:04:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232277AbhFVUHK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 22 Jun 2021 16:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36281 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232236AbhFVUHK (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 22 Jun 2021 16:07:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624392293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=t//12EkE3p9xiFhM+ud5nQO8P8IYV8TooPn5f0ckEg4=;
        b=MHlgo/U+y8MxXl2t5QXFpIb4CFqSRwaFPVH0qiDhPgedXr3dCCY+LHC224t1EqqIvkv9a3
        xJ735IHeIy4A4K5dLlFI3oJHqXJDZnaYrxAmCEDd+NcrCcKaYSQ64zyR2XNx4m24W0XrpD
        FoNRcvgobnZkM9tw9YzK+WWzdk31UAU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-anSdbloJP9ubxCSKcWEm6g-1; Tue, 22 Jun 2021 16:04:52 -0400
X-MC-Unique: anSdbloJP9ubxCSKcWEm6g-1
Received: by mail-qv1-f72.google.com with SMTP id cu3-20020a05621417c3b0290272a51302bdso269802qvb.20
        for <kernel-janitors@vger.kernel.org>; Tue, 22 Jun 2021 13:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t//12EkE3p9xiFhM+ud5nQO8P8IYV8TooPn5f0ckEg4=;
        b=X1KuawuGgzZdHKYpiQmasr825nHbiV54dekwISPTXHFdx2ugt3QNRQVUyHKQT1IVYk
         m5DAKlQE4nfUC2J/sRCy+zLwSmoN/r8cKka8+16yoaLv5PmA6xW6BImXNEduBXJv+D4T
         5mOFhrahnN/euRKHCLLKnl371YFDn6LlveB+BGEl8LkX/6Bud5XPYmGZIco20dXACq65
         11VXwbvZegIdaXsFvZuKH5l132e3D3pVMdJ9K7iOWqyWY0cnWxwoZzAwXlbKMKAUNO8G
         /jnEuVYxoTLkpDXUAK8rGX28T/1TRGhkiOBL5pALGMB8PJuJnvL02vVbUz8D5Lge0Tdl
         oFYw==
X-Gm-Message-State: AOAM530/10abSEguYnFlYiT+pDEv3aN4p79gXjYT1zRrEQY6hv51oCHQ
        qfYvmv2cLp5Hvuo7Hqx0hptXj8zzaGsu7Gh42q7QsNNyGgyrMQM35YKRCEa4VS8Ub17Hi/caOvm
        r0Bwy/JIYF+z4r44KuwFwWOcsL13c
X-Received: by 2002:a05:622a:1701:: with SMTP id h1mr510290qtk.36.1624392291943;
        Tue, 22 Jun 2021 13:04:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxT8MDYD6s0TuLkbco4tP6pDikcdfgljaa/ExfUeY4l2jTjYthsc/h+B1687QdwWDTF4HSvMA==
X-Received: by 2002:a05:622a:1701:: with SMTP id h1mr510273qtk.36.1624392291690;
        Tue, 22 Jun 2021 13:04:51 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
        by smtp.gmail.com with ESMTPSA id i67sm13904118qkd.90.2021.06.22.13.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 13:04:51 -0700 (PDT)
Date:   Tue, 22 Jun 2021 16:04:49 -0400
From:   Peter Xu <peterx@redhat.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alistair Popple <apopple@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm/rmap: fix signedness bug in
 make_device_exclusive_range()
Message-ID: <YNJCYf/VS4Nfm9j6@t490s>
References: <YNIz5NVnZ5GiZ3u1@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YNIz5NVnZ5GiZ3u1@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 22, 2021 at 10:03:00PM +0300, Dan Carpenter wrote:
> The get_user_pages_remote() function returns a long type, but we are
> using "unsigned long i;" as the list iterator.  If "npages" is -ENOMEM,
> the comparison "i < npages" is type promoted and "npages" becomes a very
> high positive value.  The loop will then iterate until the kernel
> crashes.
> 
> There are two ways to fix this.  Declare "i" as a long type or add an
> explicit check for get_user_pages_remote() error returns.  Either
> approach will work so let's do both.
> 
> Fixes: fa1e686e5f53 ("mm: device exclusive memory access")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  mm/rmap.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/rmap.c b/mm/rmap.c
> index e5210dde0c4d..fb5c59b95826 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2187,11 +2187,14 @@ int make_device_exclusive_range(struct mm_struct *mm, unsigned long start,
>  				void *owner)
>  {
>  	long npages = (end - start) >> PAGE_SHIFT;
> -	unsigned long i;
> +	long i;
>  
>  	npages = get_user_pages_remote(mm, start, npages,
>  				       FOLL_GET | FOLL_WRITE | FOLL_SPLIT_PMD,
>  				       pages, NULL, NULL);
> +	if (npages < 0)
> +		return npages;
> +
>  	for (i = 0; i < npages; i++, start += PAGE_SIZE) {
>  		if (!trylock_page(pages[i])) {
>  			put_page(pages[i]);
> -- 
> 2.30.2

Ouch.. The check should be enough, imho; looping over an long seems a tiny
little bit odd, but still looks okay.

Reviewed-by: Peter Xu <peterx@redhat.com>

Thanks,

-- 
Peter Xu

