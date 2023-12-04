Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P10g1phy"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5C4AC
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Dec 2023 06:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701701495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QpHZcDHjpU4mfBG41n94eQLmc8/ZuBEaOjwl4e/nn80=;
	b=P10g1phyKlDqnNplUpS5SlB4QIQHGPu1mSrzTsJCRI+9S41GH5KwgQC9oryOttKrQWdh8f
	XuM4MCQHSLYzf3QHeMfLL23cKb8RCXGX9dPk6LOkhNpFDUMJqs1E+APTfpYpdBAWOJ7dfm
	cGiNZJF3uPCrJk+OC4zyUrII9LYYxQ8=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-KDAOuchtMsCkSPPmM1ltEA-1; Mon, 04 Dec 2023 09:51:33 -0500
X-MC-Unique: KDAOuchtMsCkSPPmM1ltEA-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50bf44ff4a5so928181e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Dec 2023 06:51:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701701492; x=1702306292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QpHZcDHjpU4mfBG41n94eQLmc8/ZuBEaOjwl4e/nn80=;
        b=isB7/rKLwUYZChJ4gP7MAAoBrizlx7QdCkT9gDY4yZfQCf121cIl4OGM/p7+pZNerU
         0exUbg6fdXO7tJbdDzZjXC0QpADrkL4GQSSSHvTHVsXHWVjCQI7slz4WhjEFbjemE+CA
         iK1siMfzwGMBuFjRUGoa0mk4Ai7R8I6m2JxKZD2BXeO9Dc/R+TDOFsPBYpWwz9xX+WT4
         bPGp5ZOG/YAobfy2ivYyLetqO9L3oEam9ohABFNOfmxzVmVL+yu73barjLZls3NBmEFA
         E5Co4F+fPyzkY2SXyqhchMUXP4ysb2h16l6b00txTfb/O5R0dqlFdknHDdx7/R/n5pxY
         esWg==
X-Gm-Message-State: AOJu0YyFJK2IL3du4PMb2cgo5F2wdWH21k7KZTM8spmvjD/hRFe2mC5G
	0M5HPXsEotVMdncPBDXUEd1atjRrXik2nUj5Ku8oldmUSbl23Gf9r9ZyigEzcy0UiB9cGqsXI2n
	73uifS0cYXcFm75QV2bGxns8EzGAR
X-Received: by 2002:a05:6512:39ca:b0:50c:e:171e with SMTP id k10-20020a05651239ca00b0050c000e171emr100257lfu.5.1701701491830;
        Mon, 04 Dec 2023 06:51:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGs1GCa0CgDvN1RhA5ymImqbjGWQhbplO/YgAFsWjKv5h53RCw3xx96+O9cDczJFQ7M1yeRQw==
X-Received: by 2002:a05:6512:39ca:b0:50c:e:171e with SMTP id k10-20020a05651239ca00b0050c000e171emr100247lfu.5.1701701491510;
        Mon, 04 Dec 2023 06:51:31 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cy18-20020a0564021c9200b0054cc61f0412sm1509632edb.24.2023.12.04.06.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 06:51:30 -0800 (PST)
Message-ID: <898ebe87-6376-4385-b42a-25ecc08772f6@redhat.com>
Date: Mon, 4 Dec 2023 15:51:30 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Fix an IS_ERR() vs
 NULL check in probe
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <4b1b2395-c7c5-44a4-b0b0-6d091c7f46a2@moroto.mountain>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4b1b2395-c7c5-44a4-b0b0-6d091c7f46a2@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, 	 	 	

On 12/4/23 13:29, Dan Carpenter wrote:
> The spi_new_device() function returns NULL on error, it doesn't return
> error pointers.
> 
> Fixes: 70505ea6de24 ("platform/x86: x86-android-tablets: Add support for SPI device instantiation")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

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
>  drivers/platform/x86/x86-android-tablets/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
> index 6a5975ac3286..f8221a15575b 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -220,8 +220,8 @@ static __init int x86_instantiate_spi_dev(const struct x86_dev_info *dev_info, i
>  
>  	spi_devs[idx] = spi_new_device(controller, &board_info);
>  	put_device(&controller->dev);
> -	if (IS_ERR(spi_devs[idx]))
> -		return dev_err_probe(&controller->dev, PTR_ERR(spi_devs[idx]),
> +	if (!spi_devs[idx])
> +		return dev_err_probe(&controller->dev, -ENOMEM,
>  				     "creating SPI-device %d\n", idx);
>  
>  	return 0;

