Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CDF288C21
	for <kernel-janitors@vger.kernel.org>; Wed,  7 May 2025 13:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624864; cv=none; b=qtCzJ4XTs9cnGh2YMp0G/BOUFB8qPVpVPcT9aVZRmQQh7k+4UoX4xI3MhHsKUeZ+dSLPrkA1M/qNmsku0yt8oFYWWtWNOjwI7T/7eW90sOx0+4Hb45f3GzcYGlSGR5BoEXceuFHgdXQSnMaUAuylL6G6BEaR+bnbcKVTU4Munqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624864; c=relaxed/simple;
	bh=bUgRtOSGIIheBXHPUBc4u7ua3sa6xcHfao2mgrmxIH0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH3COim32pxxGGUvmBSTLZi8kW7lcaKISRbUe2zHGXn4ZUewQtxn8pUIEDAXcYYTem7nc1BNVZjcxN34HfrCjPlWEP3zh79mF26+YVZzJ0B0tnPqE4opZBDdgJhM/op64bpstZBECBWazWOkcrXWvNRXPxDVMqEobqrHZ1Whq7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PQoo9je9; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PQoo9je9"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-601b6146b9cso3405496eaf.0
        for <kernel-janitors@vger.kernel.org>; Wed, 07 May 2025 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746624861; x=1747229661; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWXvIenX/6jiZJInoxV/hkglW1/muitYRDlj1FkN0YU=;
        b=PQoo9je9h7HRk48OeHTcfmCJAR2P1HkCKHP4GQzLogl9K+TuSBlMQ+91WiHT5pcAfZ
         35g27IL2kC/QjO4LGZn5MRLtfSBpt0srFdKXiY5SpnQ6aWe1AIjS/RS3WkJKqP1aQQ3k
         Fk9f08GRdnRrXKRem1vJcm+CGXq2k+nJqUPrPxQhJGNS0MikTw//3kHptHPLQPVt0PhT
         euzDGycj18M61r1/8FOUL92oe6RAMEwO5iGmN9ZG+fUcxT4qMP9iIRnbR9oxoZMMclXl
         7L5SnRrjeXEnNUX49sCc3K1DMM8Oo5aSCp7r2Ru/Atd+4ZkN6jPSq+a+HQeZJmeCfkkl
         cJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624861; x=1747229661;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWXvIenX/6jiZJInoxV/hkglW1/muitYRDlj1FkN0YU=;
        b=LLEg/9Xc5XAqRUccVdsAbb1szhYbWAZe39vesbZzr23JBewIk7HYH8Xpqzkt/XtqcN
         Rv/UKz6rwHgiHzt7LaaD65oHVJix6pPRSs4YXlii7mkT4DateslmS5jwRIf3aQxG7CeG
         pNd+XWQo81ygQhmJJh6to0d2FhdrwuDhUD7DFCTrrGB11sFuudAmdhoi5TnzGy3msU5v
         uW+zJXRz9p5mStofJ8JfIrr87aAUmzY44A4M1Lvd4mwjiX7k92tk4Zsa3ZuPxfQHuLiz
         shXzL97jrxXghaOpXjpAUHjpTWo/bAdoaaD1+AET2NuUogTRQ1zBkk5FlBtUtlOfPjqt
         tR8A==
X-Forwarded-Encrypted: i=1; AJvYcCW9rxbMljvOGcdRy2qi0aaMm146C5CTtIf4qr9bD0yk+fwjJrH/giYNry54OATxdqsbRXlcKWuXOJnJLNdEEkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPEBuzfJUugqdmR9jtCib+RSW7b3hlOQ1S9rxwN3yzQM40vgIs
	waW8+ifFP6HNQcC2vrB+0C5gE/s1csriNIgkIkTihfQ8Fmu/WSgCNPnpRVWVlKA=
X-Gm-Gg: ASbGncsUHsRGFV36S7jxB1cqwARGnkUI59/iVfzkj1MFrBufqTv5q6/HqY/UPVEE3zh
	F7E0NZeUqiKrvHdrcP68iuTi+koCjJQ9Cz7DIE1V9KVNwYv5dzmhCKG4RZRbbiatR18Yhf/pHbC
	5tVCpEr7UizU5l6GZaLM1cOdLrxlhGk5Z5WtsZA1elAHr7qGJ/H5Fjq+dMZNed/orpWl5QlJyXG
	gQqtwpx/X9VeAUKFRAXGNpSv2sE/GdAfbSfpCfey5U51iEcNrESPlANbllmuQQskVH66hWyUzCn
	GOsYFItZZIuwjiOGEoPXgTVZcPsfv7y3iS/XuRWX9ZGjPTJGQiyn4rBdqZ+Nki2dx0Ep/17jVqp
	tYcmh97Qu0jCTDw8=
X-Google-Smtp-Source: AGHT+IFWABUyQ9KrWW43rC0EUTNGG1v3mlrsBmKhdcVlqqM3Amu1ul/RyY+1vnEhszLvdaTDyKaUhg==
X-Received: by 2002:a05:6820:1890:b0:606:293f:d2da with SMTP id 006d021491bc7-60828d850b9mr1960367eaf.8.1746624860742;
        Wed, 07 May 2025 06:34:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3356:f6f6:bf76:a32? ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7db25f5sm2786366eaf.17.2025.05.07.06.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 06:34:20 -0700 (PDT)
Message-ID: <941655e1-676f-499b-81bc-1ed8230cb486@baylibre.com>
Date: Wed, 7 May 2025 08:34:19 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] iio: chemical: mhz19b: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>, Gyeyoung Baek <gye976@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <aBtZFLFlr0slcYSi@stanley.mountain>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <aBtZFLFlr0slcYSi@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 7:59 AM, Dan Carpenter wrote:
> Return -ENOMEM if devm_iio_device_alloc() fails.  Don't return success.
> 
> Fixes: b43278d66e99 ("iio: chemical: Add support for Winsen MHZ19B CO2 sensor")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

