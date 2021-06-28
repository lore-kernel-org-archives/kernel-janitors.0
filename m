Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E3BC49EAB
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 09:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1D846144D
	for <kernel-janitors@archiver.kernel.org>; Mon, 28 Jun 2021 09:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhF1JNb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 28 Jun 2021 05:13:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23585 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232284AbhF1JNa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 28 Jun 2021 05:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624871464;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QSxhGXuFgaYCNORG2oStQmV2YGot2W2Jd3yRE953jX0=;
        b=ZKhZAJwrk5sT4vW9n5WB3sE81RN4Qqcg1BwNrGOi+FMfP9MlRdILWofyKw5ZKuyX1jA5q/
        2XyRnR5Bv7L4zsNfQkgf2WcifrIVFjwa1/b32lSh7bUUpGHzeLinLP/BIB0OesVOkwaFRh
        M6MnG2d/bXd7EkES+NbRLeexkfXoSI4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-5o7hknyxMKa_7oBOc4BoWg-1; Mon, 28 Jun 2021 05:11:01 -0400
X-MC-Unique: 5o7hknyxMKa_7oBOc4BoWg-1
Received: by mail-ed1-f70.google.com with SMTP id h11-20020a50ed8b0000b02903947b9ca1f3so9124698edr.7
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Jun 2021 02:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QSxhGXuFgaYCNORG2oStQmV2YGot2W2Jd3yRE953jX0=;
        b=QAxbwlc5PVTrgu0rSEyQMx6rbSv4/Bz1BVWmAfXmNJOfxyScVb5Jn+fu0C5VKm8Mfr
         QkGyNtRWNnnppm6f4NFKby+Eixek/MM0kHHRaZDOVQ25L4NfVlwHVJSi5LKDYMAXtrMP
         rrFDYHuaI3+Sx86k4ewwYGug7Vq0+tAQOFfWHc4J6BcB6RTqewy9dL+ot1hE6BRt8NLf
         GTAMikmlUslbPdZ/8SaGhVUP2SUZ4f+VDNB1sZ0rj00vegfHqQwvzfZNtv0cQtrF/7HT
         MdDV2dbT2fDGcHVCtCBP70xEMoDFjLpSFQ4UNzQL+/gELFg+Kn1+5HX0CzHh2Im3LRF4
         VD7Q==
X-Gm-Message-State: AOAM532RquFHhNWvLWOeaxpSa8uvSiSokju6pKT0dX8L7Aj5678sYD9E
        nrcLYdXSxO2XQtzbqxSpLMqicOgEd3C0mPQf6Cz5JkM+ZdKfxwbLhTiYZEfWECmmphEGx8S8200
        KumHajncFprsXiZiwDF/gN7iu/Dl/X3r9pr+lWH8jeGMVWFRQ5NZ5FFBUSecxt4+V9yCi4gOFT4
        4onowB
X-Received: by 2002:a05:6402:4393:: with SMTP id o19mr31242096edc.263.1624871460320;
        Mon, 28 Jun 2021 02:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGR/FU7pazREhgZ04ZbgY8SEPAalO+nTG+TzkpoW3CvUMZHZ6oahaVTtEjMIrWmXhsRQBTtg==
X-Received: by 2002:a05:6402:4393:: with SMTP id o19mr31242077edc.263.1624871460138;
        Mon, 28 Jun 2021 02:11:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bx28sm6610654ejc.39.2021.06.28.02.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 02:10:59 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_skl_int3472: Uninitialized variable
 in skl_int3472_handle_gpio_resources()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Scally <djrscally@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YNXTkLNtiTDlFlZa@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0739ff92-3f9a-45d1-3953-d9daeb9cfa7e@redhat.com>
Date:   Mon, 28 Jun 2021 11:10:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNXTkLNtiTDlFlZa@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 6/25/21 3:01 PM, Dan Carpenter wrote:
> This function returns negative error codes, zero (to indicate that
> everything has been completed successfully) and one (to indicate that
> more resources need to be handled still).
> 
> This code prints an uninitialized error message when the function
> returns one which potentially leads to an Oops.
> 
> Fixes: 5de691bffe57 ("platform/x86: Add intel_skl_int3472 driver")
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
>  .../platform/x86/intel/int3472/intel_skl_int3472_discrete.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> index 17c6fe830765..9fe0a2527e1c 100644
> --- a/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> +++ b/drivers/platform/x86/intel/int3472/intel_skl_int3472_discrete.c
> @@ -286,10 +286,10 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	int3472->ngpios++;
>  	ACPI_FREE(obj);
>  
> -	if (ret)
> +	if (ret < 0)
>  		return dev_err_probe(int3472->dev, ret, err_msg);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
> 

