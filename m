Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1C622F0F
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Jun 2024 23:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455704; cv=none; b=PgH2TmJQ5ygE3gTeYv9yozjhWSEzh1RHH10Y2Iymf+Sr/4YK7doVnPGozBHOGFZZ6h3ORPPvK17rhlUVQhtdc1ZWd/ECA7z51GVsmuQuZzH/aAVl047mrYbEaGzqzIMN3brSPjIIs66KJbDwexvth/02JK1gfsw5/rmd9XgA1pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455704; c=relaxed/simple;
	bh=Qo4ylDWHCKBDpGUaTOGShTLPUnG4DbAeLHxJqlni0ow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGlKu+/H1M817CUg5ARYWcPLrxB6EGcmyyyF+ncjzh0xm5uj5z5oE+qbOGyVMgObRoVJF+zMpX982T87710dNTARhGqYhCmSLsKex7iDV9COlQ2c4A+7HQsSu78XnAKEUj4xY5YiLYbuBzIPK6bV+3FnSQjklNYnW5DV9dKZB3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C2ztZNZC; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C2ztZNZC"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-42137366995so28359915e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jun 2024 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455700; x=1718060500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J1iDRH/Hpo3TypBtE8AeJr13ufvedDoMcC4PukyspSI=;
        b=C2ztZNZCliIs/ZSrT0hzV+VF8GvWpLoGQ13vy/3jlPsSvoyv3EV+ltI/UobKPwcwjs
         OoV7fbEcFIuMyaq8rl0FFMVndVzGXF7dYkHyg9xECmgHcbjJp/AyP0a88Ofx8/wjxhzp
         vdQmQ7VFWqsxfwnRc0qEDb7NpvW7h3h/ECLOMgQEcDxigXHeO7CmUkaVvnS5jQhCuBym
         L/wN/kwOxF8s1/60cFZCxlqWttfLdpgqoCqDyLBjjaTJB9enP9JVhBOlrnkk78tpedKz
         t8kYMBnYQKAsE/2USsdCYW3vbYYjL8Vi4ydrr7SF2mOBl1TAsiWNoJCZRM4N934+NGUS
         91Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455700; x=1718060500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1iDRH/Hpo3TypBtE8AeJr13ufvedDoMcC4PukyspSI=;
        b=syW54wAsQ2ioqVtrUm4+HC4FZNjcZ/t37zTL99ejjt4YUxWNVTc5mNocvQX72qZ3G2
         SDODt+S2iLYOhAMQ/BU8u3hJ4GXPFhmdoUn7pTiwFxgwGFY8qq4UR1S/k+P+RpA51X7T
         6aFafUFMkoUNbIBuJnXl9byCPStHsHnTZJjL6KtLoFxkpB2KtT3UT4Pxxok9X1AyVhWc
         7G192RUwXNYrQutTesDz/BJPSrZJg0L6zl7Y1SAPoJKwmdSLsFjr8dpGIsKrC6mRrQl5
         GBnlkaepvv1P47/u5Cdrho+m7zcsDZfVMs2/zDN+e75w5yVVBK8a6o5rqZ9idmWfaX6G
         27tA==
X-Forwarded-Encrypted: i=1; AJvYcCXMqyWoVx9U4l7BavqGf8yGEMUn7EddLQHZ0i0YSI9MClHAvne9/71GwqAS4mmRqO8kmm0cB42y5U9xsWlfugKJdxdqy2edwU6Et6lUbS3S
X-Gm-Message-State: AOJu0YyilrhiyfXuvPTYzZV2zfL6J730QTyo/MWgHSFUGntt8Ly6jdAg
	8DpBX9jnyIxxHfJuJ/V5KYb+X/PELKSdHDzN57wMRfXWWg9RdL7TODP7lae7tfQ=
X-Google-Smtp-Source: AGHT+IGhXTioXRyealCIteCy2/hNRfcH/xTXI+2nFxC4USmBjCi67rMfEgRNKtv2TokNUdou6KOusQ==
X-Received: by 2002:a05:600c:5248:b0:421:4ecb:bd68 with SMTP id 5b1f17b1804b1-4214ecbbf7amr132595e9.31.1717455700327;
        Mon, 03 Jun 2024 16:01:40 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42129de0cf9sm148954215e9.13.2024.06.03.16.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 16:01:39 -0700 (PDT)
