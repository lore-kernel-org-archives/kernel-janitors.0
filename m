Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E23BC433F5
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 17:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E523B61076
	for <kernel-janitors@archiver.kernel.org>; Fri, 12 Nov 2021 17:59:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbhKLSCp (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 12 Nov 2021 13:02:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235496AbhKLSCo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 12 Nov 2021 13:02:44 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A861CC0613F5
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Nov 2021 09:59:53 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id h23so9782331ila.4
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Nov 2021 09:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BKRCO+sPNEEvYF+1R9ZCLe7wHn/hQy/BNfRiIf8HXr0=;
        b=GoKcKMv9WzfvYS0Gew9fuFsDLEY6puVfcM5rtRtMyEwCbG97SBJnBI+escCTKozSx0
         2ju/DBJG40QSQ6GDknJJIQmzhdkRAZLFM7FfZlgxdWkG5r9odxrTCPak1lW8WRndPzKg
         wu9TKgjVYwD+MHCQKsXsJNqW5VeJJen0i4vIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BKRCO+sPNEEvYF+1R9ZCLe7wHn/hQy/BNfRiIf8HXr0=;
        b=lri/9ci1/4cntYfUs6BGC6yQ53DrniayM5yw6LqEjryUVB/+ETohASMXyyCKUCHsmd
         ISB3c/kKidCWpFeqRKSNYiZJfxh2SkyZdZOvHyRFZkxvbufJN6F1JCsm6K1bHbUUsrMj
         5/HdhfgS4/IcDgIgfTPlqhfABxISO6nFQ9VHuGKM4XX5sKto1wgpV+dqqGi78BXYo7vr
         rXNbTEWwjg21ETGlnIGAmu8rLEkoC5H4nlfGmWv7LaM7tSrdCaySgh6RL9SY8b6YVa4f
         kZWv95DRi4vCumk72xBkquRqw+Yizg5DIpPP05S9MGv+JoOFbvXaCE6JVjzk81jLCdow
         Arzw==
X-Gm-Message-State: AOAM5308PwaICPpBCibupHcsJ1LsTMUXxCOC+0wmzUCsYxTAFXZdAXZd
        aKR0QG3/kj2cBJT+1BTdNjprdSX9InuoIw==
X-Google-Smtp-Source: ABdhPJyXxSU0LADwgxOeny7WaJv1uZzTRo7eRIlVFxQmIhvZQTdL2wSuZhZVjwaaWpmYucKl459Ihg==
X-Received: by 2002:a05:6e02:17c8:: with SMTP id z8mr10397843ilu.19.1636739992866;
        Fri, 12 Nov 2021 09:59:52 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id f3sm4104897ilq.13.2021.11.12.09.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Nov 2021 09:59:52 -0800 (PST)
Subject: Re: [PATCH] usb: Remove redundant 'flush_workqueue()' calls
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        peter.chen@kernel.org, gregkh@linuxfoundation.org,
        balbi@kernel.org, valentina.manea.m@gmail.com, shuah@kernel.org,
        johan@kernel.org, zhengyongjun3@huawei.com, colin.king@intel.com,
        trix@redhat.com, Shuah Khan <skhan@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <563123a8117d6cafae3f134e497587bd2b8bb7f4.1636734453.git.christophe.jaillet@wanadoo.fr>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <7b37c4b8-1bfa-2367-a6ad-6b40f5523934@linuxfoundation.org>
Date:   Fri, 12 Nov 2021 10:59:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <563123a8117d6cafae3f134e497587bd2b8bb7f4.1636734453.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 11/12/21 9:30 AM, Christophe JAILLET wrote:
> 'destroy_workqueue()' already drains the queue before destroying it, so
> there is no need to flush it explicitly.
> 
> Remove the redundant 'flush_workqueue()' calls.
> 
> This was generated with coccinelle:
> 
> @@
> expression E;
> @@
> - 	flush_workqueue(E);
> 	destroy_workqueue(E);
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   drivers/usb/chipidea/otg.c           | 5 ++---
>   drivers/usb/gadget/udc/mv_udc_core.c | 4 +---
>   drivers/usb/host/u132-hcd.c          | 1 -
>   drivers/usb/phy/phy-mv-usb.c         | 5 +----
>   drivers/usb/usbip/usbip_event.c      | 1 -
>   5 files changed, 4 insertions(+), 12 deletions(-)
> 

> diff --git a/drivers/usb/usbip/usbip_event.c b/drivers/usb/usbip/usbip_event.c
> index 086ca76dd053..26513540bcdb 100644
> --- a/drivers/usb/usbip/usbip_event.c
> +++ b/drivers/usb/usbip/usbip_event.c
> @@ -137,7 +137,6 @@ int usbip_init_eh(void)
>   
>   void usbip_finish_eh(void)
>   {
> -	flush_workqueue(usbip_queue);
>   	destroy_workqueue(usbip_queue);
>   	usbip_queue = NULL;
>   }
> 

Might be better to generate per driver patches.

Looks good to me. For the usbip change in this patch:

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
