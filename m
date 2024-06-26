Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4638F47
	for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 20:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719433107; cv=none; b=bcie1fDTaQ3GCGv6e5LEsuixPc7VE1Vnwcv0BD1we5SkBf3w3gCU/9eH/KTEYhSo5FrmutJj4RWZ75JwwEtxqt+txgtxh4iKQiJdigBMiiV7ApvtC3/GTNNHew+pW2xt1ZK9D702xPljzMOP9kXpIo6+jIuBXwdARWWGK+ID5R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719433107; c=relaxed/simple;
	bh=Ftq67nm0JfYOkpiAIY6KRhsDW2bsJuzJxWDFtGcclIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOEat/1QeuAxOKMvoNEftz81cIJYHy6STfdQKFDd3KUIqpMVZz5ZwHgMeypg4Q6e5Yx4iLaI0Uc2NMQZuY2hq5b+dx9AhXldbKhXPOaA6kABG/U1C3QDWIl0sTTlJ0/zdJN11yBko5HN4SSjJVFmpxTBr+WLwZ/ebvYIOXtxOkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=YDC0U6vN; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="YDC0U6vN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57d07f07a27so922699a12.3
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jun 2024 13:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1719433104; x=1720037904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwK1TIVcZa2quDepKblugLh91hcpk5uPsbaDfQj8P3Y=;
        b=YDC0U6vNHOEV0QUJ7OfHKQMNWEEFUDhnF8sctvxsERXvt52YoTf+RjvlCYPfcDj0qH
         FFwneNW6ESqv1c5MPlEeKasEokVEb2oFKsizyqPjnD2zaRit/0YN9KSUEAOXeN1aMQwv
         f2NUIJgJlb+IURByE/k6c8XsvqsOCs0UwTQGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433104; x=1720037904;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VwK1TIVcZa2quDepKblugLh91hcpk5uPsbaDfQj8P3Y=;
        b=LDW3lyvTTyiO2eFoIJUisUhRvHPGQuKX3wuE3OYNHhfb1uZR8y1riX0z44aJGH1U2i
         xC3No5QbvN6rCH9RyYV7zjvuVlL4YJf8YLdje6hCi0InZ+GOPwtWHcvXNTd/ZfDtM83u
         e657KOYcwOvpfgKm+mG1NuIOIZHB1gLLzG5ua6KesIrzvb2R2AKyLwMxaPm/f18bqpSS
         JDjC6dsy+uMnnURq2SNUzUBr/tZtLf/2wuLpO+lCazY4SYuk90w4fdJezO7BO5Zr1FfX
         ktBj2LbpJP32Ny5NEAjNu0m92RdFqg3UsW7dWiDyiwpu4Mbddx5nRdLWHMmfU3MjyHWr
         Hr4A==
X-Forwarded-Encrypted: i=1; AJvYcCUkcWXT+wGy9L5/Um85nYXcr1NOg7LLaAsM4QxvZTKyRtfkDDA6NNVrgTEOCCZeYfAm8Vh7BkeQb9rgRCIshkwXL+Mcon1Y08JAoHOVy0n7
X-Gm-Message-State: AOJu0YwNWHpZkA47A07RRDyiwHy+gk8v4wcy9y5V09Ob4DEQMnEHyygE
	jKojhJJ3hs/iaB8JNbjlWquUbByWcAjmUIczqHEsqvBDmvA0RcXh3cZ1QIbfzQ==
X-Google-Smtp-Source: AGHT+IFkPZrAZf2Dv1I/tcG9HNqylGU3EOg+zPZYcuRIs218Pi3Cs/RkddJTLupYtqHQps+mECBsfQ==
X-Received: by 2002:a50:8d4f:0:b0:57d:10bb:b42b with SMTP id 4fb4d7f45d1cf-57d4bdcba20mr7272393a12.26.1719433103808;
        Wed, 26 Jun 2024 13:18:23 -0700 (PDT)
Received: from [10.211.55.3] (p5093ccb1.dip0.t-ipconnect.de. [80.147.204.177])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-57d30534b25sm7513702a12.68.2024.06.26.13.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 13:18:23 -0700 (PDT)
Message-ID: <a132dc0b-2b2c-41db-9d09-4676a3f88535@ieee.org>
Date: Wed, 26 Jun 2024 15:18:22 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240607-md-drivers-greybus-v1-1-31faa0b21105@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/7/24 3:56 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
> 
> Add all missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

I would drop the single quotes, but I don't feel very strongly about it.
Greg can offer a second opinion (taking the patch or not).

Acked-by: Alex Elder <elder@kernel.org>

> ---
>   drivers/greybus/core.c | 1 +
>   drivers/greybus/es2.c  | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
> index 95c09d4f3a86..c28bb973f67c 100644
> --- a/drivers/greybus/core.c
> +++ b/drivers/greybus/core.c
> @@ -375,5 +375,6 @@ static void __exit gb_exit(void)
>   	tracepoint_synchronize_unregister();
>   }
>   module_exit(gb_exit);
> +MODULE_DESCRIPTION("Greybus 'core' driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
> diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
> index 1ee78d0d90b4..db4d033925e6 100644
> --- a/drivers/greybus/es2.c
> +++ b/drivers/greybus/es2.c
> @@ -1456,5 +1456,6 @@ static struct usb_driver es2_ap_driver = {
>   
>   module_usb_driver(es2_ap_driver);
>   
> +MODULE_DESCRIPTION("Greybus 'AP' USB driver for 'ES2' controller chips");
>   MODULE_LICENSE("GPL v2");
>   MODULE_AUTHOR("Greg Kroah-Hartman <gregkh@linuxfoundation.org>");
> 
> ---
> base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
> change-id: 20240607-md-drivers-greybus-a13b64e41256
> 

