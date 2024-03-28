Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914381386C7
	for <kernel-janitors@vger.kernel.org>; Thu, 28 Mar 2024 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711645265; cv=none; b=QDrUtSV4kKbPXDaJhvQr+q8kxijf75eqknu35FEfEOJW92WeOHiE27rfi1Tjh5JMLWEMKJkHGSXzhfUQItggCbNKUQU7dubJKPwVOuk6XYz+RNUCjNl0f1Du2lcDNMBYyTRi7m7TXW17kszUy2daqXsUuq5/jsqUQVzXmhn+NCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711645265; c=relaxed/simple;
	bh=hjX99r91SWP3e4RGhPGLXBRAcAG9BmjA0B6NhCnUjG0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0SNlXmtw1IvMnfWt0UrAR/ThUgsqYqgcea2WobyDqyb2C2bT0zVjLwXBnwAMph3tsDdBsYq8DtoYl6D/T+e4OVtZFvy0bY0p0S5EIM+BOq0U5N1CuFa0qbS9VVXyl44HTHjQkspQi6hR9s1JISqLAuYFLQ95NRO7FJvmq9/B9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N9vFuzaX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N9vFuzaX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711645260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qd6vtGEjaeTzV1f2AcS0milHcb/EgWIylwqRgm6gjBE=;
	b=N9vFuzaXUvc+mV1jJPW1Vk8GGVtMz9rabNMIdaRceGn2VdHniPkR4eQ+VQd4KO6q11vWil
	YTxM0MAgb8Vrjm3mWAIirGTIiE9XphxQ0UNb8cyOB9TDMFjRVLZkAa4aEwFOOpFz/cHikh
	QAYpJMhRaLSRndQzhqooEERz3JaV9Xk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-0xVwCdDqOcCSdY0V3Obmbg-1; Thu, 28 Mar 2024 13:00:59 -0400
X-MC-Unique: 0xVwCdDqOcCSdY0V3Obmbg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4147de378b9so5557835e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 28 Mar 2024 10:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711645257; x=1712250057;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd6vtGEjaeTzV1f2AcS0milHcb/EgWIylwqRgm6gjBE=;
        b=on9XQpQ5OCcOosvMHordYrC1KKv3+3mgKlVOg/YRZRczg8qnPWoFzhqBEjOdc95XGG
         RJ0AeQlU+R6s4DWCJWZBK1lZpX5+Bv0YdaDBFTc9Po5nCzA4Z+wydoViYF+pZYsbwJbW
         OsthbzRZJ4wY4Rgn9etNydiXNCx0iG49gTIxaL/nBOD+smcbkc/bHoXLOB22HcxqbHRz
         asXX9LZQVQP9HKBTN/o8Gd2h2cvt+41uv0yEdwRGKj5y2eud5LMQwQtRTUSN7JJRHtmQ
         2UplNI1J6U9wVYJwZMDN8oKNYm1wUYKJ+nkqpUdlKJbiXUkeFwDgs6SeXp4xybwihqnw
         pNnw==
X-Gm-Message-State: AOJu0Yy84qALThdQ/ER6TbIwULAKjISq6e8w6AOJoVSoGVeajhbKi4TO
	KhtsJ8mIXqMDZvw64hFeEVLAYmFYdNE1gtQodZX+9k0j0NCXkoTeXsO/T3/uWheXpmf+8XAPAmt
	tq56F9COEinbK2PBc0ttS1nbtOQgWUFbEp2ZySQ4zvABfUP10v23bJglwus1TC2/aaQ==
X-Received: by 2002:a05:600c:1546:b0:414:c5:8503 with SMTP id f6-20020a05600c154600b0041400c58503mr2315127wmg.38.1711645257214;
        Thu, 28 Mar 2024 10:00:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMU1YeDRsoWUWg166ruOHtocc/arSMbGoFCV9vPwHpC+elMIiA2PAku43lcB8JHeDBeeyjlg==
X-Received: by 2002:a05:600c:1546:b0:414:c5:8503 with SMTP id f6-20020a05600c154600b0041400c58503mr2315108wmg.38.1711645256913;
        Thu, 28 Mar 2024 10:00:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id n18-20020a05600c4f9200b004148c3685ffsm2893798wmq.3.2024.03.28.10.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 10:00:56 -0700 (PDT)
Message-ID: <a3eda30d-920b-4913-a207-a475d490115b@redhat.com>
Date: Thu, 28 Mar 2024 18:00:54 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/nouveau/gr/gf100: Remove second semicolon
To: Colin Ian King <colin.i.king@gmail.com>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240315090930.2429958-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240315090930.2429958-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/24 10:09, Colin Ian King wrote:
> There is a statement with two semicolons. Remove the second one, it
> is redundant.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index 986e8d547c94..060c74a80eb1 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
>   			return ret;
>   	} else {
>   		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb,
> -				      &args, sizeof(args));;
> +				      &args, sizeof(args));
>   		if (ret)
>   			return ret;
>   	}

