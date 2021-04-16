Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D223CC433B4
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 07:34:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97AA361166
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Apr 2021 07:34:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhDPHem (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Apr 2021 03:34:42 -0400
Received: from mail-qv1-f42.google.com ([209.85.219.42]:34522 "EHLO
        mail-qv1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239462AbhDPHem (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Apr 2021 03:34:42 -0400
Received: by mail-qv1-f42.google.com with SMTP id j3so12999723qvs.1;
        Fri, 16 Apr 2021 00:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uFu1ansvgQWTnPWidX6DS+YOvYK1ittywA6eOG1qupA=;
        b=c+20I+f/+5NcwR7XIOzF2TMduM0BpkNsu/uE7CZB0lNh5AfcArtH65w8QR2g69W4Md
         NNP8Yj/aCqNTJGHmmaJIG7VBMKiAYHFb21ig/DfkUt1fptF7Ynez6nleTuACMZ5uBH+o
         3VmZwGnmJXMGhbL3D4trs0yo0Ml80ZLtZ7exwznCAzQgJLwGWU36G+wIp8NaDwJrZSaq
         mLpNbWjU0CKzrcAAZYJeD5vZGsWITwQZe9SsWr4dmgIWexyywpdspWUrOzIC7Bexje1I
         Tuk61BFxt+Esml5KqK8+t1rOb1HD9kXOV9H/TUjbIqnUQTIfGSDmYzPZZknF9Q9zj3e2
         hhlA==
X-Gm-Message-State: AOAM531GLj55DKTvyB/mkfr9McneK6uRABB/DLFXZuUVZ6DE8lcnuCxT
        MA1qI9T9btYs5oiH8OkuDVKbAzel4e1mJg==
X-Google-Smtp-Source: ABdhPJxXUubcn3MFVfm3NxiCyXVl+a9KvQgVJPLFIyw/tsMEoC1x7INMcvMWw9rFvQ0eqSZXiIcEnQ==
X-Received: by 2002:a0c:f2c8:: with SMTP id c8mr6999428qvm.35.1618558457628;
        Fri, 16 Apr 2021 00:34:17 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-236-56.ip.moscow.rt.ru. [188.32.236.56])
        by smtp.gmail.com with ESMTPSA id a26sm3602955qtg.60.2021.04.16.00.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 00:34:17 -0700 (PDT)
Subject: Re: [PATCH] floppy: remove redundant assignment to variable st
To:     Colin King <colin.king@canonical.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        Willy Tarreau <w@1wt.eu>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210415130020.1959951-1-colin.king@canonical.com>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <a732fe0b-217b-084b-eecb-ccbc21cbbfc9@linux.com>
Date:   Fri, 16 Apr 2021 10:34:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210415130020.1959951-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 4/15/21 4:00 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable st is being assigned a value that is never read and
> it is being updated later with a new value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks!

https://github.com/evdenis/linux-floppy/commit/aeec7983d49a5f972df47c742ff8373df15b0d28

> ---
>  arch/x86/include/asm/floppy.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/floppy.h b/arch/x86/include/asm/floppy.h
> index d43717b423cb..6ec3fc969ad5 100644
> --- a/arch/x86/include/asm/floppy.h
> +++ b/arch/x86/include/asm/floppy.h
> @@ -74,7 +74,6 @@ static irqreturn_t floppy_hardint(int irq, void *dev_id)
>  		int lcount;
>  		char *lptr;
>  
> -		st = 1;
>  		for (lcount = virtual_dma_count, lptr = virtual_dma_addr;
>  		     lcount; lcount--, lptr++) {
>  			st = inb(virtual_dma_port + FD_STATUS);
> 
