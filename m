Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176403159F
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UWsm1Bg1"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EE1101
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Nov 2023 08:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699374946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiblu4ip97uUBovXyyp2LXTdUMhVr/Onp/Dhl6Jr+ik=;
	b=UWsm1Bg1pyXrAfNiINWXr7dx4poOwJOqdxRvsJNTEdwDIEwWH1Ua4eKxKajuaflWMaXf1p
	ndyt8cWq2RFk6kEAgcKzCpDcPoLMEeFUZWvAdN33YT7Ue8fFy+08YKdxbAoCxI1u2YIXKt
	BUDf2/qPeGn4hOGqHHoU9/aeuOdbNWA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-Pojy8m-AML2OZVG9Df7IWQ-1; Tue, 07 Nov 2023 11:35:28 -0500
X-MC-Unique: Pojy8m-AML2OZVG9Df7IWQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-53e02a0ebfdso4408299a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Nov 2023 08:35:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699374927; x=1699979727;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiblu4ip97uUBovXyyp2LXTdUMhVr/Onp/Dhl6Jr+ik=;
        b=UD6flPLA4fgKWIHZ6geHBDcEaIj0nP6ZyMRSVPoTIJuRTF35Prciwh0oT27gqgZ4EG
         ZPw7R7U5PT/+LH4aRcmASLSEOEExmkls1056jPXKJ71qdGcjx0X1Cw349q3s+d82Iewb
         xszgDBpmdD7xYb7COuD7rstVqUy5upFIWIsMW5JRlyqF22GgxPvha5odfvHYPd4v5cVr
         bjkGjcz5GO/P5YfdXyOa44LvW+BEz1eHQvWfbza6f9jkdmT1X/Ce8WYl59Yt0m2OfwYB
         ArSt5/alC9MWZOU9zcHC6MECjngqsIs+RMS8O36lQZtMzfGNF+NohtR0Riw+c5spGsyL
         S7Eg==
X-Gm-Message-State: AOJu0YwPgSArg4aDeLL5kvAcnkc7Wii3KFt4A0xnhKslJ9U8Gfu6LKPv
	zccaOc6LPg1rVYXSoT4f3BDlxtfXNmzXqalPVPqC96Pjd6xxqKhKJTdqfjnteJE357VvjvpTn9X
	cq/l3lehCrxu9vQ6uG6aUIDgfmHga
X-Received: by 2002:a17:907:7291:b0:9b2:cf77:a105 with SMTP id dt17-20020a170907729100b009b2cf77a105mr15589054ejc.15.1699374926952;
        Tue, 07 Nov 2023 08:35:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8JsrYEEW27MiEbhdjSSOwrNJh24aPmwE/kn5KJu4CIuZCg740CWk0jYDGQcM1hSN32EW/rQ==
X-Received: by 2002:a17:907:7291:b0:9b2:cf77:a105 with SMTP id dt17-20020a170907729100b009b2cf77a105mr15589046ejc.15.1699374926647;
        Tue, 07 Nov 2023 08:35:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b? ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id p9-20020a1709066a8900b009d23e00a90esm1216102ejr.24.2023.11.07.08.35.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 08:35:26 -0800 (PST)
Message-ID: <a7ea2ea5-3014-4de1-a93c-5b667fd0246b@redhat.com>
Date: Tue, 7 Nov 2023 17:35:24 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau/gsp/r535: uninitialized variable in
 r535_gsp_acpi_mux_id()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Karol Herbst <kherbst@redhat.com>
References: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
Content-Language: en-US
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <1d864f6e-43e9-43d8-9d90-30e76c9c843b@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/23 16:18, Dan Carpenter wrote:
> The if we hit the "continue" statement on the first iteration through
> the loop then "handle_mux" needs to be set to NULL so we continue
> looping.
> 
> Fixes: 176fdcbddfd2 ("drm/nouveau/gsp/r535: add support for booting GSP-RM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch!

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

@Dave: Can't pick this patch up myself, since this should probably go into
drm/topic/nvidia-gsp.

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> index e31f9641114b..afa8e7377a76 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -1159,7 +1159,7 @@ static void
>   r535_gsp_acpi_mux_id(acpi_handle handle, u32 id, MUX_METHOD_DATA_ELEMENT *mode,
>   						 MUX_METHOD_DATA_ELEMENT *part)
>   {
> -	acpi_handle iter = NULL, handle_mux;
> +	acpi_handle iter = NULL, handle_mux = NULL;
>   	acpi_status status;
>   	unsigned long long value;
>   

