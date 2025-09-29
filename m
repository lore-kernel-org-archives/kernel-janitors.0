Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04572D640A
	for <kernel-janitors@vger.kernel.org>; Mon, 29 Sep 2025 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759147524; cv=none; b=oYRVmHCAgjbXzuaEoQqlSFv3yITRX6VtN8BJ3w1ylnFF04Cn/aCFd+FiGNRUUVU0Bj2l4FOR8JXvt8P9gYodPUOPi/BeL31ap41YYe9WuGGxu+bQcr90kSp9UuS/dwrgqhH3fHvaZQ50wrso02w+kBTwS4/L2ZdekOkHUkdivyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759147524; c=relaxed/simple;
	bh=ldiblrcbvFfDOrxPbn4WD466wzZShJZJs4BBONP4YBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoLTbXCU6AyYjRU+nCSKA55Sxplsw9GLhRcTX5KoPNQkdSq2juJcL98OrZkqvRG5NC9PzxQwx8AENlHYZXCrc6LJMuYo2QVUs2rOhu8uEE491a52y8Ty7EyBra64VWCYa70ZKjP6xfzpWZZ7kjxMYWnokNFCFMv2NKLWOTEhF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gPpb4KrG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gPpb4KrG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759147521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZutH3JZ6cXi3u/o/3ou7iSrM1SHlR/4amtc2EdZE2W8=;
	b=gPpb4KrGNDqiAPllhJT2Y8gdLYZT3u6j5C5N8AKcXPETUzDvxLjeu+D+BhS1MFEkDBcNHo
	pnzuXkTFRG9mKOE9/6IL27eKvjab2/XG77cdBtBXCF7naNKhArcFNQh3goQ0E4caeJMCln
	BuQtBWa7ShDS+bGJUvgOGdBXvTF2J28=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-qs2vIxcUOwG6xkaOjMjy-g-1; Mon, 29 Sep 2025 08:05:20 -0400
X-MC-Unique: qs2vIxcUOwG6xkaOjMjy-g-1
X-Mimecast-MFC-AGG-ID: qs2vIxcUOwG6xkaOjMjy-g_1759147520
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-79a3c16b276so81007316d6.0
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Sep 2025 05:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759147520; x=1759752320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZutH3JZ6cXi3u/o/3ou7iSrM1SHlR/4amtc2EdZE2W8=;
        b=WEnWlP81VgyjKYNJI4xWxKxhN3GuJNV5Sz53kacgdRr1dW+739H1ieUVZ557pqU/Cv
         ALIdiB1fEaETGfoBt/2PRWYCjad0dEtIbjd3Ws4tuJ07mCcEhyy41nT7vgqIcZmZBMMB
         uD1sDaMVdIWj70Nt+GoYD6nVkGQtuI8aYMLUhhsQthJYbB/6vEE63V7qzDD+A8T4HXBP
         VfrAh7b20XRhHFNQ7lct0j5sxliD8Ydzk/mNNrNoxiaqET4nSVTrPkNe6xPP0l+sm+DD
         D38Oa3/Ga7J649c9TFNj81o5tFmh2p66IdouQzgzX8BWHQAVt7GWbXtaJ6MLNpUN2bXn
         uJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGzOWTeEr+louiYK13qqnf+vw4JhYpwVblIi0mDbRT7R3yJR++ghMYV4+Z7QafsRsB+lNnoZi0tnj7OT5Jf2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIj8N6m/pvqakLTUYgY6Og06RTNK8AFt9SKC2uHLjioyXynobh
	RgbEvmfKhWBPBpzo6Ww6FXUf+Ks0BUGfnO7YUSw8sp2ovVGSZfD6W5rAvazrS2e9f7cm2TR2d10
	CT5TsMUT/f5ugmf413LLr0vsGgKWm6MPreCfG79DIbaqQoVJaQYWOHfuekerq/ayg8cB48twfre
	pM4Q==
X-Gm-Gg: ASbGncuWGd6SmNnWHa7bph1OGAt85y0nm/aBn7t/tn7/bFUrhzFFCwRDHzkHtDqKTDt
	bm4Pepn9Ix8gNo3rpZLJKUvprlJEcOCevPXZj6OyaTnz/BI7R1OmDKqvdZBAfQxnYW/uHvOhDgK
	sUcqjum5X+NQOtsELK4Q85eh9hjIBOmm6yRsQchaR3y/lI1ZykSPlV/OKfDMQfhD3pK3LwbrEUn
	pMx3tNA/8xfIVqFGF93xxCe04orZo5mnFUzcDbhPXGJ93Pwn3CMtXuzGq9tX99aTWDp3DAQN8Y1
	9OA9XoyahO7hV30P1EEOIJ7QEeUlz5pHFpXiz50=
X-Received: by 2002:ad4:576d:0:b0:856:d1d4:d127 with SMTP id 6a1803df08f44-856d1d4d58amr43566766d6.4.1759147519606;
        Mon, 29 Sep 2025 05:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFevFB3o1fivXiak8+SgobFekCxZNiY6jU2QyakJir70r28nlXODtIq0u34vzJE/8ZNgsQebQ==
X-Received: by 2002:ad4:576d:0:b0:856:d1d4:d127 with SMTP id 6a1803df08f44-856d1d4d58amr43566196d6.4.1759147519117;
        Mon, 29 Sep 2025 05:05:19 -0700 (PDT)
Received: from [10.26.1.94] ([66.187.232.136])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80135b563b2sm72238876d6.14.2025.09.29.05.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 05:05:18 -0700 (PDT)
Message-ID: <b1046b7f-817e-47b5-830d-71b1f9a9b4f0@redhat.com>
Date: Mon, 29 Sep 2025 08:05:17 -0400
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] intel_th: core: fix null pointer dereference in
 intel_th_irq
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>
References: <20250825174554.925679-1-darcari@redhat.com>
 <1c96a836-122b-4f7d-a979-03a0bb6c3d4f@web.de>
Content-Language: en-US
From: David Arcari <darcari@redhat.com>
In-Reply-To: <1c96a836-122b-4f7d-a979-03a0bb6c3d4f@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Markus,

On 9/27/25 10:54 AM, Markus Elfring wrote:
> …
>> +++ b/drivers/hwtracing/intel_th/core.c
>> @@ -715,7 +715,9 @@ intel_th_subdevice_alloc(struct intel_th *th,
>>   int intel_th_output_enable(struct intel_th *th, unsigned int otype)
>>   {
>>   	struct intel_th_device *thdev;
>> -	int src = 0, dst = 0;
>> +	int src = 0, dst = 0, ret = 0;
>> +
>> +	disable_irq(th->irq);
> …
>> -	return 0;
>> +	enable_irq(th->irq);
>> +	return ret;
>>   }
> …
> 
> How do you think about to increase the application of scope-based resource management?
> https://elixir.bootlin.com/linux/v6.17-rc7/source/include/linux/interrupt.h#L239-L240

At this point, I think that Alex is the best person to handle the 
resolution of this issue.

Best,
-DA

> 
> Regards,
> Markus
> 

