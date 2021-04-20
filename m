Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAA1C433ED
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 15:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7C0E610CC
	for <kernel-janitors@archiver.kernel.org>; Tue, 20 Apr 2021 15:02:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbhDTPDZ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 20 Apr 2021 11:03:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36575 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232878AbhDTPDY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 20 Apr 2021 11:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618930973;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rt7NKGaDjHDmt2xUfgF5jDi+mP8ivKolM0XswNMHLOA=;
        b=bbsPUdyCyioUZwt6UBrOVLFQVhsrZlYv2XlbND7ISBQuNcooJYGRSCa+tvLgtwuhNNSi1Z
        tppcd34Sl6bf803GU3y93/uwCNHbpNvlUxteIJ476sesa1X541UU7Ei4o8G2hPlP+03gjt
        o8JL6mNXbpdYZLhs4WompmxQc+g40Ic=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-Kx_MWQxtM0KgFD2izwx5ag-1; Tue, 20 Apr 2021 11:02:51 -0400
X-MC-Unique: Kx_MWQxtM0KgFD2izwx5ag-1
Received: by mail-ej1-f70.google.com with SMTP id w2-20020a1709062f82b0290378745f26d5so4860659eji.6
        for <kernel-janitors@vger.kernel.org>; Tue, 20 Apr 2021 08:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rt7NKGaDjHDmt2xUfgF5jDi+mP8ivKolM0XswNMHLOA=;
        b=ZL+djrm7M31h1LItDpvYD1cGlts9Z5u5clbW1AsUJ+cAgsGR6OxrnWJZmw7SLgWPDA
         Kb6q96rmUyEdpEfSV3QFNbtCreNBOcsz8CeyLblcbzUZ3eMPJWbsPELtb/qNQMZkjscW
         Ke7TdOjzMKbVQ/E2q6ttH/ZnOMXjc3e5gcBKApQWUKnHDGGAc8Fz7D6cvzqD7WNBUR4M
         fY682EK1Ke5pBW353AYakd4YcAobJxaKAwvvitCrvLbDT4KYP5ywbmtlybM7G8XUATcP
         ox4uBVAx/nOhgvIKDCwscK1hZ5BfSM1GhkCmwbXdIbofeZFpc/dp623rSRhLh6WPv6/d
         EtDQ==
X-Gm-Message-State: AOAM5336e5d2oUC+XJwM0E3mHUzink++RRvzJsLlmzFgzHglPKRMtD4C
        23TO47bC235Yd1HJwhUR6Aq3vTX32+ojMCsZqdD+WgXKTARc1UlygHQRCJfdbg5qAE70kryiZhK
        7FUEfIbgOXFwzJum3N43ryEGmfZyK
X-Received: by 2002:a17:906:13d6:: with SMTP id g22mr28063989ejc.475.1618930969859;
        Tue, 20 Apr 2021 08:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8mzqn6L2EwFc7Dx0OfYgYfDc/bUY8zJsA2Mtisctwz4KFSvxkXRHeKmP7F7oY7klb0bilcA==
X-Received: by 2002:a17:906:13d6:: with SMTP id g22mr28063975ejc.475.1618930969667;
        Tue, 20 Apr 2021 08:02:49 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bu20sm1745180ejb.76.2021.04.20.08.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:02:49 -0700 (PDT)
Subject: Re: [PATCH][next] platform/x86: intel_pmc_core: fix unsigned variable
 compared to less than zero
To:     Colin King <colin.king@canonical.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210420121044.379350-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ba5a2360-68b2-a3e6-c379-5122e698bfca@redhat.com>
Date:   Tue, 20 Apr 2021 17:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420121044.379350-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Colin,

On 4/20/21 2:10 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for ret < 0 is always false because ret is a (unsigned) size_t
> and not a (signed) ssize_t, hence simple_write_to_buffer failures are
> never detected. Fix this by making ret a ssize_t
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thank you for the patch, but I already send out the same patch myself
yesterday, so this is a duplicate.

Regards,

Hans



> ---
>  drivers/platform/x86/intel_pmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 3ae00ac85c75..d174aeb492e0 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1360,7 +1360,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
>  	struct pmc_dev *pmcdev = s->private;
>  	bool clear = false, c10 = false;
>  	unsigned char buf[8];
> -	size_t ret;
> +	ssize_t ret;
>  	int idx, m, mode;
>  	u32 reg;
>  
> 

