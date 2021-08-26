Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3083AC4320E
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 13:13:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A08460F92
	for <kernel-janitors@archiver.kernel.org>; Thu, 26 Aug 2021 13:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242466AbhHZNOl (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 26 Aug 2021 09:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57505 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230288AbhHZNOl (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 26 Aug 2021 09:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629983633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4rOTkazD8KxVh/cFMAxCF3aY7NFOOvs7j1BNmQ/pZqM=;
        b=cLa0daPsE+E6N5rTbtTZiZT6eciFk7eaHbXNIlkn0tv5v+SVbuM88mGWdXXxoT2EAFjNB1
        MPH2L1SciKIjHtInXY8+9GzsAxG2fWkbc5oRosxRCbVJiRKrte6zxjKkukmQ1RRpuWeIuv
        idPqCWsS8Vz6TwbNmQLnfTUHCOHyRww=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-hu-hOWZZNPyoqHud5EpFwQ-1; Thu, 26 Aug 2021 09:13:51 -0400
X-MC-Unique: hu-hOWZZNPyoqHud5EpFwQ-1
Received: by mail-ed1-f70.google.com with SMTP id x4-20020a50d9c4000000b003bed5199871so1482521edj.14
        for <kernel-janitors@vger.kernel.org>; Thu, 26 Aug 2021 06:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4rOTkazD8KxVh/cFMAxCF3aY7NFOOvs7j1BNmQ/pZqM=;
        b=iuAggZow2fy7+BPaYm2WnUY4T7SD0RpzDFVzXmSEU22wYQzw0ZjU6jaCIONYAVqIfB
         C4dWxGK+CDuL+PvVA6qvBOpTyI0Yr2x6HNEFIAhNgZ1bki6A4WY9VpFg4a5UNbyZbnpw
         rGefiHhBUgN9ZqwPlzzwcEx5/yKnP3dgbuDCzHiV6KxxzfqL2/RIrF1QGVV6JuaLcIZl
         LnQ82BMjrUrRFeNhBfwTKTTTqwN2EskWIPyssB+4qmBV4wQIX0VYRsNpLKGZro0SEbGv
         DTjr9uf+OkGmbj87TZhlsein2MJKMxZpCzIOW443rABrorBvsoO+131tivA4JS2rBNUA
         amIA==
X-Gm-Message-State: AOAM532HFONlMw0Zx6g/7/A9Rq246wBN3k0gXFQr4lOFu7EQBTDexAqJ
        KpXj+EKxr/I6GC285bfiSSv/kgqzeCKt9XnyZDsaECYKPW+BUkp4i99+7bJI0WsJjvtVJw3hoGY
        2pJqERzEpNWFTG6w+NIyUJ/5NBoDJ0fXQQpG5cwjhFMwRTkmtAnXfo1CdvqiKGsl5HVAaRjC6Fp
        QftirJ
X-Received: by 2002:a50:fd02:: with SMTP id i2mr871506eds.22.1629983629598;
        Thu, 26 Aug 2021 06:13:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrcwrSRpuCH3o6u/eNoA/kIY8YOa04bBQIaa8wzVFzHePXrGbEm+mOfqVhuRJBrb00zOhLJQ==
X-Received: by 2002:a50:fd02:: with SMTP id i2mr871446eds.22.1629983628857;
        Thu, 26 Aug 2021 06:13:48 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gl2sm1408855ejb.110.2021.08.26.06.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 06:13:47 -0700 (PDT)
Subject: Re: [PATCH] asus-wmi: delete impossible condition
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     Mark Gross <mgross@linux.intel.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20210824113654.GA31143@kili>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <44c6b841-fc90-864b-2f39-484d0158500f@redhat.com>
Date:   Thu, 26 Aug 2021 15:13:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824113654.GA31143@kili>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 8/24/21 1:36 PM, Dan Carpenter wrote:
> The "asus->throttle_thermal_policy_mode" variable is a u8 so it can't
> be negative.  And we always verify that the value is valid before
> setting the policy mode so there is no need to check again here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/asus-wmi.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cc5811844012..679429d41264 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2179,9 +2179,6 @@ static int platform_profile_get(struct platform_profile_handler *pprof,
>  
>  	tp = asus->throttle_thermal_policy_mode;
>  
> -	if (tp < 0)
> -		return tp;
> -
>  	switch (tp) {
>  	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
>  		*profile = PLATFORM_PROFILE_BALANCED;
> 

