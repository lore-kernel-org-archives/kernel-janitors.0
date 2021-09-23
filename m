Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7364C433FE
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Sep 2021 16:25:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B109160EB2
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Sep 2021 16:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242031AbhIWQ11 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 23 Sep 2021 12:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52816 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242117AbhIWQ1Y (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 23 Sep 2021 12:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632414352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b8Ah2Qh7p6T0mn87VL57RtyibfllbNYrDwoM7m+3Joo=;
        b=KFrRnH5HWwCMv+MSKwMzhV3x78WEgbsKM6aQl29737vFHrNcTHPUb6e3/qcMRFOcf6kZq8
        SPt4p79KTeEQzl0tdKsQUoREHDr+G4TDOC4uxIpEjHdB4HI2vuTcbSLkCBi+1p7s8pGv1b
        pX4wDRC7t0at1cJSiwNdP+VgwnlwAaw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-4bRc_b4yOZWZRVzVlh0C6A-1; Thu, 23 Sep 2021 12:25:50 -0400
X-MC-Unique: 4bRc_b4yOZWZRVzVlh0C6A-1
Received: by mail-ej1-f72.google.com with SMTP id lu33-20020a170906fae100b00611e751f9f6so86569ejb.2
        for <kernel-janitors@vger.kernel.org>; Thu, 23 Sep 2021 09:25:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b8Ah2Qh7p6T0mn87VL57RtyibfllbNYrDwoM7m+3Joo=;
        b=e96SFmmxmTv1CDqbHQNw67JjRSU+7ANn1XPdUriK6UzAtOx1cCuBiQmX7YAcM5fvrE
         tJ8KGPmaVlXCnCl2QX6I9bGWiaTe10h723CpXNeDbURjoTaJi0AFb/htaaVk+dgazbBm
         yp/UeAfPzEVuD9hAIeM3hYx4Se2JRbkV1PRW7a6SrxAFddNOgYmqXofmMckWL/b5hLC4
         EW1HSMyYdniQu2PwRn3ERj8Sbo3pWAl1+JvPjgdN14/5Kdo0IlCWv3tMpM4ikm05L0TY
         RYr6AgxW47xh5F13f+Fd1AyQgdwcLtAv7yMjLeW4UjrmQhfA5M7FeDWAd/m15bMGI75M
         AlGA==
X-Gm-Message-State: AOAM532l2x+RZESxsc6rT3ir/GpeBnyFLkWC/D07vjxbZKFmAmxenwdd
        5YLEBSoE1TvTsPuB+yOnF/ztUqEGdjnmAxsHm2aDGW4G8EwLv5ZXGHCwhaTGzYKXYhX8fG0qw8N
        GBAXjKm5xAFQ0D1NnKswozU6akjk5
X-Received: by 2002:aa7:da93:: with SMTP id q19mr6706452eds.206.1632414349554;
        Thu, 23 Sep 2021 09:25:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9XnSwLPcjGBamhpDTdT3EiRg8QNymAoajRgXO8jyqO9O2UVhfynrBSpJ2DkEt/MKXS42ECQ==
X-Received: by 2002:aa7:da93:: with SMTP id q19mr6706421eds.206.1632414349350;
        Thu, 23 Sep 2021 09:25:49 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id gl2sm3237224ejb.110.2021.09.23.09.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 09:25:48 -0700 (PDT)
Subject: Re: [PATCH] kvm: selftests: Fix spelling mistake "missmatch" ->
 "mismatch"
To:     Colin King <colin.king@canonical.com>,
        Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210826120752.12633-1-colin.king@canonical.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <02094ffc-11c4-8b72-f889-a0654f95d2bb@redhat.com>
Date:   Thu, 23 Sep 2021 18:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210826120752.12633-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 26/08/21 14:07, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in an error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   tools/testing/selftests/kvm/lib/sparsebit.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
> index a0d0c83d83de..50e0cf41a7dd 100644
> --- a/tools/testing/selftests/kvm/lib/sparsebit.c
> +++ b/tools/testing/selftests/kvm/lib/sparsebit.c
> @@ -1866,7 +1866,7 @@ void sparsebit_validate_internal(struct sparsebit *s)
>   		 * of total bits set.
>   		 */
>   		if (s->num_set != total_bits_set) {
> -			fprintf(stderr, "Number of bits set missmatch,\n"
> +			fprintf(stderr, "Number of bits set mismatch,\n"
>   				"  s->num_set: 0x%lx total_bits_set: 0x%lx",
>   				s->num_set, total_bits_set);
>   
> 


Queued, thanks.

Paolo

