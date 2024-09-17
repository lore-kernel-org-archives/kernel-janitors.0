Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F732167D83
	for <kernel-janitors@vger.kernel.org>; Tue, 17 Sep 2024 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569792; cv=none; b=I/CVdaBIPkaJEPK245cM3JxB2G3fE4mF7kjQb/ZZ38XxWWJrgHRPpOWrBJx4suEUL2C+CrvPnYQtZV5d0jFhk6qhc9pc3q04Nw+yY7xj3QkyDn4DhV44e8Ye3SDE1TsnC4xvllwtw1DAasbz8I7MCxo+hbFb9IY7n8CVzmJX4iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569792; c=relaxed/simple;
	bh=0MoxXkvJSKaSgaXMrCaZm73NkLPBSB9YPiMym0u652k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tzyj3LELvy9Rn0wtE0DyAO9DJI/JStsjF3vAvtumkpplohEDbgo3Y7uROa+Mn11XK3duUaX6QcmPewT2ekYixPkygBdATGprlICRYpF2uImU5crOzmKndPFP49hB6bPkrLjAJBbft3nqdaDkhnwO272nt6I73l4Kay1G8jmVJFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGzJbUGg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGzJbUGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726569789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YoYRHGXy6LiSQ7ig9viAYulgFxGklMeMzesdPkQzrxE=;
	b=dGzJbUGgUmJoDBbLFUaXafkAa0v2QAoQKVirGx4uG4laZgxtb09J5p1tcVWv72IR+q2zv/
	ZbHQqMbosmIaxvJHQzxSk9t17VEZubL0WUGvtcDm19Gzb1D5218nMuizsQU95Irh7rhBaK
	LPRPXiaeXvSIAvz3csOTvkUY1z5ylnQ=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655---iywW3_NzmKLg7Sp1Rftw-1; Tue, 17 Sep 2024 06:43:08 -0400
X-MC-Unique: --iywW3_NzmKLg7Sp1Rftw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-53661526719so4337313e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Sep 2024 03:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726569786; x=1727174586;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YoYRHGXy6LiSQ7ig9viAYulgFxGklMeMzesdPkQzrxE=;
        b=MIeDZWZxM9L+zVv32iCcNqjxaXA7Y53mceXreVJYLEYTFBxeSRtLjC+Ma4zDur4IEt
         9/7Z9qXZuQBa7zvxfzWwC4VI6Qq7PvUcxlj/7occWCctm8wQpYhph0Zg9RuepM3e7cVc
         N6duzdGLEIajNrQPXkkl7Qo4fWOV84ZvWmRJZ5aE6ohyQneNK9XqASKoNMZDyu2vqjgR
         f9q0hdL5yZN/n3GjReA5iJoVAYNA9910s+MqkNXF5HefOcdj8fFOPS8mmtCz3Xb4KIOK
         fYckDo3Htv3k2dQLn2e9TdZ8a3cO6FgR4MPvYc2mhxEr8a76+bPMEatVQeqHIUoXVpaJ
         Fbgw==
X-Gm-Message-State: AOJu0YyjUXKmOYu8sjdQ50lglnuvWd/uNQzFn8F5s4tKlIP7z+2BdMMD
	1QejS+fWX5nyekPm6MAzkUse9pm/4cqUnqztGnyz93TA1pBqIQH8Q6O+9TNmVQ7R3t6kHblFtqE
	NSuT70F2GQDM2A7elIpghPLWs3PFNuOH+WahkURD5oFIvk+QFBME8gkDEUHZpQUzEBe4E6WW2cA
	==
X-Received: by 2002:a05:6512:b03:b0:536:53c2:8179 with SMTP id 2adb3069b0e04-53678feb22dmr10992075e87.37.1726569786233;
        Tue, 17 Sep 2024 03:43:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZygkqRefwIJhNMGJUQJEghGkf7TGezwH/8E+OMWQLK5GoIADd56o7ucnqsVHGcAHn2LqRQw==
X-Received: by 2002:a05:6512:b03:b0:536:53c2:8179 with SMTP id 2adb3069b0e04-53678feb22dmr10992044e87.37.1726569785667;
        Tue, 17 Sep 2024 03:43:05 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e5731sm430913866b.183.2024.09.17.03.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 03:43:05 -0700 (PDT)
Message-ID: <ea5a2d34-32b2-4641-99c5-6e64dce88ac7@redhat.com>
Date: Tue, 17 Sep 2024 12:43:04 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in INTEL MID PLATFORM
To: Lukas Bulwahn <lbulwahn@redhat.com>, Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20240917103955.102921-1-lukas.bulwahn@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240917103955.102921-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/17/24 12:39 PM, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 5f1cda51107f ("platform/x86: intel_scu_wdt: Move intel_scu_wdt.h to
> x86 subfolder") moves intel-mid_wdt.h in ./include/linux/platform_data into
> the x86 subdirectory, but misses to adjust the INTEL MID PLATFORM section,
> which is referring to this file.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Adjust the file entry to this header file movement.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thank you for your patch, I've applied this patch to pdx86/for-next:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next

Regards,

Hans




> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4c4116045664..9a4fa88edcd3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11646,7 +11646,7 @@ F:	drivers/platform/x86/intel_scu_*
>  F:	drivers/staging/media/atomisp/
>  F:	drivers/watchdog/intel-mid_wdt.c
>  F:	include/linux/mfd/intel_soc_pmic_mrfld.h
> -F:	include/linux/platform_data/intel-mid_wdt.h
> +F:	include/linux/platform_data/x86/intel-mid_wdt.h
>  F:	include/linux/platform_data/x86/intel_scu_ipc.h
>  
>  INTEL P-Unit IPC DRIVER

