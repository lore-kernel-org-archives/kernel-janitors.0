Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7CFC433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 09:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91F5261107
	for <kernel-janitors@archiver.kernel.org>; Thu, 11 Nov 2021 09:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232770AbhKKJw6 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 11 Nov 2021 04:52:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53185 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232707AbhKKJw6 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Nov 2021 04:52:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636624209;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JafLzISzwmOzPN4jHok3ZWFkvUmYVSwTaJ2FlEhdEi4=;
        b=My0was0GDQYR76YN6qAjmmRa0AbDqlkHrP7VVW8chys60A2J2R+8qkg0C3gCcefqXRG5TU
        7MBMNtzaQL6L0FlCEopg9wZSFL4oQiAZjMlGbWY0rp7AVw3A43afixDtQtRz3ULOJvbZMV
        dvKCYxdMi/rWpzLICTXs1ECiNZBhc6M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-emb-04blP_-HkwJkX3FfxQ-1; Thu, 11 Nov 2021 04:50:05 -0500
X-MC-Unique: emb-04blP_-HkwJkX3FfxQ-1
Received: by mail-ed1-f70.google.com with SMTP id g3-20020a056402424300b003e2981e1edbso4999301edb.3
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Nov 2021 01:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JafLzISzwmOzPN4jHok3ZWFkvUmYVSwTaJ2FlEhdEi4=;
        b=gIFuq3dAQVIOsZKs2B09z0gKn76SDuw6Zh7WlyF555e5SRaNevr6YIjzO2TwHEsE/Y
         XnTJ6dckiR1tjIFSeFI8HYBaJXPMMnuI3tii2iPpGMGet8OI37MaxW+Y1jUv/K08RF/+
         oTrUfy1mboFkftYNjCeAzhi/0w5oH8BOMt0X5BYgUprDX3bkRP0OZhm/O/RavQT6Ifpo
         qKR1ZOZvOx79HtkMevaA3yPC/VN6w2JQhIaH6jSGkX3NXWIg9Nldcb91B5P4TngVw8M8
         W7mcTeUMVh6ga9aZmUUHSdBru8o7NApOkbYLV6QXTGJenv36+Ry3S4fEUiXrnvD04J3H
         Xy/g==
X-Gm-Message-State: AOAM530tvT6V9KCrEAr4T2xMMoZDy/m+C78/JghmJRTQJUQTcfZ/9bNw
        SI530pUo2badQbB6DRcfCLH8DplQdVx+VzLCXUtBaELEZWVX21ktzVS4XUh/NFIG5VeVjzstKDX
        L+pcPWV1KcbT4tCtLat0ajeA62/Oq
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr8276765edd.215.1636624204506;
        Thu, 11 Nov 2021 01:50:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQXQipOHgu56fK0wp8NB2xtImtn2zLX3VXCyWkmAAt4eX3rhUs8DnfV/kJZx6jHnPTnieDzg==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr8276733edd.215.1636624204285;
        Thu, 11 Nov 2021 01:50:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ee7sm1252316edb.1.2021.11.11.01.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 01:50:04 -0800 (PST)
Message-ID: <c6130e0a-8c26-f6c8-acf1-351b41e8a2bc@redhat.com>
Date:   Thu, 11 Nov 2021 10:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: hp_accel: Fix an error handling path in
 'lis3lv02d_probe()'
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        eric.piel@tremplin-utc.net, markgross@kernel.org,
        dmitry.torokhov@gmail.com, giedriuswork@gmail.com,
        dvhart@linux.intel.com, akpm@linux-foundation.org, pavel@suse.cz
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <5a4f218f8f16d2e3a7906b7ca3654ffa946895f8.1636314074.git.christophe.jaillet@wanadoo.fr>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5a4f218f8f16d2e3a7906b7ca3654ffa946895f8.1636314074.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 11/7/21 20:57, Christophe JAILLET wrote:
> If 'led_classdev_register()' fails, some additional resources should be
> released.
> 
> Add the missing 'i8042_remove_filter()' and 'lis3lv02d_remove_fs()' calls
> that are already in the remove function but are missing here.
> 
> Fixes: a4c724d0723b ("platform: hp_accel: add a i8042 filter to remove HPQ6000 data from kb bus stream")
> Fixes: 9e0c79782143 ("lis3lv02d: merge with leds hp disk")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will add this fix to my tree once 5.16-rc1 is out and
I will include this fix in my first pdx86 fixes pull-req
for 5.16.

Regards,

Hans

> ---
>  drivers/platform/x86/hp_accel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index b183967ecfb7..435a91fe2568 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -331,9 +331,11 @@ static int lis3lv02d_probe(struct platform_device *device)
>  	INIT_WORK(&hpled_led.work, delayed_set_status_worker);
>  	ret = led_classdev_register(NULL, &hpled_led.led_classdev);
>  	if (ret) {
> +		i8042_remove_filter(hp_accel_i8042_filter);
>  		lis3lv02d_joystick_disable(&lis3_dev);
>  		lis3lv02d_poweroff(&lis3_dev);
>  		flush_work(&hpled_led.work);
> +		lis3lv02d_remove_fs(&lis3_dev);
>  		return ret;
>  	}
>  
> 

