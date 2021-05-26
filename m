Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B031EC47088
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 19:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D5E361248
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 May 2021 19:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233595AbhEZTXG (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 May 2021 15:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232452AbhEZTXC (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 May 2021 15:23:02 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2FBC061756
        for <kernel-janitors@vger.kernel.org>; Wed, 26 May 2021 12:21:26 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id c15so1745834qte.6
        for <kernel-janitors@vger.kernel.org>; Wed, 26 May 2021 12:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wI7tCNlcaTZmqH6g95a10WXByiu3PTAxzCVAG5uZNco=;
        b=SM3f/vu2XiZrKAcI7L4W7BwbiSvj1ehZ0sxFk5BfEzmHNgjVe7BHFB9U6lkCE01h52
         kWEj+xQnqO7fceVIc2CwmBHvDYJ536FMFmcdKNZhH/szoBmrBsS6sLB5dhe67VtEQKbn
         ST0HkTO80trrnBilylR/5H7rQWiV/D4neNsVX08dKvlmnSM5n9ILkC1OsbKyJEHy+nt0
         Iju4cArPuwH2Jn/2vznanYAbqSchzzPwXeQPyRid9E4ckMXp8xMY/WUBaWy2kEBavbX6
         kOhCdvm98E6NzV8ZdCN2VpIvQ+jeilVyKIm5X4kZ0xl87sngJOcVnbb6bzVSPNz0rwj1
         hSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wI7tCNlcaTZmqH6g95a10WXByiu3PTAxzCVAG5uZNco=;
        b=OK8QFCRufV6Ne4WSbHhnzk6wugKdNt2iHV4ak0iBQTObWwY94jM2AhG0VfQvx9hTAj
         MdiD1WovoMlBGDq32XW3ZDtty0O1FF+h0E1QQgjCo/ZNJxDxmXGybrCwySW7kuF2vlu/
         lN/m9vYnt9r2jpHktfeTdXKaqRNlCh64omnaLGFPrOLE6H5ecwTnVFPtX0Z80x6n5K9v
         l4X/5DGFKeEEjQpWIrZAuSRCx0D/sg2JXwMtYO4f+x2c9N/yi+U5TBnJplL4KDlHrWvZ
         +fCxIt8AtTnebIpv0w7HRS4rOd44xT7/d4dwWOx+bL5HTGNLB9IFs4xqY/K+XBX0cUlk
         tJZg==
X-Gm-Message-State: AOAM533K0q+LDuwNIFa1VXB3uxEQ1k8cyQ/mxmXc5+OYZGxfdK3ZtSCK
        3NZrMLMme+S6o0Tu0ICDQfhphw==
X-Google-Smtp-Source: ABdhPJx3twK2Z0UVhtntwGDvGoua/9nmaJnAFQUJsqgCit0fyMZoTch2+UM/cuyHcYXCcGgh630hfw==
X-Received: by 2002:ac8:4a0a:: with SMTP id x10mr17715979qtq.201.1622056885353;
        Wed, 26 May 2021 12:21:25 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id 127sm2172724qkl.116.2021.05.26.12.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 12:21:24 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1llz5n-00FI2b-Re; Wed, 26 May 2021 16:21:23 -0300
Date:   Wed, 26 May 2021 16:21:23 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Colin King <colin.king@canonical.com>
Cc:     =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][V2][next] mm: selftests: fix potential integer overflow
 on shift of a int
Message-ID: <20210526192123.GE1096940@ziepe.ca>
References: <20210526170530.3766167-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526170530.3766167-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Wed, May 26, 2021 at 06:05:30PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The left shift of the int mapped is evaluated using 32 bit arithmetic
> and then assigned to an unsigned long. In the case where mapped is
> 0x80000 when PAGE_SHIFT is 12 will lead to the upper bits being
> sign extended in the unsigned long. Larger values can lead to an
> int overflow. Avoid this by making mapped an unsigned long.
> 
> Addresses-Coverity: ("Uninitentional integer overflow")
> Fixes: 8b2a105c3794 ("mm: selftests for exclusive device memory")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: Make mapped an unsigned long rather than casting it to unsigned long

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
