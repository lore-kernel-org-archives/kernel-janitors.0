Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1014600B
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Jun 2024 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717504492; cv=none; b=ac2FeOPwUB3QkylGznkxpREXZ1guxGy93zDdF7gxvKN4jo/jsVZwHes5JcVAz9PSq+bI6zln0kc7uN19xIOv0d3/VIqfbjJFCeD4lLC1jQKCpZdtYQ3F0JKEDQdYVH1ObN0L1nsJG8yepNs/HX8hInzgl4UIcXgn3MjJiLYrJX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717504492; c=relaxed/simple;
	bh=D12OKosGzyIeqTc+4pWeca5gTMNF5feXU3hrQibnKMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W4W3a+ZqdDTMQQGTUw9pXBQzEpeKmt5qSs+x6Npgoi7D5+Fm2PL1eiXqNXms9Wy0RhyebFKt3lDEW4TCVDe2nhy3SPv8Ir1hGV4MJ/XyQWwCrX+AAK/QIB5uBtT5q7gjHpPgERMdehtN5oyRCppNlNdAVYDRJ58mK6vCtu5NFt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EBmysDV9; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EBmysDV9"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52962423ed8so1038824e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jun 2024 05:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717504488; x=1718109288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tiCJzW0mABhhqOX0xPBmtvojGJknZUCeql9nyaZxqZo=;
        b=EBmysDV91P1oNLddtce2x3XQgSi5dWWBzLNYkElqo27PVedG4Vxs94kYb2rC9b/dRE
         n8GXEAnvVcmbHBXOqVWqmf/CCoCZ7Y4jGI1Sr5+3FqzNkhOHF6azvSO848Pso3J8IxcA
         4PJ7qrKsxZnbkcrgussNxR70+OGcD8EcPqFjnXfx8IWzet5N5lGIrhIZDeSeVebYLBIl
         t6O8n6oBYaAAUH0utbGrz45PSl8D7k3pBtBG778jJCpa7uiOhj413ufDIMBB2BtpMuKM
         HbFjWq2M8AOS38iwfl09Um7CTrE0r5A89t/OoQtf4pQ4I52vkeBazTyMwwX4LhNKfSub
         Gdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717504488; x=1718109288;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tiCJzW0mABhhqOX0xPBmtvojGJknZUCeql9nyaZxqZo=;
        b=jduETMFyzwYzdydiQryfPTOhvZHAwJqqjZdsgUxxU0S5PntrvKY/3YZqmJUtqiNGvo
         HEsWRXIu/qMiSLjAtgG/5HztuUfBJtF+IsAXoK4Aa0EZkOWjImCrXDYTkV4TTEbolMI1
         qPIPP8VpoViapfVC8dmfUtHG66f+eNofUU89oqQwlQzA5ixpLXesFFk79uUldq17cpmv
         jXWcyLOXFoHnNtKi7+aAGPYeUULR49NoOLJHcB1zxtOSBSkeFvXNSfsVi+UrlZ+89fYJ
         M1FCkJy04Wq7pNezdwOlXfTngu5GJWx9irk0uzBEhs/zSLonWyOzb6BUbAt3Bc2uzPEr
         jdWA==
X-Forwarded-Encrypted: i=1; AJvYcCXEJRHgvFujqTpzo0YKGMMmyusO+ABCAe6SgXQ5AnU5fG3HjkjeEXlTYZNCrOGg6e863osnlJneoKeLv+CTLAUSUgOQXws+KHfai/8N29U+
X-Gm-Message-State: AOJu0Yz4DRHBoTLSpe2OJdS8L7AqKGyUh/b0uEGsnxbZ1RM5GNq/1BV9
	44sQWHTwrOm53GaCsSMLmN2dbpc21RMogOJo+NTwRa1Gv+4utrC4/uiH05WMfSU=
X-Google-Smtp-Source: AGHT+IFMlnLrkbtlCj/co4zLXjzRgVcjYZ1SkibwhwTsqzQ4YEGr3GUwA7ZNAwAXPr7PlXbkEBi8Aw==
X-Received: by 2002:a05:6512:3b25:b0:529:ac49:45d1 with SMTP id 2adb3069b0e04-52b896f1c02mr10925107e87.66.1717504488428;
        Tue, 04 Jun 2024 05:34:48 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::8090? ([2a02:8109:aa0d:be00::8090])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a86a6a5d3sm609356a12.65.2024.06.04.05.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 05:34:48 -0700 (PDT)
Message-ID: <b49e8615-9230-450b-acf2-c2ccff4d9201@linaro.org>
Date: Tue, 4 Jun 2024 14:34:46 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, kernel-janitors@vger.kernel.org
References: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2024 21:58, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Reviewed-by; Caleb Connolly <caleb.connolly@linaro.org>
> ---
>   drivers/misc/fastrpc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4c67e2c5a82e..e040cb5470c4 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2478,5 +2478,6 @@ static void fastrpc_exit(void)
>   }
>   module_exit(fastrpc_exit);
>   
> +MODULE_DESCRIPTION("Qualcomm FastRPC");
>   MODULE_LICENSE("GPL v2");
>   MODULE_IMPORT_NS(DMA_BUF);
> 
> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240603-md-misc-fastrpc-b644f497e68e
> 
> 

-- 
// Caleb (they/them)
