Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BC0C001B0
	for <kernel-janitors@archiver.kernel.org>; Wed, 12 Jul 2023 19:11:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbjGLTLj (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 12 Jul 2023 15:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbjGLTLh (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 12 Jul 2023 15:11:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84DF91FC1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689189051;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q45SoRMuLgunlP8L7mZ4yYklFc9J8ZjnlV0HAlFrluA=;
        b=FvtSAKP/W0rluk3vy56TimDf2Qni7XOh5q48UldEydX5Cf/BmsggFGMCY94SDKEUgy7A9+
        CGZPlRXNPT2KZhG5Euz9vPA7VWt9c2uq/A+V+nvmyfw2pZGUEPok7CsHfAvPFm7ZXhgsFQ
        It1bsnMe8emNIf1fKPi3N26ENukUBPg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-q1-FsmTKPCmEw93BxwKA-A-1; Wed, 12 Jul 2023 15:10:50 -0400
X-MC-Unique: q1-FsmTKPCmEw93BxwKA-A-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f5df65fa35so45605655e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Jul 2023 12:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689189049; x=1691781049;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q45SoRMuLgunlP8L7mZ4yYklFc9J8ZjnlV0HAlFrluA=;
        b=dbGRWR9bKp3k9kVFuXevIUaWb1W7kMunOXwYCdhl9gu/ksRydZHQDwKRCZI3/IWxpk
         c9vvlvMPn+jBFd4/GVinxzOT3G5hNZdHzCDr5e943PPOicLvM7nD1JSZkPrGKCEZTNpp
         XzQRDOx6Sq3BT2+GFwSnfexEyR9DgYdbP+to4VKE4ba1vyKDKyRXix7wT8CBbzvcIFzM
         KWsAoZhSRR0O1TosscYIb3W3eDPKHKrPrDn3vtpvRDX3UZc4si9DnMwFHOtkjaT7wZSC
         DUG0nwTj8eINP9iN0/2Lcwm8hSnqFO4EhfYT1gJNll5KxcugZ8cZ/1IXjvZL4b+drl/o
         u0wg==
X-Gm-Message-State: ABy/qLZH1q4lj2G11cPDMBJ9LdV3SyvxxL5sPKiOwg6C0i31cnUL7MYm
        23KPxgXhXHbgHcf8s0VOjZqpGsS8Sw1KlqygPMEg5t6krxEWY5zfwo05JOC44FchQ1jg4TIfDHa
        ld63rrEr8kdbKXYW2TW3yPaVE/+rg
X-Received: by 2002:a7b:c019:0:b0:3fb:a62d:1992 with SMTP id c25-20020a7bc019000000b003fba62d1992mr16262194wmb.0.1689189049322;
        Wed, 12 Jul 2023 12:10:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG7+RfJW8rL+kAwaM2CugjDDuPQVV8Tbi86e3qb2YFzqDwqbvHOu/X6/+h7PYfnyGjOw9KBjA==
X-Received: by 2002:a7b:c019:0:b0:3fb:a62d:1992 with SMTP id c25-20020a7bc019000000b003fba62d1992mr16262181wmb.0.1689189048992;
        Wed, 12 Jul 2023 12:10:48 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3700:3eea:ace6:5bde:4478? (p200300cbc70737003eeaace65bde4478.dip0.t-ipconnect.de. [2003:cb:c707:3700:3eea:ace6:5bde:4478])
        by smtp.gmail.com with ESMTPSA id o29-20020a05600c511d00b003fa9a00d74csm409177wms.3.2023.07.12.12.10.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 12:10:48 -0700 (PDT)
Message-ID: <60f2ef09-53b2-6bf8-9cd0-3b639ac7b765@redhat.com>
Date:   Wed, 12 Jul 2023 21:10:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH][next] selftests/mm: mkdirty: Fix incorrect position of
 #endif
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230712134648.456349-1-colin.i.king@gmail.com>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230712134648.456349-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12.07.23 15:46, Colin Ian King wrote:
> The #endif is the wrong side of a } causing a build failure when
> __NR_userfaultfd is not defined. Fix this by moving the #end to
> enclose the }
> 
> Fixes: 9eac40fc0cc7 ("selftests/mm: mkdirty: test behavior of (pte|pmd)_mkdirty on VMAs without write permissions")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/testing/selftests/mm/mkdirty.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/mkdirty.c b/tools/testing/selftests/mm/mkdirty.c
> index 6d71d972997b..301abb99e027 100644
> --- a/tools/testing/selftests/mm/mkdirty.c
> +++ b/tools/testing/selftests/mm/mkdirty.c
> @@ -321,8 +321,8 @@ static void test_uffdio_copy(void)
>   munmap:
>   	munmap(dst, pagesize);
>   	free(src);
> -#endif /* __NR_userfaultfd */
>   }
> +#endif /* __NR_userfaultfd */
>   
>   int main(void)
>   {

Ouch, thanks!

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

