Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC91F80C2
	for <kernel-janitors@vger.kernel.org>; Wed, 13 Nov 2024 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731492828; cv=none; b=W+XpCaQGP04Z9Uwils7UhzG1h+w+xyUL6yQwOcSYmPYV6tFG0Ny2i54TVFIvNifEMNXTWwCyPzLW3sXOblCJ9z2tls38IsQw9cXZXfaJ6rjxgr8G8yVqp//N0Rnm+Bw70WAEFTO9bqUAP/+ScxQKYo1spSgZ1fNoVTuy2fmRKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731492828; c=relaxed/simple;
	bh=KplYF0ansujd5YsyZtJDw7TTRhQgR20w6+Fb+RK4+lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tILKPXV/J5aKh6g2BswKFVhcHT+ItmVrdJ2un1zaDcdzbxjiVFsOwBQUa3eSPu2idnFO0vyvyOQ4wVQxunLB5x4TexXsiI4xO424fx077VPDBBh1ewtXKvKq3erCZ3RwIIbhqwFIhFdyDNs+qceU9JpbLdUeXX/IgP6hjJ7zqf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EancCuFm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EancCuFm"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d49a7207cso4537282f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 13 Nov 2024 02:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731492824; x=1732097624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=29r3GUvbzZw8w4aPc5tnOj0HcCOWENCLL4KD5K0a91E=;
        b=EancCuFmqoKMiubw7Gin3PgNH1lJCfm3GJV1nFrzzulAdHw7G0oF8NyPiSAR+KARo9
         Hp0iHNp90PiD8t717ASpp04T7h/yni5725kqDUwIDkPTUrAGie/afmDOHYBITcBzBixv
         APZX/mrCg4UCudjJ6/B6L8WNdTMhKBTHlE1LIDsnS5NfVQnQOtEl0h3dz0K5aEp0SntO
         uoSEJ8XZ8obPaH8Scq3H0tmUMgFpdNk97+BoU4Zf80DEgshflIylOYo9oe84e5UYgF4X
         rpKamnuwAICog4sQpjqxDujgI9WsUkw79Ex3TAhXqAjnXjQ1hVdxCJha73Jsas+xZrTa
         rkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731492824; x=1732097624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29r3GUvbzZw8w4aPc5tnOj0HcCOWENCLL4KD5K0a91E=;
        b=kJc/ZEPmssx9uxN8RavpGqf7F7ET6ww0dvyAsMWWEqRy/7RUF4NVNR4lGFKY7nHF2c
         ArV/tY3p8Ar0j88RDsU/G8HT1zPK7Y1Lf7RqMQVXXHR1Zm0s6vnxH9HGPFfYLB3humTc
         9H5RLDwtVGk6wC3R7z4K4TlC/yoJQK+20m28F6ztRVbeuPhDDwAga1RPYlb/TBugIA33
         ssdOQCxiLMwtKeGfDkn0qyqGY5kwEknwCghiZo+5DHYsm9bh33Yy4pK9fz1nNHrVJTWA
         CPrMqo2aLpBtrcClxa3JCey/ulkfcvM9jQHBxUIU5nFPUriy0QvWiuAzvihLM7MCu2LH
         bCRw==
X-Forwarded-Encrypted: i=1; AJvYcCWr1Th9cFUtuXhrDEtWDGNC9gzkReoxiGZM8EHGUa+LfCqJYtbB5T6Bf7Xtb9uzbFoCX8WeNFUfnG5z7C/U4jg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxP94GPkT9PVCT6bgL/K7QqPRyPztIHT3qfU0wEoJ0Cuoe6CV82
	Tz6UFB2qLD9PeRMjvw0ZwWK8Aq/8Djf4+aAlp4JJ5SYCzsBPCQ11WiGRQJqMnxQ=
X-Google-Smtp-Source: AGHT+IH2BH3MALMB+E+XITlkb+0lyVpVuMJIDJUUSnd3RYPMU6chFRG2glEc9VGrAjVDTMO03oJKpw==
X-Received: by 2002:a05:6000:210e:b0:382:424:9520 with SMTP id ffacd0b85a97d-382042496a7mr6550276f8f.49.1731492823996;
        Wed, 13 Nov 2024 02:13:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed970d10sm17689789f8f.20.2024.11.13.02.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 02:13:43 -0800 (PST)
Date: Wed, 13 Nov 2024 13:13:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/amd/amdgpu: Fix spelling mistake "versoin" ->
 "version"
Message-ID: <dceebb5d-9cc6-40ec-b1b4-6ae40cba45fe@stanley.mountain>
References: <20241113095349.1161044-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113095349.1161044-1-colin.i.king@gmail.com>

On Wed, Nov 13, 2024 at 09:53:49AM +0000, Colin Ian King wrote:
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mes_v11_0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> index 9c905b9e9376..feecd099cf86 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mes_v11_0.c
> @@ -646,7 +646,7 @@ static int mes_v11_0_misc_op(struct amdgpu_mes *mes,
>  		break;
>  	case MES_MISC_OP_CHANGE_CONFIG:
>  		if ((mes->adev->mes.sched_version & AMDGPU_MES_VERSION_MASK) < 0x63) {
> -			dev_err(mes->adev->dev, "MES FW versoin must be larger than 0x63 to support limit single process feature.\n");
> +			dev_err(mes->adev->dev, "MES FW version must be larger than 0x63 to support limit single process feature.\n");

What does "to support limit single process feature" mean?

regards,
dan carpenter

