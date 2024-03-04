Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D1261668
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709574599; cv=none; b=rZz5x7pHkLkblSe2exSGz+lCuu3BAy9oVSEU7+1Cs0k42Q6E0HdZWNM41/we4g9QHXi8cTwKSvgk7On2WwWgz+Wi2hMYwsoZFu7RvWcqFqphFNQ/P2odwTw0pyo5uHYaZJvhQxJpPMAnQxTi1vg+pT0fIOLxsMZNcHOnqmh3vgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709574599; c=relaxed/simple;
	bh=VtwakiId4faZUwyLZXPzBmmz2ssNcRrMaBHvrtoWAa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1ayCrVYklwxarGQCkbyZyzi8zAMLLJYlGACI4D14MEuW9Wx0C+WvKxg7HSgh3toGK7TUnC/arDAEen2aPPKWMogohUclY5EGGAkRM1orsn1/xO+PNAX87S0oy3obHXaVw4GZpYBjt0LBHAb11bX9ZgTlvtQW04S7PaFr1xSV/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=THVANDHY; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="THVANDHY"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-472d80cda16so69319137.0
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709574595; x=1710179395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pd2ZqD9+Nj0j4ec7ryunKzk1xgCPWEAoRbwQKMaYuE=;
        b=THVANDHYX5yiR/J5vbjr/rXCHjOuTRBc6ITAjfE/11qSRHUGApacS1a3hxl6FjhtJe
         GhjGbZbq1bGSyBsv7JvGHQVT9sCSBscAyo5G1Fbls0dZHn2wc3qRF+KPR4elOblp8Ql/
         M5f6SUvRX5YIeNWIiS453u0lvRrHYewJNIzm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709574595; x=1710179395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Pd2ZqD9+Nj0j4ec7ryunKzk1xgCPWEAoRbwQKMaYuE=;
        b=vqK/bq6o34j1l48/TBPJZKMMlkU5243W7Zd7SjJoY27jR2WjlMK1bXieFpVA2gTP+c
         Ezjn5aUNp8b7OM15zN71Uxh2o9UXoHNWvTpMjEPL9AAq6RPNTmVA/+zKeXVOLxFbW+gV
         PSRTgCO0d4bl5a76k1uFNCKRNegp53K3DWdVWrNmbAQioGA4Ep9Q/Y9eyLnwTAwnr+g6
         lbB4cVDexg7dGiXZBdMw9qt7j/f4vnZSzduXLOqNoIqpChSwUfnV4cSNuVsbGKdscGuu
         jOxpR8hE2Wyrs4FsPKU7eJXkIsPOv2B/EcisoWKdCaIeX20M4veJq570+4esmaOJwrPg
         4TwA==
X-Forwarded-Encrypted: i=1; AJvYcCVgGazbOaeKXPZcHkMK072oeKinj/cNuwMIqWawmkcen1HwsYZ2WVmU2e971vHvJLA6/BaQZCM6uZYOp5RVXH9Fn3br+gIHlHo9tmsl8sUp
X-Gm-Message-State: AOJu0Yw9S7xs72Bvr4y6K+Zi9JAOukAlVkj/vlVEKBsltqSbQMU6deiD
	5a4de8IbpamlLlA34u9xISg6Y/r719mhAdPLhT/xPdDqMmjCXtAV5Bz+HKuevw==
X-Google-Smtp-Source: AGHT+IFKl0IbUfafOj5m9zaSe/S5V0PjhekyC8gN8/+VSm+peqpjggkhFvHZLy6t34sJp++enhU9+Q==
X-Received: by 2002:a67:e34e:0:b0:472:6e92:dc9 with SMTP id s14-20020a67e34e000000b004726e920dc9mr6672607vsm.4.1709574595513;
        Mon, 04 Mar 2024 09:49:55 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id kd3-20020a05622a268300b0042ef2740186sm1103686qtb.51.2024.03.04.09.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:49:55 -0800 (PST)
Message-ID: <1c77c0ef-c098-4962-909d-6bf53cdbde60@ieee.org>
Date: Mon, 4 Mar 2024 11:49:53 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fix get_channel_from_mode() failure
 path
Content-Language: en-US
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
 <m3sf16tky7.fsf@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <m3sf16tky7.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/24 3:17 AM, Rui Miguel Silva wrote:
> Hi Dan,
> once again thanks for the patch.
> 
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
>> The get_channel_from_mode() function is supposed to return the channel
>> which matches the mode.  But it has a bug where if it doesn't find a
>> matching channel then it returns the last channel.  It should return
>> NULL instead.
>>
>> Also remove an unnecessary NULL check on "channel".
>>
>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Cheers,
>    Rui
> 
>> ---
>>   drivers/staging/greybus/light.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index d62f97249aca..a5c2fe963866 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>>   static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>>   						u32 mode)
>>   {
>> -	struct gb_channel *channel = NULL;
>> +	struct gb_channel *channel;
>>   	int i;
>>   
>>   	for (i = 0; i < light->channels_count; i++) {
>>   		channel = &light->channels[i];
>> -		if (channel && channel->mode == mode)
>> -			break;
>> +		if (channel->mode == mode)
>> +			return channel;
>>   	}
>> -	return channel;
>> +	return NULL;
>>   }
>>   
>>   static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
>> -- 
>> 2.43.0

