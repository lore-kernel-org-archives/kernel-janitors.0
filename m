Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E96D139587
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 11:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228856; cv=none; b=Gp1eKojPf6Dzl4ulqc+veWLpI/ymzkV4jl9qXn/OHYpERZWmpyB4rDOhsxBCqaivpdXdEGJ8LKUlQhWOGzb2uefm2DB44LsPAKUC2Nl7Dle6RHBo6xadbYBuFXe/GXFeG3663J1BRF3RXWO0YOi37VCs+lLae4je2K2oz1fxAF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228856; c=relaxed/simple;
	bh=rP3AhGt0XPYvVMqPRvexwBnWuUQiMNd3QTg3693J/qE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jYn7qgCpUqhVv7/IqudCvVFSTJRmH2FQ4YYClPn6LHrr3Cn3s3/jVzMCVt0TTMlMkpcP1o3JUmpDRd73nnVu8qhOA3trnNsAj2PEkNViGYJu1s8RwEbbAGwD3nNZGQ4niHGXHKh2H8RnVR3F+u5cqXZQClG/5LkyOyEG4CSlThU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfssW4jD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfssW4jD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719228854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCKMjpby00bDobCkZro5ZOxXPo0pbZqz3nGXBjwVgXE=;
	b=TfssW4jDdJVYuaIzghftjr6U209vO4B6FE/xtlGsmY3m5aAZ3zGWxiKivCy4lKc3c0uTKf
	zkYfN0wadffwDLoBS/5dzNpZZrajStlpVp+KAAphN7LQTrInf5ShVCRMmOHnwwcUb58O37
	mUDFCVvXY+g5ZKDBTFdPpoXRJf/Ulls=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-58kM7hm-OR2jUE7hPE24Mg-1; Mon, 24 Jun 2024 07:34:13 -0400
X-MC-Unique: 58kM7hm-OR2jUE7hPE24Mg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a72469c0fdcso61437466b.3
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Jun 2024 04:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228852; x=1719833652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VCKMjpby00bDobCkZro5ZOxXPo0pbZqz3nGXBjwVgXE=;
        b=t4mjLMDyhzFi7dohIDZ1DnH1GQ58n7hLPkWkUIp0+qw600wJUBJungr+cWl+Cik5dU
         +TpHOYbxmfWd742vXC4aO2hRgi1dAKKHOvjeSprAUZvYuMZ4YtIQ5tBz/FK82Vu83fsy
         IAPXmIsidtg3mRlOTrHcTsL4dznNRVBGpkFJozJ2yZkcHQgnXf20Q/uaReLJPi+aqp/g
         7d8npH9IkU6cRGjlo2V5AbRbU+Ht97kKDL3s6yxiI7uhcc4NoFizNQXifOVDpvUADPh5
         0P93Tb8S/pnaQ+GUuY7xyp1VUIE9WOUvPG/Wgn71CNaH4EZnH+ZJORavCl5BqrhGZMsv
         b24w==
X-Forwarded-Encrypted: i=1; AJvYcCVHmIaleNPVJ6cHkRzXpIXzRVgOfAeWH0lP8kGtRi2KsArnEKrdN/XSfFaPcto/xspOMgM/S+UKe5+dcuYVt9hnugF9SRIs9/WY3mjOvApX
X-Gm-Message-State: AOJu0Ywl2NZfP9HJ3cZfKnOPzA8UPI7xL5W+DyGpYPUpV57ByX32UHpd
	SpKH3MwV/c2wcxhh3hYdC1phsk4+AJlI/GxBXYnF3ibAGkwJjYAP10wWsN+uxcJwrJufKEtlhZa
	4DjTQy4Nbo1AOYm5c/gSTNRNXKfEaGDz1YRPRx0QIa1ScrS9fGfGJ+iu6UhDPA7pDig==
