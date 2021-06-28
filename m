Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE50C2B9F4
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 13:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E378619B5
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 13:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbhF1NRI (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Jun 2021 09:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27012 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232502AbhF1NRG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Jun 2021 09:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624886080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tj4yIuEO+4XJm3fqX2pyrrx0se0LVYWofQJUdNNt4QE=;
        b=XldSc9GenFUv57dUqyGt4L+EHvyNVGBnVlS+TKnHTBDk+2oabylYROEH2klo3ofhAPoszw
        +IuiZhQW5z4LproCGAVCo4x81cR7tHHGQb858pr71h38DKaty6laO8Y1iXQOim3oXuFaD5
        /H0MjOLn9Uwg43uE5NlpVbkmoIt2zmk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-IKcrgoGYOHiRQZiCrUmBVA-1; Mon, 28 Jun 2021 09:14:38 -0400
X-MC-Unique: IKcrgoGYOHiRQZiCrUmBVA-1
Received: by mail-ed1-f69.google.com with SMTP id y18-20020a0564022712b029038ffac1995eso9530538edd.12
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Jun 2021 06:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tj4yIuEO+4XJm3fqX2pyrrx0se0LVYWofQJUdNNt4QE=;
        b=DFRBn4LiS6N6rlWkaHXpBeMtzE9JFvc9HENpbWQO5jbYDpaAklzYesw9oOhBFTxKGf
         IgdK2ftZKvufRSgiwnk4IvCjiBqAmsRaYBIk1ysh1w0muLkdyQmuhzl6b07vs3GNcsvz
         qHCD3bTU7qU1FgwcejaEywYDWe24OFud7ED9DxGmrC5604JEsm+3ZzfX4lGaBtc1U4Sl
         yDT+BEWEKn8JXNxk7mZ2vDT4zV51jDwbU3Y8BfTJkOmn0GN7o0I4Tc3ijsTfBnlXtdPK
         jqu0tIJMZDIBKxWDE7r2KrP7IthcEAry9X9x2hGIvtrUIUMI4W2SGQcs57jOGvkSduF7
         ObRg==
X-Gm-Message-State: AOAM531pP2ka1zIWpkVTYIL6T5XkrzjoUYcW5/lZFqqmFOwwXDmHO4Fz
        ZA/ESOoUhmJmeYji5c0OLyTTAKL0bp1HdkC6D6LfsJizxTd6JDBtgmk3cyb5aFfHs/9Wnq4Ltat
        z/8kqtzikC/wegWtJaw1yN3TU7H6f
X-Received: by 2002:a05:6402:10cc:: with SMTP id p12mr33280666edu.328.1624886077860;
        Mon, 28 Jun 2021 06:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyF01N+mW2cB7afBbWaAEtEf7kv/6l59hADkoTivbHSP6UGj2lBnUkg1OAZn1evp9XZFa+5gQ==
X-Received: by 2002:a05:6402:10cc:: with SMTP id p12mr33280651edu.328.1624886077748;
        Mon, 28 Jun 2021 06:14:37 -0700 (PDT)
Received: from x1.bristot.me (host-79-23-205-114.retail.telecomitalia.it. [79.23.205.114])
        by smtp.gmail.com with ESMTPSA id s18sm6859659ejh.12.2021.06.28.06.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 06:14:37 -0700 (PDT)
Subject: Re: [PATCH][next] trace: Fix spelling in osnoise tracer
 "interferences" -> "interference"
To:     Colin King <colin.king@canonical.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210628125522.56361-1-colin.king@canonical.com>
From:   Daniel Bristot de Oliveira <bristot@redhat.com>
Message-ID: <e53ec856-c93d-61fe-ec2f-6c73b3b6efc9@redhat.com>
Date:   Mon, 28 Jun 2021 15:14:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628125522.56361-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 6/28/21 2:55 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a TP_printk message, the word interferences
> is not the plural of interference. Fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Daniel Bristot de Oliveira <bristot@redhat.com>

Thanks!
-- Daniel

> ---
>  include/trace/events/osnoise.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/trace/events/osnoise.h b/include/trace/events/osnoise.h
> index 28762c69f6c9..82f741ec0f57 100644
> --- a/include/trace/events/osnoise.h
> +++ b/include/trace/events/osnoise.h
> @@ -129,7 +129,7 @@ TRACE_EVENT(sample_threshold,
>  		__entry->interference = interference;
>  	),
>  
> -	TP_printk("start %llu.%09u duration %llu ns interferences %llu",
> +	TP_printk("start %llu.%09u duration %llu ns interference %llu",
>  		__print_ns_to_secs(__entry->start),
>  		__print_ns_without_secs(__entry->start),
>  		__entry->duration,
> 