Message-ID: <aa3170c8-5bc3-44a8-a623-8558dc60e803@linaro.org>
Date: Tue, 4 Jun 2024 00:01:38 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Constify struct dec_bufsize_ops and enc_bufsize_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9bc4b28a55c42fa4a125c3e03d4c8b0f208550b4.1717313173.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2024 08:26, Christophe JAILLET wrote:
> "struct dec_bufsize_ops and "struct enc_bufsize_ops" are not modified in
> this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
>     text	   data	    bss	    dec	    hex	filename
>    12494	    822	      0	  13316	   3404	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> After:
>     text	   data	    bss	    dec	    hex	filename
>    12766	    566	      0	  13332	   3414	drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>   .../platform/qcom/venus/hfi_plat_bufs_v6.c    | 20 +++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> index f5a655973c08..6289166786ec 100644
> --- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> +++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
> @@ -1063,51 +1063,51 @@ struct enc_bufsize_ops {
>   	u32 (*persist)(void);
>   };
>   
> -static struct dec_bufsize_ops dec_h264_ops = {
> +static const struct dec_bufsize_ops dec_h264_ops = {
>   	.scratch = h264d_scratch_size,
>   	.scratch1 = h264d_scratch1_size,
>   	.persist1 = h264d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_h265_ops = {
> +static const struct dec_bufsize_ops dec_h265_ops = {
>   	.scratch = h265d_scratch_size,
>   	.scratch1 = h265d_scratch1_size,
>   	.persist1 = h265d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_vp8_ops = {
> +static const struct dec_bufsize_ops dec_vp8_ops = {
>   	.scratch = vpxd_scratch_size,
>   	.scratch1 = vp8d_scratch1_size,
>   	.persist1 = vp8d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_vp9_ops = {
> +static const struct dec_bufsize_ops dec_vp9_ops = {
>   	.scratch = vpxd_scratch_size,
>   	.scratch1 = vp9d_scratch1_size,
>   	.persist1 = vp9d_persist1_size,
>   };
>   
> -static struct dec_bufsize_ops dec_mpeg2_ops = {
> +static const struct dec_bufsize_ops dec_mpeg2_ops = {
>   	.scratch = mpeg2d_scratch_size,
>   	.scratch1 = mpeg2d_scratch1_size,
>   	.persist1 = mpeg2d_persist1_size,
>   };
>   
> -static struct enc_bufsize_ops enc_h264_ops = {
> +static const struct enc_bufsize_ops enc_h264_ops = {
>   	.scratch = h264e_scratch_size,
>   	.scratch1 = h264e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
>   	.persist = enc_persist_size,
>   };
>   
> -static struct enc_bufsize_ops enc_h265_ops = {
> +static const struct enc_bufsize_ops enc_h265_ops = {
>   	.scratch = h265e_scratch_size,
>   	.scratch1 = h265e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
>   	.persist = enc_persist_size,
>   };
>   
> -static struct enc_bufsize_ops enc_vp8_ops = {
> +static const struct enc_bufsize_ops enc_vp8_ops = {
>   	.scratch = vp8e_scratch_size,
>   	.scratch1 = vp8e_scratch1_size,
>   	.scratch2 = enc_scratch2_size,
> @@ -1186,7 +1186,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
>   	u32 codec = params->codec;
>   	u32 width = params->width, height = params->height, out_min_count;
>   	u32 out_width = params->out_width, out_height = params->out_height;
> -	struct dec_bufsize_ops *dec_ops;
> +	const struct dec_bufsize_ops *dec_ops;
>   	bool is_secondary_output = params->dec.is_secondary_output;
>   	bool is_interlaced = params->dec.is_interlaced;
>   	u32 max_mbs_per_frame = params->dec.max_mbs_per_frame;
> @@ -1260,7 +1260,7 @@ static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
>   		      struct hfi_buffer_requirements *bufreq)
>   {
>   	enum hfi_version version = params->version;
> -	struct enc_bufsize_ops *enc_ops;
> +	const struct enc_bufsize_ops *enc_ops;
>   	u32 width = params->width;
>   	u32 height = params->height;
>   	bool is_tenbit = params->enc.is_tenbit;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
