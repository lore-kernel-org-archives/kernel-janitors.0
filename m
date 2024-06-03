Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C72135A46
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Jun 2024 22:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455050; cv=none; b=tMHwyMRjxsYS9YTloV7VW+XZ6a2/N8jJJN7jYvVuKyBVPYONEzDKCqlmSY6qsjDjkQMYmeUl8cryKzn7kpLpl9MfplBJbkENqJHVcbUGykkEG1Fsu2gGJ4MxvOMA84jySUWs3dvWky+e8v1KwY0uCGDAtttX37ic3uww41f0DLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455050; c=relaxed/simple;
	bh=/G4Eb96J/HcqYH1j+Lw1JhubdgY6c1Wm5NsjlC2H210=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YClwK1UTcyxJiJlwoXrVbS2iim9BXrW65X7ijmYH4xu9nM75AMdjPbtQLOkvC/NVM5hsWCz/zzaOg6RPeMCoy8PTHcX5alT+LCLN38xR8S2SI/fQwByo7W1orUqTXUBtk5qd6eGv8Txc4L29q1F8bYulQ7Apyj/xGQ111kG+BSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IkYwLqjX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkYwLqjX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421140314d5so44329035e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jun 2024 15:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455046; x=1718059846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5NpBRebLDT64GS8vA9X5NfBTHmBgdaZxuPi9FdQWvDw=;
        b=IkYwLqjXh9ByNB6xzYI8tbyfIExNST4Y8S1YO8kJLOOlM+pHxC8s5FnknpNkt+eRpj
         doC7WZ74+v8n7M19AkkalUcSBpYJnNHA+BMK83RzjhIuIfVNgOlPh2N0BuRMqf+MWOFa
         eBB3xqteukaR0w0xshr4OxekifBmKiIOvvFxfQUCjcETcfCxiwWYIJ8lieDGr3kryuG0
         dMA3/nj9mVbRVOTsOgf2zuH61IS1s8J18aIQbHyumQikuK09YLXeALi3Dwu+W8ZeOGTp
         saLP/O1Pk8RY7njPo+IQmOcxjppXybBPjSglt2nwzf7ionjDsE5yFFgrCop/cWANc73C
         TkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455046; x=1718059846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5NpBRebLDT64GS8vA9X5NfBTHmBgdaZxuPi9FdQWvDw=;
        b=kgCTPPHYSO2d8B7s7houbcap2Vm6gdVnxlUr3Dz1s2da7AU1n50m6GfQgsgudG6P1g
         4I6kDvKUHJpogqOCSoy7hCrdZr7e7ATHbMQnqLQ9fOm/JWukIr3nt/ATm0rYbg1sCmEN
         SmDXQqHO761ZP0yW4cCqPpb1c1UQccMg2a+maV2hyaBSizggDsDd7O41ekSc6BtlwDL6
         bh0KiCR0ONH8vOZsFGmNS+r6L8i4C8qXxCL1I4y1JOZ5zDA5H/tbU8F7Px8nHxBTKNiP
         f7kWiS/bVsrWuZAbxptsNmqGjoSTIp9h8yPeXpGAYLrZy3P0lK5/9Ck1SEsFNXzZfyCm
         jbtA==
X-Forwarded-Encrypted: i=1; AJvYcCVNoFBYaAHE1gJmdcKcRZmHAIYbzSqwErxTgP4b/oYpmhcwskh3ydf+vnFeFskp7nsM3sGkTCVoQwrdErxlPG0JEgIIFoQ93GAj+TVxXgzf
X-Gm-Message-State: AOJu0YxOEO4awYQ3DB03t7pV2cngsbXOCWOKCdFEBbWb28KJZuwmsDEE
	sA2aDQZcckIaZhvbswo1tBIr8TNKwfZTF9AFbY0YViqOLGC/kiKCuAFTpFa46rk=
X-Google-Smtp-Source: AGHT+IFIObv1irdqsMbl7TJ12GPOe9tqvV9I9Qe2VKkVL9yVWAhpRgKq5/yy96/ZGGid6wOT2yAuhQ==
X-Received: by 2002:a05:600c:3106:b0:41a:ff7d:2473 with SMTP id 5b1f17b1804b1-4212e0469d9mr97994565e9.4.1717455045676;
        Mon, 03 Jun 2024 15:50:45 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0de3sm10028604f8f.9.2024.06.03.15.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 15:50:45 -0700 (PDT)
Message-ID: <1bcc764b-ed76-46e8-be77-9f7e4edafd69@linaro.org>
Date: Mon, 3 Jun 2024 23:50:44 +0100
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240603-md-misc-fastrpc-v1-1-6e6d73d08315@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2024 20:58, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
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
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
