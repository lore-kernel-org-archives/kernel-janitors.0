Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D98364D7
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Jan 2024 23:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964671; cv=none; b=Uk9ZzlmFIPdv6XTlSVQpk6UtGSZgwT3JZYz96lkrmeQvhnZiDzVLFO2nOO5ggV6PyTTX7RWoG+XMBZ2juILd2uBozPUmm+bWGifq1A0JRDVODF0sVFrcOOm1WUv6X7V1ChHYvFaJ5wShRxEA3dHgAllMlMMd5/7FqT9W0P3NoaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964671; c=relaxed/simple;
	bh=DftyMU53+ApjRX/K58RTxmz1DDZhYiUsMFEdT0jdEYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDP6gxEdi0fNzO8pRQYggoIgyYXAXwxg070JckO7MU9IyV1uQU/DacyTdc51X0cWQQqR/wThra7Th6f5K/xaM2GVAvSHV9xuCGS8FlonIFDISyLQKZ1rRq45S9hkceUfMA4deZR53dfbuEhwzrjWU5o8ShhyO3WkN2cL3Y/uzIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GYrB/epG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GYrB/epG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705964668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7c3FgscPu0lXJFm3GTXyVD6XcnpcGhNdTIze30CTggI=;
	b=GYrB/epGPdEDDORJ9eq/thNRIr2OB+pECdR0KORkAh4SJX6seMGoFmDC1Bf1u3h0W1HNFI
	herYPRxBR4QJyJGLBHbKVeRrnDRv6z0tiKV5zLRaDVu9qALibLGlKXTI5vo3JFInhd/JGe
	Ykc1ePF3ttD3zv2DOml59rdZ1XUyZ94=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-q-4pcP4IMiyGYsRiw4vDZQ-1; Mon, 22 Jan 2024 18:04:26 -0500
X-MC-Unique: q-4pcP4IMiyGYsRiw4vDZQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40e5ebf58fbso15681575e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Jan 2024 15:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964665; x=1706569465;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7c3FgscPu0lXJFm3GTXyVD6XcnpcGhNdTIze30CTggI=;
        b=en6luRrUDLEic/+gYIS+TI5krQh8Tu3XCWmyp9uA7GfsWvBY/FCkcxm4eqkhOuMj1M
         0z8KV4d4PO4DjP0fvVZuCD5qCHQ9W3dRMMq9Nok3peZ03RWV5QR7In5C599OlPM6vV8v
         +f9Gz1oauVTgmRHrqDnSDujrwIY6+EjIklbQ2i3CB+XpC9jwj/l7CSOD+X1Ay2cq4gD7
         n8ovGj353anHVohtZdCaErnMvPdOHPwKLLq7FG8mXcE5NjPS6bUGL29ggwm/xw5aFx2/
         RGqsiFoN14kqNLLDwT+PpJIMfjDH+YG4HRypNdH3WZlhFRNDYHYiAiOHPwj3R0eI1SVk
         8QCg==
X-Gm-Message-State: AOJu0YxG19bTual287ca9bRyXqiZrEZe+bxWS3TARm1L0FJOWSsmzp4g
	Iwr03RdNE0gOIOdfTQUTsMJDbecWKLhetdVrIC49y1Wt26Lzx6O5uH/q7jXxfx9pLjX8XrzG6Of
	WW1J56B5IfkqspkVCfUYaCsM7V7THb009WmH5VIvD+zGinxinArNFGtgo76uYrAgGPw==
X-Received: by 2002:a05:600c:19d0:b0:40e:47f5:c74e with SMTP id u16-20020a05600c19d000b0040e47f5c74emr2213229wmq.23.1705964665582;
        Mon, 22 Jan 2024 15:04:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8352cOmaMtQLEHn07VgcDYdo9jNcXTeLbFnRyNs5Xa66msABsScIDJEFKORTq82yXMRla/w==
X-Received: by 2002:a05:600c:19d0:b0:40e:47f5:c74e with SMTP id u16-20020a05600c19d000b0040e47f5c74emr2213221wmq.23.1705964665204;
        Mon, 22 Jan 2024 15:04:25 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id j8-20020a05600c190800b0040d7b340e07sm40645479wmq.45.2024.01.22.15.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 15:04:24 -0800 (PST)
Message-ID: <bdc7e401-a676-4040-9138-8dc5cf35bd05@redhat.com>
Date: Tue, 23 Jan 2024 00:04:23 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/fifo/gk104: remove redundant variable
 ret
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Colin Ian King <colin.i.king@gmail.com>
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
References: <20240116111609.2258675-1-colin.i.king@gmail.com>
 <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <aafe669f-b322-4f22-a48e-564e3eb3447f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/24 13:31, Dan Carpenter wrote:
> On Tue, Jan 16, 2024 at 11:16:09AM +0000, Colin Ian King wrote:
>> The variable ret is being assigned a value but it isn't being
>> read afterwards. The assignment is redundant and so ret can be
>> removed.
>>
>> Cleans up clang scan build warning:
>> warning: Although the value stored to 'ret' is used in the enclosing
>> expression, the value is never actually read from 'ret'
>> [deadcode.DeadStores]
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   drivers/gpu/drm/nouveau/nvif/fifo.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/nouveau/nvif/fifo.c b/drivers/gpu/drm/nouveau/nvif/fifo.c
>> index a463289962b2..e96de14ce87e 100644
>> --- a/drivers/gpu/drm/nouveau/nvif/fifo.c
>> +++ b/drivers/gpu/drm/nouveau/nvif/fifo.c
>> @@ -73,9 +73,9 @@ u64
>>   nvif_fifo_runlist(struct nvif_device *device, u64 engine)
>>   {
>>   	u64 runm = 0;
>> -	int ret, i;
>> +	int i;
>>   
>> -	if ((ret = nvif_fifo_runlists(device)))
>> +	if (nvif_fifo_runlists(device))
>>   		return runm;
> 
> Could we return a literal zero here?  Otherwise, I'm surprised this
> doesn't trigger a static checker warning.

Why do you think so? Conditionally, runm is used later on as well. I don't
think the checker should complain about keeping the value single source.

If you agree, want to offer your RB?

- Danilo

> 
> regards,
> dan carpenter
> 

