Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC3E16436
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709538691; cv=none; b=WREJFBTOljxuGQadvORGL7ytbiKTclyZKJR312zO4WCPCLu/e7bC3RGXKpkDl59nN2EakpiHXWLVZTkmSqL7UoICNdcuqQkGeGl2xqdLCQA617QkKpV9eRD23eOahbyoCjbwyZNjc5iQp3wqfMsRN7uR15Xp5DeTGK0aDLoAmn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709538691; c=relaxed/simple;
	bh=owFBBvSyol5Quh62N2HJFLrQ+Rxow5j0Z9jnmALctYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FTfCfTDuqmLbHsopss4KWavoat5Au0lljs/2y8tkRY7M+FOqPcEDmtAdBscadVIwAobnSo/J3XMQ+AujWqKqMiT8QlX/Kr31hOSVjd9wD7GzrY26PJ6QrDEaB30afFY4d+dzqGb55HJYaHGnJDBRMUn2ok26TfiYV5HseSLfnLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WDTRsunw; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WDTRsunw"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d2ab9c5e83so40595871fa.2
        for <kernel-janitors@vger.kernel.org>; Sun, 03 Mar 2024 23:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709538688; x=1710143488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HWvU3Y40gzx94WbLTxYgWZzKcXstQArKnjMG7cs8mWk=;
        b=WDTRsunwPfgmt0sAk8E/8rZWvSTZzJ+/GFNiPjtRj660JluNWT+JElndh43EOv2YzJ
         9kVNOKQMy+j2DYLmlHJzzps7uz7HD5yOOq84Ov8WsimQps5YoB8mWPvDrbrNVOOlq4i6
         y918SR9DZtmJRqijMJwuqIMrdU4bVJDph4C9WajbA9U/UdARH1ZvMFyNnx5h5OE++gMe
         3FfejdJP3gC1GIJLPNdiMsUi3uo42wPjdYuJVvQKwZLCpnG5SGjZyNTL4z9EnfOUlMdG
         Sm+AfdocmBbVLebljWTeNLlMZZYgDERhGyqpBCjyr/hc14ye/dk34mDp4ZZEKo8Ndb/H
         VzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709538688; x=1710143488;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWvU3Y40gzx94WbLTxYgWZzKcXstQArKnjMG7cs8mWk=;
        b=OQq9xS9FvKdgsgsMc2p9gYoG22z9/nfgMO/Tyls+cVt/V7hm4PE7T0s0+HwUVvTRnB
         KcX0hT/9rsjBvzT22h0VE8wEIjtv4ljPI0/imhce1nc/HKaAfsRswlGj/deTWqRqHLn6
         St9uG/fnEaDMvzCdcNEXQK2XoprBmt+d9uphTMker2hCJFyDPF2EPh8HvJ0feGwqa5V6
         9R0qU5cno3q3xvc4/pa6ppF/0gmLGzA5reCbYykrhmjjdUyfxR8M+FJKW4wJRZ+1lM2N
         Xt8R6a17t5GLg4O856GB5Y1oUH+Pu55wJZ4ckN+1vPjdlu5RV0uVCG/n7nB1f2MDPPNg
         6JSw==
X-Forwarded-Encrypted: i=1; AJvYcCWOz5AJkH1yxSqmHnwZJ1sdTWDUBai/I0O0gYob+LgLgRvO9dMx2ZabDjgWxWS6pe1mNHIiDt5zK9TzNYbLu04dVtHp2mehIbO5TksVsXoB
X-Gm-Message-State: AOJu0YyPWGtaINvX8K3UopCaa2A5e+MtO77c8TgpsIcGHAxjHkwrilnc
	coK/6skSromdxTu7uw0Zd0E1lj+uE8OrXmjQPtGROdCwawkjVx0gLFHr/6GeaXs=
X-Google-Smtp-Source: AGHT+IEUICwfJIiBbierTI0MhAjTfQX5+cl2OonSg/acMJtoHZl/Brk4/Jj3JhOx9JLBQPKMiSjqWg==
X-Received: by 2002:ac2:5e35:0:b0:513:2347:4b57 with SMTP id o21-20020ac25e35000000b0051323474b57mr4460752lfg.66.1709538688355;
        Sun, 03 Mar 2024 23:51:28 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.35])
        by smtp.gmail.com with ESMTPSA id g3-20020adfe403000000b0033af3a43e91sm11481037wrm.46.2024.03.03.23.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 23:51:27 -0800 (PST)
Message-ID: <713393d5-13ef-4891-bf7c-d835edacef8a@linaro.org>
Date: Mon, 4 Mar 2024 07:51:26 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: spi-nor: core: correct type of i to be signed
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Pratyush Yadav <pratyush@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Cc: kernel@collabora.com, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240301144517.2811370-1-usama.anjum@collabora.com>
 <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CZII7JH72OWF.1IAQO5VJCBZX3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/1/24 15:04, Michael Walle wrote:
> Hi,
> 
> On Fri Mar 1, 2024 at 3:45 PM CET, Muhammad Usama Anjum wrote:
>> The i should be signed to find out the end of the loop. Otherwise,
>> i >= 0 is always true and loop becomes infinite.
>>
>> Fixes: 6a9eda34418f ("mtd: spi-nor: core: set mtd->eraseregions for non-uniform erase map")
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 65b32ea59afc6..46bc45b80883f 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -3373,7 +3373,7 @@ static u32
>>  spi_nor_get_region_erasesize(const struct spi_nor_erase_region *region,
>>  			     const struct spi_nor_erase_type *erase_type)
>>  {
>> -	u8 i;
>> +	s8 i;
> 
> Can we just have an "int" here. So we don't shoot ourselves in the

Muhammad, do you care to resubmit using int? Would be better indeed.

> foot again. I'm really no friend of these kind of micro
> optimizations, it should have been int in the first place IMHO.
> 
> -michael
> 
>>  
>>  	if (region->overlaid)
>>  		return region->size;
> 