X-Received: by 2002:a17:906:48d8:b0:a6f:668b:3442 with SMTP id a640c23a62f3a-a7242d2ab06mr311820866b.77.1719228851840;
        Mon, 24 Jun 2024 04:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlN0JEAc1iattWsBfIJf9JXqX97F0IQkD4Cdeaw+2W32s/U+v/dzqJK63jJU+jnLYtVIwVCA==
X-Received: by 2002:a17:906:48d8:b0:a6f:668b:3442 with SMTP id a640c23a62f3a-a7242d2ab06mr311818866b.77.1719228851413;
        Mon, 24 Jun 2024 04:34:11 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72613d05c4sm21278866b.171.2024.06.24.04.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 04:34:11 -0700 (PDT)
Message-ID: <b53b9b5f-7cd5-46bb-ac53-7436a8715972@redhat.com>
Date: Mon, 24 Jun 2024 13:34:10 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/intel: add missing MODULE_DESCRIPTION()
 macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Alex Hung <alexhung@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240611-md-drivers-platform-x86-intel-v1-1-5ed967425b04@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240611-md-drivers-platform-x86-intel-v1-1-5ed967425b04@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/12/24 6:56 AM, Jeff Johnson wrote:
> With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/pmc/intel_pmc_core_pltdrv.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-hid.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-vbtn.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-rst.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-smartconnect.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/intel/hid.c          | 1 +
>  drivers/platform/x86/intel/pmc/pltdrv.c   | 1 +
>  drivers/platform/x86/intel/rst.c          | 1 +
>  drivers/platform/x86/intel/smartconnect.c | 1 +
>  drivers/platform/x86/intel/vbtn.c         | 1 +
>  5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
> index c7a827645864..10cd65497cc1 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -38,6 +38,7 @@ MODULE_PARM_DESC(enable_sw_tablet_mode,
>  /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
>  #define TABLET_MODE_FLAG BIT(6)
>  
> +MODULE_DESCRIPTION("Intel HID Event hotkey driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("Alex Hung");
>  
> diff --git a/drivers/platform/x86/intel/pmc/pltdrv.c b/drivers/platform/x86/intel/pmc/pltdrv.c
> index ddfba38c2104..f2cb87dc2d37 100644
> --- a/drivers/platform/x86/intel/pmc/pltdrv.c
> +++ b/drivers/platform/x86/intel/pmc/pltdrv.c
> @@ -86,4 +86,5 @@ static void __exit pmc_core_platform_exit(void)
>  
>  module_init(pmc_core_platform_init);
>  module_exit(pmc_core_platform_exit);
> +MODULE_DESCRIPTION("Intel PMC Core platform driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/intel/rst.c b/drivers/platform/x86/intel/rst.c
> index 6bc9c4a603e0..f3a60e14d4c1 100644
> --- a/drivers/platform/x86/intel/rst.c
> +++ b/drivers/platform/x86/intel/rst.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  
> +MODULE_DESCRIPTION("Intel Rapid Start Technology Driver");
>  MODULE_LICENSE("GPL");
>  
>  static ssize_t irst_show_wakeup_events(struct device *dev,
> diff --git a/drivers/platform/x86/intel/smartconnect.c b/drivers/platform/x86/intel/smartconnect.c
> index cd25d0585324..31019a1a6d5e 100644
> --- a/drivers/platform/x86/intel/smartconnect.c
> +++ b/drivers/platform/x86/intel/smartconnect.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/module.h>
>  
> +MODULE_DESCRIPTION("Intel Smart Connect disabling driver");
>  MODULE_LICENSE("GPL");
>  
>  static int smartconnect_acpi_init(struct acpi_device *acpi)
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
> index 84c1353eb12b..9b7ce03ba085 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -24,6 +24,7 @@
>  
>  #define VGBS_TABLET_MODE_FLAGS (VGBS_TABLET_MODE_FLAG | VGBS_TABLET_MODE_FLAG_ALT)
>  
> +MODULE_DESCRIPTION("Intel Virtual Button driver");
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("AceLan Kao");
>  
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240611-md-drivers-platform-x86-intel-16fa0454fe2b
> 

