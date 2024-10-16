Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C895478E
	for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 21:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729112442; cv=none; b=te+YfPdDaPxh1p/9xS6SbZE81sTzQIb7N7CyLX6ekmXH+MX6SKax2piVxMXCs/7zS7C7SP5AO03nWWX6kwzUhqOUysllbR+Ie7AhfjouH+p84tUoQ5g7V4R1vgvh/D15buAYzmaYQeczjYSiJrhFHLYZhjumOTjIV4r/AW3wdjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729112442; c=relaxed/simple;
	bh=4t5+OjK1ZS+gJDrLrnU/uff8C+hpDMwYCYudiNig0/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6X9Gw026IYa3TeX0v+75TA82Aou99i//evFI4I4Q5+g+7O8maW8EitWYokP3s+goCZXaOed3hSge/mSVaTSZ5/iyz+6Oj5mAK4+SBZAYqhi5CaJ1JjM/cMsZWIMRXPtGPI2bvOGaOTSwKnwBRVt5nLASl24bACDXrP8N7rgyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Oe6K4plL; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Oe6K4plL"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-83aaac65f5aso7954739f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 16 Oct 2024 14:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729112439; x=1729717239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQkUyFxL6KPO58jEIgRqgtkUgZXFKeeIN5h6kSZxcRY=;
        b=Oe6K4plLWdAVvmEtOXl4JrYl3pD5Ge1iCniA3ybTHa6ArDrTcNE6yeFpgC4TlqU5Jx
         uuZ81ESMyt9gONFSslUo7DWnMtaoxQ4QanWrdk3j0+KuQut+Or53EzcruTDsMe0nXZ02
         bAoUC3yw7JMATQbqG3oW/ZNMbQBaLddXzNSZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729112439; x=1729717239;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQkUyFxL6KPO58jEIgRqgtkUgZXFKeeIN5h6kSZxcRY=;
        b=e9ZTarhWhEM6W3wwovgL79l+VR/MVefcyNj23kSpm3bInXN39SjebLHVNGSrm8aUGV
         UaLyXEem4cZOvQbsRwLNVloXnscmydl0P4dNj9Gvke8/GbY/u3sU6PMbd+fERAGMGVEA
         QsUzLYlNGpjPTZHNTjM/Jhkavc+vIxTfNKfKXmrpIhGmsr7RvKRB1/dIMgtfEgpiuIlQ
         dlT+3J7OQGXDG23/u4lhASx+oBICLqnSNTXI/imfxEAtWFboT1ofWJyDTJE3IDK60gLu
         j+ud+5RahCSdYDrA+v+3u4/MQ46RvVVsBLAdCaivu6Vhw4QSCKbnQu7pdLoqYHwWReeX
         WbRg==
X-Forwarded-Encrypted: i=1; AJvYcCV1IAivKf5NsN/00w0//LSqfnseIs/bGldoB7DqfanFdVr/cwOlTEkFgf6dc2+zCQiDGUp9k0Pz9uubFef3myA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCQvAm3w3alii42WLohvoxkdphLbdf8lf5bHcPAKvipoUu8PK
	tSq76+Z20yMdLcUZj+dDgxIwzpxE/GUPIY4xgB2pwn4X4sQ3JsxjUhwVB+Diuis=
X-Google-Smtp-Source: AGHT+IEr/mLDFSHaahfcbR6Ju6YahNPQWbFH52bUJmc8ClQuj82clhMLrKIsGaKx1CqLOFpCh6SR8A==
X-Received: by 2002:a05:6602:3f92:b0:82a:48c5:4d04 with SMTP id ca18e2360f4ac-83a64ce007amr1258719239f.6.1729112438477;
        Wed, 16 Oct 2024 14:00:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83a8b53c85asm97470939f.51.2024.10.16.14.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2024 14:00:37 -0700 (PDT)
Message-ID: <2f82fbcb-4a3c-4dfe-8852-7fc0b27c38e4@linuxfoundation.org>
Date: Wed, 16 Oct 2024 15:00:37 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] pinctrl: th1520: Dereference pointer only after
 NULL check
To: "Everest K.C." <everestkc@everestkc.com.np>, drew@pdp7.com,
 guoren@kernel.org, wefu@redhat.com, linus.walleij@linaro.org
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241016134223.4079-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241016134223.4079-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/24 07:42, Everest K.C. wrote:
> The pointer `func` is dereferenced before NULL check.
> Move the dereference after the NULL check.

Change log looks fine.

Short log that clearly says it is a fix would be better:

Fix potential null pointer defereference

> 
> This issue was reported by Coverity Scan.
> Report:
> CID 1600802: (#1 of 1): Dereference before null check
> (REVERSE_INULL)
> check_after_deref: Null-checking func suggests that it
> may be null, but it has already been dereferenced on all
> paths leading to the check.
> 
> Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
>   drivers/pinctrl/pinctrl-th1520.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 7474d8da32f9..07f8b51fb294 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -803,11 +803,13 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>   {
>   	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>   	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> -	enum th1520_muxtype muxtype = (uintptr_t)func->data;
> +	enum th1520_muxtype muxtype;
>   
>   	if (!func)
>   		return -EINVAL;
>   
> +	muxtype = (uintptr_t)func->data;
> +
>   	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
>   				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
>   				 muxtype);

Otherwise looks good to me. With the change to short log:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

