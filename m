Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2184C4708F
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 17:54:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7DDB613BD
	for <kernel-janitors@archiver.kernel.org>; Tue,  1 Jun 2021 17:54:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233853AbhFARz5 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 1 Jun 2021 13:55:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbhFARz5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 1 Jun 2021 13:55:57 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E735C061574
        for <kernel-janitors@vger.kernel.org>; Tue,  1 Jun 2021 10:54:14 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id s12so10776323qta.3
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jun 2021 10:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tMKpqbNk6d6N8oUHKeLkz3tOEvzwAdnxRHz9ONvgGfc=;
        b=nOQIIpB5g8S7Ni2ZemOoH6OSfRAldJbL/ZXvklCZue1Z2h8hlb54MEFfvqmkdlJ2UD
         1CqKgW2SasA2W/m4Kn7+tZnkR08rxIUgENOhiJoa+E81jqxjCCi52liiT9jqtDmCTZPc
         CRTl9RGMOux2SNX8EI7QC9cinHmkvBCx5Pq8b+G+4rsMdCgelQQ9gLZhT3WSEN4DJG15
         lxM/PkZoNHMRYi2d/ounqRsTWECdTg1cdLnQwvMiVxROE0EuzAzX16JGPDZW8Q8xBh8B
         YOsYWlAHOQTTGJKyLNmXb9sLNJHZiufVsPnPqh8opU1euL4vZcN3Ny4U0rkPDkLYLvYE
         I6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tMKpqbNk6d6N8oUHKeLkz3tOEvzwAdnxRHz9ONvgGfc=;
        b=TXHUIO0Kbh2TOeu0takF+vidxcb0KNuPHX/m3XqcsH8hbty+jLzi5fiPtYBG3Z+f9T
         nsRhjcldWMFTXpkEXHejZJyJdblaDktvslXZ11gFqI2ejo9Fvtr8TPgwgnefVPw/PsGU
         KIa2EsQW8WazppGNdxgjl3gIpAnLjQZnBDJBibyPmHcmgA2KfLn3Uy4FHrHCc5Wc9gu5
         tajFs9tQLnbECN9kbfeoM5OIRol7MMiU5LH/dfSnyAnG1OmcOI9sNA2O8IdRy/TwGmYr
         7lhnOBMGv9r0fn00dt5en3SaE+MNizgt0YLMFwb1aYX/qCPeM1K5BsMF2PnjfIlH8uEb
         5cuA==
X-Gm-Message-State: AOAM533KpixLxIqQp/5iIVg85m0Uo0rC/TSMJgbuAyrg8QLyYnumejQL
        gvhEfhPyeAXlXcVfY8U0NgcK+lUT2W9x6hYhWTU=
X-Google-Smtp-Source: ABdhPJyAiS5JPg3a3zU9lwy5adNWZpB0PB/vOAuX+Y+abvvuV6pbM+BuWTQzQkSDIskeDRckyPOBjw==
X-Received: by 2002:ac8:6791:: with SMTP id b17mr20928803qtp.5.1622570053698;
        Tue, 01 Jun 2021 10:54:13 -0700 (PDT)
Received: from fedora (cpe-68-174-153-112.nyc.res.rr.com. [68.174.153.112])
        by smtp.gmail.com with ESMTPSA id p11sm11783186qkj.3.2021.06.01.10.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 10:54:13 -0700 (PDT)
Date:   Tue, 1 Jun 2021 13:54:11 -0400
From:   Nigel Christian <nigel.l.christian@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm: hugetlb: checking for IS_ERR() instead of NULL
Message-ID: <YLZ0Q6S2A9kxXk6c@fedora>
References: <YLX9FCOU0Il8Ejoy@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YLX9FCOU0Il8Ejoy@mwanda>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Tue, Jun 01, 2021 at 12:25:40PM +0300, Dan Carpenter wrote:
> The alloc_migrate_huge_page() doesn't return error pointers, it returns
> NULL.

Hi Dan,

I'm trying to start using smatch. Is this in the warns report?
Wasn't able to find using smatch_scripts/kchecker mm/hugetlb.c (T_T)

> 
> Fixes: ab45bc8b5910 ("mm, hugetlb: fix resv_huge_pages underflow on UFFDIO_COPY")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  mm/hugetlb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 69a4b551c157..3221c94b4749 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5103,7 +5103,7 @@ int hugetlb_mcopy_atomic_pte(struct mm_struct *dst_mm,
>  			 */
>  			page = alloc_migrate_huge_page(h, gfp_mask, node,
>  						       nodemask);
> -			if (IS_ERR(page)) {
> +			if (!page) {
>  				ret = -ENOMEM;
>  				goto out;
>  			}
> -- 
> 2.30.2
> 
