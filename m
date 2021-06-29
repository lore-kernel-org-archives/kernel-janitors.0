Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7E6C11F67
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 17:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6B0561D74
	for <kernel-janitors@archiver.kernel.org>; Tue, 29 Jun 2021 17:19:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232618AbhF2RWB (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 29 Jun 2021 13:22:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59643 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232222AbhF2RV5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 29 Jun 2021 13:21:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624987169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X1wrhUM6aBKbr8jStY3jbGPmxOeBVQvKVaTR2f6NI98=;
        b=F0Fg1/TI+9OYnNGurHVNixTiqrvXIXSaRESm4mSaAQYBoLN7BFL0iULQe3L88W1kiPkdGh
        sZ1z7Qk/QCLx9A08k4V4UKynce5ekOw4n3yZpie/yX24oBHi7ff9AFXACGdx//rk++/pSG
        xV8Rk15CaENIQH+NMI/ahchx3Wx/ut4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-b4yGuvlAP96-Nca_uv-GNA-1; Tue, 29 Jun 2021 13:19:28 -0400
X-MC-Unique: b4yGuvlAP96-Nca_uv-GNA-1
Received: by mail-ed1-f71.google.com with SMTP id dy23-20020a05640231f7b0290394996f1452so11921038edb.18
        for <kernel-janitors@vger.kernel.org>; Tue, 29 Jun 2021 10:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X1wrhUM6aBKbr8jStY3jbGPmxOeBVQvKVaTR2f6NI98=;
        b=fPIpVoRM3A+BiUCQnmwVHy4Q7A1Uv4bbYja1TRdAonyuyLUZPGpr9xXmHr77g5hXCd
         MVqPs1yJ1sHZnd6NQNJs5R3azoue46g5b97XDwXYQ11kIqcv2WfV2HHsuac5rsf10PTp
         9V2oGMrRlJ3+Ip09HtBVLC+c6U5KpcL/wTILIpbQ6eEhI8kWx1apZHeTp/J8M4emt4HH
         HfnM5i77+Q8YGuCTKDxn2nZNgfxq0qsDSr/RtnqGQlyAywnI8YTjv86xYp21SXBJALWa
         LOaYE6PoSf/YYo47CcV/8WhDtlFnfegOlKO8wOldEtQjr13PPSLIQ4lm5c0aSLgD1Ny4
         hwDQ==
X-Gm-Message-State: AOAM532hDl/vHdooSDttDv1H/Zhod6bPGmpeheiYdmg8MoFD4YwM5w+y
        6voft7naxQXpHqBqs6Gw/5s06USzYuP68cUSsvoz7zViVHmHnPO6XUHuVqd1ouRxsCjj8UVmfD6
        AqODZMNW4K4WL+5Q6dTOj4A9AZdtW
X-Received: by 2002:a17:906:7184:: with SMTP id h4mr31581944ejk.140.1624987166767;
        Tue, 29 Jun 2021 10:19:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+eoZdZ3FsgZ3Q8thM2CbCsmlREY7Mr+oNSU/wMxTHo0rf6tTFPuckJ0iK6XKGziTz78SCyA==
X-Received: by 2002:a17:906:7184:: with SMTP id h4mr31581926ejk.140.1624987166531;
        Tue, 29 Jun 2021 10:19:26 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id de6sm11646982edb.77.2021.06.29.10.19.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jun 2021 10:19:26 -0700 (PDT)
Subject: Re: [PATCH][next] trace: osnoise: Fix u64 less than zero comparison
To:     Colin King <colin.king@canonical.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Ingo Molnar <mingo@redhat.com>
References: <20210629165245.42157-1-colin.king@canonical.com>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <c74e711e-71c9-df9c-8406-b9e92ef12da0@redhat.com>
Date:   Tue, 29 Jun 2021 19:19:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629165245.42157-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/29/21 6:52 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The less than zero comparison of the u64 variable 'noise' is always
> false because the variable is unsigned. Since the time_sub macro
> can potentially return an -ve vale, make the variable a s64 to
> fix the issue.

Ops! concurrent bug fixing.

Dan Carpenter reported the same bug (and another problem), and I was working in
the patches... I saw yours after sending his ones:

https://lore.kernel.org/lkml/acd7cd6e7d56b798a298c3bc8139a390b3c4ab52.1624986368.git.bristot@redhat.com/

The patches do the same fix, but there it also:

 - Made also max_noise s64 (it is snapshot of noise).
 - Arranged the declarations in the inverted christmas tree.

> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: bce29ac9ce0b ("trace: Add osnoise tracer")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Steven, can we merge the flags?

-- Daniel

> ---
>  kernel/trace/trace_osnoise.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/trace_osnoise.c b/kernel/trace/trace_osnoise.c
> index 38aa5e208ffd..02c984560ceb 100644
> --- a/kernel/trace/trace_osnoise.c
> +++ b/kernel/trace/trace_osnoise.c
> @@ -1040,11 +1040,11 @@ static void osnoise_stop_tracing(void)
>  static int run_osnoise(void)
>  {
>  	struct osnoise_variables *osn_var = this_cpu_osn_var();
> -	u64 noise = 0, sum_noise = 0, max_noise = 0;
> +	u64 sum_noise = 0, max_noise = 0;
>  	struct trace_array *tr = osnoise_trace;
>  	u64 start, sample, last_sample;
>  	u64 last_int_count, int_count;
> -	s64 total, last_total = 0;
> +	s64 noise = 0, total, last_total = 0;
>  	struct osnoise_sample s;
>  	unsigned int threshold;
>  	int hw_count = 0;
> 

