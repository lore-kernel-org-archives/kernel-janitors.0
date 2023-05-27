Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989F7C77B73
	for <kernel-janitors@archiver.kernel.org>; Sat, 27 May 2023 15:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232575AbjE0PtH (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Sat, 27 May 2023 11:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbjE0PtG (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Sat, 27 May 2023 11:49:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BF2E4
        for <kernel-janitors@vger.kernel.org>; Sat, 27 May 2023 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685202493;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X/O1MpqEOZzuixz/P/whtACWNhl6nb37DODJ17M4M+Q=;
        b=h3cBppVlVyrCEraas7Gc4PnT1nR/YL0GFmLj0i/57Fmdn4sfVDHNJYl4W/Ircb5x3lki41
        E6GzmKYs2uTiZVI06V/Kb22ndoi1NV2zjqzNktuzXqM00LZ/CO+dkqPNpX0YXCw2cv/ok7
        k5N64TiPm8z0WaWQpVdbuFmre53t7nY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-GLAp32OMMz-n-DexjxD2Xg-1; Sat, 27 May 2023 11:48:12 -0400
X-MC-Unique: GLAp32OMMz-n-DexjxD2Xg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-96fa4c724fdso321982066b.0
        for <kernel-janitors@vger.kernel.org>; Sat, 27 May 2023 08:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685202491; x=1687794491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/O1MpqEOZzuixz/P/whtACWNhl6nb37DODJ17M4M+Q=;
        b=AVRAOyCTcd9hVVULlukhHPIGbRRbWBWilEiRFxUU4DEGzsoslgmyspioNpCwF3bPVx
         EaAuEKWkxd8k1HEw6dDbfiZhiymPtcZKyPKIZmrAj0x9vvYyQQ1qDTGsyMXB69A5IBP0
         kXIXw4ABO2gdRi/G3X2YgCbNQfAWUO9L6aKuy4r7uiQc0HKpKUVVx8XLI25NVufsIg8L
         tomBp7WZH5wMEtI2kZtvTo03pV3o1zjB6JTOqOP32uqX6J7Lj6929Ck4zKshKpUQGhRe
         2XPde7DWW9DIOKVLGmYTQ/oQ72ZdNN7f1Ayr3ENtBWFof/gWi2IfaDwFNEVaWQ2TusoD
         UYGQ==
X-Gm-Message-State: AC+VfDzGRDYAFhWA3W3pPbInh/0JtnKDldn7D59zKzUJFz/pPwbcrHF1
        mfLZBI8R855lxx9z6V+r7BedTae8Do7j9f02uEPuWAek+DMiUJnbzYfTicQCPjla8u46zpebs+R
        4DPCSwHcmjV+qdeoyx5AzgmBwaNWl
X-Received: by 2002:a17:906:ef05:b0:96f:7d0a:5981 with SMTP id f5-20020a170906ef0500b0096f7d0a5981mr1896896ejs.36.1685202491177;
        Sat, 27 May 2023 08:48:11 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7v1grDXcy8stnhzDrUAF04Y8v8KpvQLbkSsVjAvB5J6Zm36T78KzlGZMg+Pbaa2c+xPuxebw==
X-Received: by 2002:a17:906:ef05:b0:96f:7d0a:5981 with SMTP id f5-20020a170906ef0500b0096f7d0a5981mr1896883ejs.36.1685202490920;
        Sat, 27 May 2023 08:48:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bh1-20020a170906a0c100b00965f6ad266bsm3530345ejb.119.2023.05.27.08.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 May 2023 08:48:10 -0700 (PDT)
Message-ID: <d8e5d438-16d8-64ca-d856-a11de6e9ba45@redhat.com>
Date:   Sat, 27 May 2023 17:48:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: atomisp: gmin_platform: fix out_len in
 gmin_get_config_dsm_var()
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ard Biesheuvel <ardb@kernel.org>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
References: <26124bcd-8132-4483-9d67-225c87d424e8@kili.mountain>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <26124bcd-8132-4483-9d67-225c87d424e8@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 5/26/23 13:53, Dan Carpenter wrote:
> Ideally, strlen(cur->string.pointer) and strlen(out) would be the same.
> But this code is using strscpy() to avoid a potential buffer overflow.
> So in the same way we should take the strlen() of the smaller string to
> avoid a buffer overflow in the caller, gmin_get_var_int().
> 
> Fixes: 387041cda44e ("media: atomisp: improve sensor detection code to use _DSM table")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thank you I have applied this to my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this will be included in my next pull-req to Mauro
for merging this into the linux-media tree.

Regards,

Hans




> ---
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index c718a74ea70a..88d4499233b9 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -1357,7 +1357,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
>  	dev_info(dev, "found _DSM entry for '%s': %s\n", var,
>  		 cur->string.pointer);
>  	strscpy(out, cur->string.pointer, *out_len);
> -	*out_len = strlen(cur->string.pointer);
> +	*out_len = strlen(out);
>  
>  	ACPI_FREE(obj);
>  	return 0;

