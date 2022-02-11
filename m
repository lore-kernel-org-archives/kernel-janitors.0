Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CE2C433EF
	for <kernel-janitors@archiver.kernel.org>; Fri, 11 Feb 2022 07:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238097AbiBKHnP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 11 Feb 2022 02:43:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242790AbiBKHnO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 11 Feb 2022 02:43:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 232C0250
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 23:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644565393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q+JoBX4dv2Ujy4kHFl4q2D9yIGmIdd5volu8AUosqWE=;
        b=RdUhG+Hyq2LpweCA5pPN7RiZhctVT43Bxc9M2053mC39yhfl2J1kE3oZc7IPhh9VJJzpvV
        FzbkkfLl8F+xuoxf3QX3BnU8RtY+zZBT5fDGfoim533yFV6SSX0+JyOeUWwt19CFA4myT/
        ujPhZ3S8qumHSO+oOJMovj0E8yPh/VU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-42-GobrnTxqNKCZYYGr_mUQMA-1; Fri, 11 Feb 2022 02:43:12 -0500
X-MC-Unique: GobrnTxqNKCZYYGr_mUQMA-1
Received: by mail-ej1-f69.google.com with SMTP id mp5-20020a1709071b0500b0069f2ba47b20so3677114ejc.19
        for <kernel-janitors@vger.kernel.org>; Thu, 10 Feb 2022 23:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q+JoBX4dv2Ujy4kHFl4q2D9yIGmIdd5volu8AUosqWE=;
        b=HL+Cb+8FXM2BnDYq0qZhmgA1MNawL8gZVwBFN/LinUDK0XprZJXJqN81ulgjo2OJMM
         L7oJodZA4uAjc1FqBUqWCbPMQ1QuGu9AdeN3nf/8GAbzf2ZOcgGIJJaUnQfoFcETu70q
         34WQwC57U0MriCLBFCZXk5vta5eBirohyQNZVTQlXZYB1gNPQis6u2FK2I67HMt88fTq
         Lw8tOe9/sQwtVh/wEQpeOPZDVvvXnu65uVSt4Z9oYHMWN7Kl7rS5F9O0K9w+3x9O0ObX
         /xAsXdBaSD6POB5bbRTNG7K4rffyjRiotlpez3c58SgCTkJwUWtLTPuj+fAza1yvQYFA
         fwVw==
X-Gm-Message-State: AOAM533bNnqSXH0kv946iJKCGYh97ZTLaYmQISBsF9XemyH+l6jDYCTC
        eXsFyRkuVclRgzpsQtRJbEc7hcIM7qV2ZjmjCPIj7AP48h3u1z8BHmPhLU8b3XQp2EeGcF35RN0
        861TIFE91Ozw1GiZXzRiqAQXZCJ/r
X-Received: by 2002:a17:906:5d14:: with SMTP id g20mr322480ejt.37.1644565391017;
        Thu, 10 Feb 2022 23:43:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEfQpRtLobU4UAs4SWOVNcJDhEjOkbQmmbly0Xr2tW7hupHSA1QdZZhCzrr2fKvmPOHvfu0w==
X-Received: by 2002:a17:906:5d14:: with SMTP id g20mr322469ejt.37.1644565390811;
        Thu, 10 Feb 2022 23:43:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id g15sm4632241edz.100.2022.02.10.23.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Feb 2022 23:43:10 -0800 (PST)
Message-ID: <d4425819-78c0-ad53-841d-fd59a59c2736@redhat.com>
Date:   Fri, 11 Feb 2022 08:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/9] ASoC: Intel: bytcr_wm5102: use GFP_KERNEL
Content-Language: en-US
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Cezary Rojewski <cezary.rojewski@intel.com>
Cc:     alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
        Takashi Iwai <tiwai@suse.com>,
        Jie Yang <yang.jie@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
References: <20220210204223.104181-1-Julia.Lawall@inria.fr>
 <20220210204223.104181-4-Julia.Lawall@inria.fr>
 <d26561a1-ddd4-aea0-792d-efce104ad44f@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d26561a1-ddd4-aea0-792d-efce104ad44f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi,

On 2/11/22 01:20, Pierre-Louis Bossart wrote:
> 
> 
> On 2/10/22 14:42, Julia Lawall wrote:
>> Platform_driver probe functions aren't called with locks held
>> and thus don't need GFP_ATOMIC. Use GFP_KERNEL instead.
>>
>> Problem found with Coccinelle.
> 
> Thanks Julia, indeed it's the only case where GFP_ATOMIC is used for
> machine drivers.
> 
> This was already present in the initial Android driver from Intel (2013)
> [1] and missed in the multiple passes to get this upstream.
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Yeah I should have caught this when I upstreamed the machine driver:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> [1]
> https://github.com/lenovo-yt2-dev/android_kernel_lenovo_baytrail/blob/cm-12.1/sound/soc/intel/board/byt_bl_wm5102.c
> 
>>
>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>>
>> ---
>>  sound/soc/intel/boards/bytcr_wm5102.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
>> index 504ef4cab111..8d8e96e3cd2d 100644
>> --- a/sound/soc/intel/boards/bytcr_wm5102.c
>> +++ b/sound/soc/intel/boards/bytcr_wm5102.c
>> @@ -389,7 +389,7 @@ static int snd_byt_wm5102_mc_probe(struct platform_device *pdev)
>>  	bool sof_parent;
>>  	int ret;
>>  
>> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_ATOMIC);
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>  	if (!priv)
>>  		return -ENOMEM;
>>  
>>
> 

