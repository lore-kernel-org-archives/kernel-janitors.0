Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF188C433F5
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 11:46:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9B3C61B73
	for <kernel-janitors@archiver.kernel.org>; Thu, 18 Nov 2021 11:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344345AbhKRLti (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 18 Nov 2021 06:49:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46224 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344504AbhKRLtY (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 18 Nov 2021 06:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637235983;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IPQvFkqp42yL5KGkN+R/vv46p9qBJQWpQ3XSKmUsvhI=;
        b=FGnCPEC8f9huARCIcY3gCLZNw+nlnhB3pY/X2VYb+6lCYDnnrGK0xCtm8mpCMQikfxc/JC
        ZkHBpWpyYKacVhZpnT4WnyADoq0q5tQWseWSSF3/+Q99bThYCX91MMxuUNZwUHTSYokWe0
        LLPW0RPXKqdPR60ZZFjObX1VfQzaySs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-14-E3hoXiB2PFubzd6yqdDfnQ-1; Thu, 18 Nov 2021 06:46:22 -0500
X-MC-Unique: E3hoXiB2PFubzd6yqdDfnQ-1
Received: by mail-ed1-f72.google.com with SMTP id f4-20020a50e084000000b003db585bc274so5000870edl.17
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Nov 2021 03:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IPQvFkqp42yL5KGkN+R/vv46p9qBJQWpQ3XSKmUsvhI=;
        b=RAYhopyDmtO9tY5mjJRg6BcHwUQWkz1Izhv88apyGh0K4jQeLxZaVFvO3aFHucvB2A
         dyjQeq/N1DfW9FVuspfQKkRGUG7mT43VLKpf/K1D0ILOZlu33jToVK14CyAsifja88Yq
         5SRLDXAqhtpdlB516Swrvnps7MaP8plJlkyWP++AnJ3iEuiZMG68DKVeUaQWRYmtU2LU
         NjjUrkuo/7bEU8OIZZdJXMKO5StxtpFXpgzidzwcOiuVRDHPxCgxNutvKreS3d4bqfCO
         ndav5lPXTWZFL5WAA916gAIB0AdyKcVxMyDTl1sLFzKO2gyjgsSqRevpLwodopSlT7KY
         at1g==
X-Gm-Message-State: AOAM532rVFw688NHQndO0lFVQicu0iXccgTeLypiZZfaPKLYoletFL6E
        9GbInxI9/PX9AkX6hIKLdiolorRjlZ6XD6zSHktBUWzaDFTEMbgj8vfYj8XZm1RahOs9wo/k/bt
        WOBAKzCi0eNDu9dLW4PpeM+jwvkP3
X-Received: by 2002:a05:6402:5206:: with SMTP id s6mr10360651edd.113.1637235981006;
        Thu, 18 Nov 2021 03:46:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5eIOMZFrmWoirVwrgiCTeJUljdkA4uFq3YdnvZZT1mYAyITX8gj/wjqokk4GYijd9dyzvwg==
X-Received: by 2002:a05:6402:5206:: with SMTP id s6mr10360630edd.113.1637235980878;
        Thu, 18 Nov 2021 03:46:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id el20sm1173593ejc.40.2021.11.18.03.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 03:46:20 -0800 (PST)
Message-ID: <2ea64de3-4afd-feb8-ab2f-27dd386a3a41@redhat.com>
Date:   Thu, 18 Nov 2021 12:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/vboxvideo: fix a NULL vs IS_ERR() check
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
References: <20211118111233.GA1147@kili>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211118111233.GA1147@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 11/18/21 12:12, Dan Carpenter wrote:
> The devm_gen_pool_create() function never returns NULL, it returns
> error pointers.
> 
> Fixes: 4cc9b565454b ("drm/vboxvideo: Use devm_gen_pool_create")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will go and push this to drm-misc-next right away.

Regards,

Hans

> ---
>  drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
> index f28779715ccd..c9e8b3a63c62 100644
> --- a/drivers/gpu/drm/vboxvideo/vbox_main.c
> +++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
> @@ -127,8 +127,8 @@ int vbox_hw_init(struct vbox_private *vbox)
>  	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
>  	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
>  						"vboxvideo-accel");
> -	if (!vbox->guest_pool)
> -		return -ENOMEM;
> +	if (IS_ERR(vbox->guest_pool))
> +		return PTR_ERR(vbox->guest_pool);
>  
>  	ret = gen_pool_add_virt(vbox->guest_pool,
>  				(unsigned long)vbox->guest_heap,
> 

