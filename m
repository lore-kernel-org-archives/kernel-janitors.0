Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D2BC47088
	for <kernel-janitors@archiver.kernel.org>; Fri,  2 Dec 2022 18:25:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbiLBSZW (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 2 Dec 2022 13:25:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234382AbiLBSZQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 2 Dec 2022 13:25:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A102C511C
        for <kernel-janitors@vger.kernel.org>; Fri,  2 Dec 2022 10:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670005454;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T5BTufQpndp/9gXIDoDcOexJN+Na84y6kRix0xZynyE=;
        b=Iyc18EbOYEKd/WevSj0eu7mlzUUXq0osHHFg77XMu2ajMuw5VVyPw3CpuyzipKUexIqfWe
        Xy7XmRlCj3m0jxfzZRhstJUfesIR91edzIgvdSCXVHu7fXpjO1QAvWKIP2Y1CgfSs3wby5
        mPnB4H8SpZ8A1DwtelhEQYZ662T25Fs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-398-UkMmFYqkO6aL9IYUZAmCxA-1; Fri, 02 Dec 2022 13:24:12 -0500
X-MC-Unique: UkMmFYqkO6aL9IYUZAmCxA-1
Received: by mail-wm1-f70.google.com with SMTP id ay40-20020a05600c1e2800b003cf8aa16377so2865116wmb.7
        for <kernel-janitors@vger.kernel.org>; Fri, 02 Dec 2022 10:24:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5BTufQpndp/9gXIDoDcOexJN+Na84y6kRix0xZynyE=;
        b=IHvijenXj8VMt/Km40FfXNyggmSODwgnkLcK2jCn/Zu909JqRwsxO2wEl3iyZlgKO2
         43lIhQn+C22JwOKa9NLvWcZ8wURPWiA4O5tF9ALvlyv9WuDaMfjKy8V2sa/JXOS3L7MF
         thVrX3Sf8p822rHYxF7lJ5geTD/EBK2EVL0bG3imDKXkvuxadL8FsyL/iyLKp5mqsWH+
         eV/NigfepHce+V6xD4gPj0aMs1ubT+lhYiRPOkUUPmSbojgLhIdFoYFfgMDS/OfVFcq2
         ixFEDvpy7aOQmsWAN3WaEpRsTdvPpU3ZBJq121UK58RWxEhnQaDissEvUYRivmPzDXjg
         AO4Q==
X-Gm-Message-State: ANoB5pmrPKEu1KCzu8OerWACfKTSx5jutOHJsi86c6njajizZYamICzp
        fUn9tXlaVdN4se/yL27xiDYPi22umsdaLSZALbtg8DIMnZ36dUfom39Hcaezrcoxa3R01MP9imF
        PmTpcywdGZQMd59XLBTt/ESsV9uga
X-Received: by 2002:a05:600c:3d8b:b0:3d0:545:a0 with SMTP id bi11-20020a05600c3d8b00b003d0054500a0mr41074871wmb.123.1670005451145;
        Fri, 02 Dec 2022 10:24:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf79r6iGZnLxiQq0xFSEHBCA0qq6guXmdR+rJp0CazGPyxvYLlK7pomrpAN5b8b1jQb4w14YVQ==
X-Received: by 2002:a05:600c:3d8b:b0:3d0:545:a0 with SMTP id bi11-20020a05600c3d8b00b003d0054500a0mr41074863wmb.123.1670005450938;
        Fri, 02 Dec 2022 10:24:10 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id bs4-20020a056000070400b0023677081f3asm7649064wrb.42.2022.12.02.10.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 10:24:10 -0800 (PST)
Message-ID: <809a6a89-1046-cd38-60ab-6c4c60045b4f@redhat.com>
Date:   Fri, 2 Dec 2022 19:24:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH][next] KVM: selftests: Fix spelling mistake
 "probabalistic" -> "probabilistic"
Content-Language: en-US
To:     Colin Ian King <colin.i.king@gmail.com>,
        Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221201091354.1613652-1-colin.i.king@gmail.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221201091354.1613652-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 12/1/22 10:13, Colin Ian King wrote:
> There is a spelling mistake in some help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   tools/testing/selftests/kvm/dirty_log_perf_test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/dirty_log_perf_test.c b/tools/testing/selftests/kvm/dirty_log_perf_test.c
> index c33e89012ae6..e9d6d1aecf89 100644
> --- a/tools/testing/selftests/kvm/dirty_log_perf_test.c
> +++ b/tools/testing/selftests/kvm/dirty_log_perf_test.c
> @@ -398,7 +398,7 @@ static void help(char *name)
>   	printf(" -x: Split the memory region into this number of memslots.\n"
>   	       "     (default: 1)\n");
>   	printf(" -w: specify the percentage of pages which should be written to\n"
> -	       "     as an integer from 0-100 inclusive. This is probabalistic,\n"
> +	       "     as an integer from 0-100 inclusive. This is probabilistic,\n"
>   	       "     so -w X means each page has an X%% chance of writing\n"
>   	       "     and a (100-X)%% chance of reading.\n"
>   	       "     (default: 100 i.e. all pages are written to.)\n");

Queued, thanks.

Paolo

