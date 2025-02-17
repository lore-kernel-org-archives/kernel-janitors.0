Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56EC15C0
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 10:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788599; cv=none; b=qEWNSfn00PNhGfEthagGrG1T6xe9cKdlNnMUu6leulakDw/XAC2mdwpy9C/TC55sIWRGMSXuo4akl73LTlAqP7Adx8YQEjddYODzJh4wkabrImdaE7VCTQjDGeanR337UpEa3jn+u/GWBmjiIpSim4yywUTy7y2aJFEc306KVWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788599; c=relaxed/simple;
	bh=4WZ48YT0MSsLinCjw+MfJuQIAoiu6CuoEfavQporznU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XY/b8UdctI3NXSMYnTgUwaw5P+N53OH8Mrgo2xEioRduQC2VvH+tt2zQ9KhEHQb2wd0hQJl6mkQDrBxXMEERY9VBgeQfkFdufOUJ0kKAQkPC/mK2pJDT120OoovUuQztKF8k/jWi2/VISyopyqoAWiBc+Si7Xd8bWCUWmAbQHWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PKlMKuYm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKlMKuYm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abadccdfe5aso448501166b.0
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 02:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739788596; x=1740393396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPeqxV3v8H4g+Vxay8XkZcl1XNuYQ+5vEQ3ndyeG8ww=;
        b=PKlMKuYmKs3l8/HBWb743ucQT0nrk65EW18AbFRaMm/2Yvvf/GVVl9rTFDQ76riigN
         yflL7bB4iHjRJ1ymlNzCEDDJRARerD5gDlgkPnQh5zUAncwUwBsIOcQvjudE73XrYBVm
         o+1oXjQZTKUNmfqga9BrlYiavoTULbKeYuKXPR4kC3EIE0jgVUsl9cC19sx3fYhiZx8T
         RcPua0EBnTzTjTq4K2BJWuoezjuWtOX6ybawHfKiDiVB5kjlsC1l7vwbP0RNBifQd2a4
         xh6OfBPsCGofeSBrShfG910bki+HI9FSm7eeDv6U8ZyeThiyj/DGEVWOUjXeQ+ArT/DO
         xZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788596; x=1740393396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPeqxV3v8H4g+Vxay8XkZcl1XNuYQ+5vEQ3ndyeG8ww=;
        b=tS4lPZLKZ+CJrd/uyt92DE8MsoyFyU7Tp2nF383vABjwRvz+JVco+z26QT26WuF2d4
         ORt9Icf31PwbWL+ZYlitRRssK2fJTw3VIOiRqmht7jOG1VNRw3qy6XIYRfgFDLL1ro9F
         5Mlvi6DmPyYp1SKQxhfTYbNUj6YrG0c2cgeMdOgQUmb3z12vGGS6DhB4uC40/DI/LPpJ
         J2dBhJAhZ0TVprm9LgBne8h43Zv3NLgwd2iJsDh+fgaV2d5cFsfgDFWxZns1Qeb9oQ+p
         oyfoWjZ0RzW+LfO93z7b07KEj/d1M6zOSE9uVPpXR4tUns33RHtHY2xnsZGTFgotHvld
         dwyQ==
X-Gm-Message-State: AOJu0YyboesGlpB5+tWV0XsorqiJvfMXzHWkhukjli50SactVonG2N9+
	fd+Vq7tRG6ECGW7e0I7skbTjbFsxjpj9f6BdW74SDbAlrakjkRwnevZ9XExQO1Alvudeiofux3o
	G
X-Gm-Gg: ASbGnctwefnSYsC3YHj27qt6p5mJsC6HtCZVmj43xuH9GHMYYYxDUVFIa4hj5ZKnaI3
	swCLOA1kyNB1lbNwGclWl7yjc2E7ec8Sdv1Mh3KNLqIaWWOhXamTySgPL99j/XDRfpQS5kyIiIh
	Mqc0ncUQt5xCNN7BFgRVlpXyckQX37LqK7po+We/d7WDCzc/3G1CTq2w0GijFdrqnVKxHpFko6a
	XXQrMsaE/BKyQ3HM5xiNB6yc023HmFdCmu3U98DQVQPLMmnmWe7Xesk+sgNY+ifD54e8/eLPwo+
	eMO6tN7Fitv7xNY/g6u+EWzq
X-Google-Smtp-Source: AGHT+IHZ274Des1ePN4oUbKhdVm0Vo5N1Xho1JI8Us9w6PhLudWtJ/YtQif5hVEJjAu8oDNIqvcsnQ==
X-Received: by 2002:a17:907:784b:b0:ab7:c6a2:7a43 with SMTP id a640c23a62f3a-abb70b7c310mr839740066b.31.1739788596142;
        Mon, 17 Feb 2025 02:36:36 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8190d15esm388729366b.16.2025.02.17.02.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:36:35 -0800 (PST)
Message-ID: <2d3b8404-81cd-44fd-905d-2e6e0b0ceab1@linaro.org>
Date: Mon, 17 Feb 2025 10:36:34 +0000
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] firmware: Exynos ACPM: Fix spelling mistake "Faile"
 -> "Failed"
To: Colin Ian King <colin.i.king@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250217091341.297401-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250217091341.297401-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/17/25 9:13 AM, Colin Ian King wrote:
> There is a spelling mistake in a dev_err_probe message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Thanks!
> ---
>  drivers/firmware/samsung/exynos-acpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
> index 1201380227e0..a85b2dbdd9f0 100644
> --- a/drivers/firmware/samsung/exynos-acpm.c
> +++ b/drivers/firmware/samsung/exynos-acpm.c
> @@ -620,7 +620,7 @@ static int acpm_probe(struct platform_device *pdev)
>  	match_data = of_device_get_match_data(dev);
>  	if (!match_data)
>  		return dev_err_probe(dev, -EINVAL,
> -				     "Faile to get match data.\n");
> +				     "Failed to get match data.\n");
>  
>  	acpm->shmem = acpm->sram_base + match_data->initdata_base;
>  	acpm->dev = dev;

