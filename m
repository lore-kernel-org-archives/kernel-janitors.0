Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D772EB64D9
	for <kernel-janitors@archiver.kernel.org>; Tue, 27 Jun 2023 09:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbjF0JuC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 27 Jun 2023 05:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjF0Jto (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 27 Jun 2023 05:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA86926A3
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Jun 2023 02:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687859339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3c++9YiOTHNLa4+LTI+K9L5UCqHihkiE/iTsbyT1Cco=;
        b=JU5JqhCj9XKN4A2Gwy7jK/IGZ48IFSVLhsZk0LN60IbaDZ3dkJZveOoQecyBQeM1+dLuA2
        S+2rmtnN1E+/dp1HrZZ3bHhp/k7tuFjtDsMTsE8LPLCOwMB4ogWszvv95DMS+IX+cSqBNU
        b+QMWpgE0QlB0tpZNiUbISwCRj++LQY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-X4ih02udOleJyKdjW5DUdQ-1; Tue, 27 Jun 2023 05:48:58 -0400
X-MC-Unique: X4ih02udOleJyKdjW5DUdQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-313f3c115eeso832417f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 27 Jun 2023 02:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687859337; x=1690451337;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3c++9YiOTHNLa4+LTI+K9L5UCqHihkiE/iTsbyT1Cco=;
        b=LWtuDD4x4t+Te9oezbec09MzKqd0knDteW7pOV3Vm16E6h+/eV7LNB5855kGF0WvFE
         4DTEpJtdJBpjXQRSroN3ayaJEWPi7fyWYRzNAc9pxH0IW3BocNu5FCm4Pt+azIlUoyKL
         /gTRk2BZWDrwUpGmEsZ6wnNRFXANSnEFFtbCqnkZAtb2Y2PJdW0ZNQEdbw+CY5X/FRrD
         vFX5o0694U4IHEgyW5g1cCsQzm8A0csG+tYK/22roREbufT3WT6088zkiAxaeMgJWBAi
         C2Dl/dyLdoMz+bLRcGaEIKvd0Q2uekzB9AbkpVRnu4HVZtoJDJvpsEtM/BrcsyMQKLpl
         Luhg==
X-Gm-Message-State: AC+VfDx0qHUDif/II96O2SZhiyvsYhb4BSgql3BHMwYCZa3l9hHQ+0wh
        zv//BiNjby5bFDmp4h2A1wLWI1m//4kWiwrLCH9wLs7JYSUDwq4ct1idYfHnpRs4vRZKZExsAWW
        NQdKdnaaBmr4idBvut9wn0EiwVn2H
X-Received: by 2002:adf:f889:0:b0:2f0:583:44be with SMTP id u9-20020adff889000000b002f0058344bemr28181802wrp.0.1687859337304;
        Tue, 27 Jun 2023 02:48:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4rCZLhsCTr4FFPJrFwNmIwE36seluRYYQYVL4IvPQFKZtHxnczJk5ga4Zc2NX+rG1zlgvS5w==
X-Received: by 2002:adf:f889:0:b0:2f0:583:44be with SMTP id u9-20020adff889000000b002f0058344bemr28181789wrp.0.1687859336939;
        Tue, 27 Jun 2023 02:48:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c737:4900:68b3:e93b:e07a:558b? (p200300cbc737490068b3e93be07a558b.dip0.t-ipconnect.de. [2003:cb:c737:4900:68b3:e93b:e07a:558b])
        by smtp.gmail.com with ESMTPSA id e15-20020adfe7cf000000b0030aed4223e0sm9853784wrn.105.2023.06.27.02.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 02:48:56 -0700 (PDT)
Message-ID: <e1a0a868-ce8d-259d-4e98-6c722775355c@redhat.com>
Date:   Tue, 27 Jun 2023 11:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] mm/hugetlb: fix hugetlbfs_pagecache_present()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sidhartha Kumar <sidhartha.kumar@oracle.com>,
        linux-mm@kvack.org, kernel-janitors@vger.kernel.org
References: <efa86091-6a2c-4064-8f55-9b44e1313015@moroto.mountain>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <efa86091-6a2c-4064-8f55-9b44e1313015@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 23.06.23 08:26, Dan Carpenter wrote:
> The filemap_get_folio() function doesn't returns NULL, it returns error
> pointers.  So the "return folio != NULL;" statement means
> hugetlbfs_pagecache_present() always returns true.
> 
> Fixes: 267d6792f43b ("hugetlb: revert use of page_cache_next_miss()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   mm/hugetlb.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index cb9077b96b43..bce28cca73a1 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5731,9 +5731,10 @@ static bool hugetlbfs_pagecache_present(struct hstate *h,
>   	struct folio *folio;
>   
>   	folio = filemap_get_folio(mapping, idx);
> -	if (!IS_ERR(folio))
> -		folio_put(folio);
> -	return folio != NULL;
> +	if (IS_ERR(folio))
> +		return false;
> +	folio_put(folio);
> +	return true;
>   }
>   
>   int hugetlb_add_to_page_cache(struct folio *folio, struct address_space *mapping,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

