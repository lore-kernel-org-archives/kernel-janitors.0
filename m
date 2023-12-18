Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50E83A1B6
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Dec 2023 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WULgJHAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702907997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z08qTo4VHKqBvQdQYFQ7T86lFpxtYJXk00pxEYx2D4=;
	b=WULgJHAQdSa7GYK8cIkkyJEE54fAv28Js8sxsd4/QEDCiUDG8wp8rAUO/kn6Fxe2RkHwMD
	FaKoFUh9B7J9gkowAd5bybYZBvdi1u1LGrh2JJgQkrUSa9ohbOLB58vBKATafGQYN8Uy88
	Jv+eP/c/9maLAWpGmiSb1w2c7dU56uU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-5-9v2gyJj6MjGktqJc7ntXSA-1; Mon, 18 Dec 2023 08:59:56 -0500
X-MC-Unique: 9v2gyJj6MjGktqJc7ntXSA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40c4a824c4bso25951015e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Dec 2023 05:59:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907995; x=1703512795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z08qTo4VHKqBvQdQYFQ7T86lFpxtYJXk00pxEYx2D4=;
        b=oBhlEmX50c1FeMyFZY3aRuPKgQZ3SY8YrwckSeepuF+ueRCTgBWIQQ2GJecb7lOOCV
         dSgJqYVeXA2WIOJQUnjernnZe6xeDdGKHobTJVAGbyHWPg2l8EaU5w9Uw3w2dR5xQ5+d
         +KAWbSBUpl4Qm4afoH3y/kxIlb51/TYpe/yjtKetwJwoaoWYLRKSPFce2iqXk15wnX6B
         goXf6M6SQ7En73VkE64xv641SJihUg9n4UJYMj9KLhfZVhv48xYWIYaHOA2c/OFOJYDK
         ry6ZYjVJTgA+cpKLHC45fPgJNz4ujrpphQPkJFSKrYlXWczwd5il75KKvNaOKivhYN7H
         hwFQ==
X-Gm-Message-State: AOJu0Yzju75w4lYIE5KceUo9ZG4iIxhajAm8xPqTzAtmFv8V13WhXH28
	0AT/HDus5cRe08RMGd4XfCTPGm8u8U5sqHWETGR+9aD24F5seHwb3aOmHlBK1sfj/xqal+qBZh6
	YeMPMBh//phAZr3Y0NGIW8Wo+IeER
X-Received: by 2002:a7b:c385:0:b0:40c:24e1:b6bb with SMTP id s5-20020a7bc385000000b0040c24e1b6bbmr8131727wmj.128.1702907995001;
        Mon, 18 Dec 2023 05:59:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcdBLo/fPLob8CR9UlEPNAiidKYcTuOaD1IcTPhjmqGj7oGakg4oZsc8hPpVkW4btXSQMQCQ==
X-Received: by 2002:a7b:c385:0:b0:40c:24e1:b6bb with SMTP id s5-20020a7bc385000000b0040c24e1b6bbmr8131722wmj.128.1702907994622;
        Mon, 18 Dec 2023 05:59:54 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b009fc576e26e6sm14059747ejd.80.2023.12.18.05.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 05:59:54 -0800 (PST)
Message-ID: <011c6ff1-e9ce-400d-bc34-a08ce880f6e6@redhat.com>
Date: Mon, 18 Dec 2023 14:59:53 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] platform/x86: silicom-platform: Fix spelling
 mistake "platfomr" -> "platform"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Henry Shi <henryshi2018@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231215112746.13752-1-colin.i.king@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231215112746.13752-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/15/23 12:27, Colin Ian King wrote:
> There is a spelling mistake in a literal string. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

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
>  drivers/platform/x86/silicom-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
> index 84b92b3f9f4b..6ce43ccb3112 100644
> --- a/drivers/platform/x86/silicom-platform.c
> +++ b/drivers/platform/x86/silicom-platform.c
> @@ -866,7 +866,7 @@ static int silicom_fan_control_read_labels(struct device *dev,
>  {
>  	switch (type) {
>  	case hwmon_fan:
> -		*str = "Silicom_platfomr: Fan Speed";
> +		*str = "Silicom_platform: Fan Speed";
>  		return 0;
>  	case hwmon_temp:
>  		*str = "Silicom_platform: Thermostat Sensor";

