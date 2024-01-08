Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE92B45C18
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jan 2024 14:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gZu3xQoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704725809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NZYr/5wbdSTN5KMNy+kx/4t5MRG0j7fZAQY8NjpcndI=;
	b=gZu3xQoA1kCd4Z1suCmKjZ45WBU1S/yQu3BGcjHlcIPs4JSqXSHNvcsxq/AD4P7sHGJYon
	jeN66Ol+tNU99FcqVatRbuaWuvfDAOk3R81QU2KacZ3IdaE0k/Ah+PsWaifSrAuohseLn2
	WvJZdcitZBxctV8N/8C7+q5ga0qdock=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-igslmd-0NEqkvu3pUDYfnQ-1; Mon, 08 Jan 2024 09:56:47 -0500
X-MC-Unique: igslmd-0NEqkvu3pUDYfnQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a28b03391c5so85049366b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jan 2024 06:56:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704725805; x=1705330605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZYr/5wbdSTN5KMNy+kx/4t5MRG0j7fZAQY8NjpcndI=;
        b=A9YG0PUvJvz1wMF1BEgxd6R4ZQSjehsKV8CSYnhLqiYv51dVfKqbfU43Yk7utSsbhA
         4QOb3uBV2sLVtQ5NHXOaCR675sFfu/mkvKy+EbVXRHyzeCVvsBXFCeD4P0FHXvy3wGpH
         1nObq4c2nq0+H9+chOy/h4srtAeR1jKBuDSXCoDX/8Aef9qiVqFBi4crW3i3kP5h3Um6
         sK6H68bYgZFnRjsDJbsB/E6w7Vu4j/8e2TcGsMEoUSd6oLvT4zCu+AVavsEs8cBCXsR5
         m9Uogk1k6MdH13U5CM7OpG2/vZsXdOVk8nBGz++UdYYSDVrUo0oclVJ5aM3T3quhCokS
         FJIg==
X-Gm-Message-State: AOJu0Yz/ZFtg6YwduanfnY2pvRBa1whauq/HxqqRfZcDzLd5Hm3RzLuL
	4l6KQRXjoCsJFkhpVshRWbn7X8NrCRwcue1atp8aFMZD5LXTk4wxoE6q63JaL7rrBH1vfidB1iK
	tnYTICZ1wkyhivzUu74M4ZoVraOhaSxvLrZyB
X-Received: by 2002:a17:906:74c1:b0:a28:cf39:bf68 with SMTP id z1-20020a17090674c100b00a28cf39bf68mr1467988ejl.115.1704725805345;
        Mon, 08 Jan 2024 06:56:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESoC/LElRzDXS+V1sKd0uJqNqNVKwSj/kxkoY2fKBTyVs7saX56ulstF6COrGNKnx/PRlTVw==
X-Received: by 2002:a17:906:74c1:b0:a28:cf39:bf68 with SMTP id z1-20020a17090674c100b00a28cf39bf68mr1467986ejl.115.1704725805097;
        Mon, 08 Jan 2024 06:56:45 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id oq3-20020a170906cc8300b00a293c6cc184sm3788783ejb.24.2024.01.08.06.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 06:56:44 -0800 (PST)
Message-ID: <f7bf65b4-c562-4d40-b02a-56c165138dd3@redhat.com>
Date: Mon, 8 Jan 2024 15:56:43 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] platform/x86: thinkpad_acpi: remove redundant
 assignment to variable i
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240106154740.55202-1-colin.i.king@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240106154740.55202-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/6/24 16:47, Colin Ian King wrote:
> The variable i is being initialized with the value 0 that is never
> read, it is being re-assigned 0 again in a for-loop statement later
> on. The initialization is redundant and can be removed.
> 
> The initialization of variable n can also be deferred after the
> sanity check on pointer n and the declaration of all the int variables
> can be combined as a final code clear-up.
> 
> Cleans up clang scan build warning:
> warning: Value stored to 'i' is never read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c4895e9bc714..7bf91cfd3e51 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6208,17 +6208,15 @@ static int thermal_get_sensor(int idx, s32 *value)
>  
>  static int thermal_get_sensors(struct ibm_thermal_sensors_struct *s)
>  {
> -	int res, i;
> -	int n;
> -
> -	n = 8;
> -	i = 0;
> +	int res, i, n;
>  
>  	if (!s)
>  		return -EINVAL;
>  
>  	if (thermal_read_mode == TPACPI_THERMAL_TPEC_16)
>  		n = 16;
> +	else
> +		n = 8;
>  
>  	for (i = 0 ; i < n; i++) {
>  		res = thermal_get_sensor(i, &s->temp[i]);

