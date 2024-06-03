Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E325917C7C
	for <kernel-janitors@vger.kernel.org>; Mon,  3 Jun 2024 04:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717389802; cv=none; b=lsOPYumLfbM0Rx4MBtJBVC/yBnFgF9DlLwHnQ8O4BCuqq2l3Lra9rgqj22Zsa33H2JVjbdvStaX8X39zKfbr6IycJuxGLKBR/P7zNDeGKFOcaa0xyrPrMrQCHg1r4mFF99lHXdwVhGDHwLsg7r46i0VALFRf8Rbmeo7eLyzEBR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717389802; c=relaxed/simple;
	bh=HzZDgjQYuvmDJq3i4NfWqunXjEzQo7xEJGoCmHbV/5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMC/q7PDeoAWgH09sYM9fT2ca2xKoOXWz+BJz4mz+bQxaHIQLbnapSsHlc7RUTRUmzglj6Z+o9gx2QoLcOKAQ5eXZQwR2WR2OzFTspVQZROKjZLs/hw7GbhjeWbb4qrhDihKsf1qBEXvcJfFMjRFPvyiSvA4Q9V563e5DAWRN6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RyXFbgHV; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RyXFbgHV"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2c2283707b3so496485a91.0
        for <kernel-janitors@vger.kernel.org>; Sun, 02 Jun 2024 21:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717389799; x=1717994599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYCOigvbPRn1QXs7z+gV/0ewTOfNCducvc/Nnzd9dqg=;
        b=RyXFbgHVwxJ7iHwNfYHy4EomjZhBymGGFNR70KPmuZb42DcwzybOa+um7fHAJ4d3CA
         E62P3RmxxJuI1a/hLUDodfg4Wzwj6AblMC+D41ea9NxUHB59h9QXAVC64VCofEyr05RG
         hgopo4pUGvQDeSQQYZmCWZ4Yb9iRSgQN9aH/cx2ZSyYM3SFpdLmc2A+X1Vnsi4abCXkJ
         gzgfu4Yreer5FWrBnk+JErr9iK7rDpzNewJ6vDHY5Tm00ZLDBBJ75YDfaa1XKt3YuW4M
         kQByNuEQBXIfQJLYSUc06KZeooyNJddJqtJFmRLIKdB2EOtkxIVR0fD8dqDiX8GklgoD
         4hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717389799; x=1717994599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYCOigvbPRn1QXs7z+gV/0ewTOfNCducvc/Nnzd9dqg=;
        b=tVdNaGWbtniTDc0ahd58DGDSDlemxmSQN1OCh0CYDsZdxey4aA0y7gryVSSarF5dWt
         P4m9ypDtOZpN5Co47+SirYWu1utjev0xv1r9n8KZv33bxKYIAfDk5hN2CdGIHLs4UQWB
         mZIHBxXHNM0uRgr2DWGzNVWG95sVjc0/mBZGBmT2nmIjcQ3g6/RdiWmH0LlY8RryayWy
         pE7QQg4spjxLW6X9L569g87ahT9Lys2tj6beHUNQXN5TduF4Hvlx8lNQLqttoEky1N2v
         4ktdNdOoX6rvMtsWE7xMmnUN9eP/y/w2kjZIshdqd3SDnlAulI6vVGrQDp68n1XDY9GM
         WZfg==
X-Forwarded-Encrypted: i=1; AJvYcCXycwfbhs/y7VhAkjroCec1yrMyhSBpSAo7FqMZY0HwN/ToLfigIJmwRqpU8JI8hQENVL3caG58588JoKYWZI6wUtyPnh8kTU580TpyjDVF
X-Gm-Message-State: AOJu0YxPa7mq4OaGqcRRL45IQTHVk2HQBo251ALXb/3vZniAfzAYmBzr
	dl4OCrkXfNAFHYuojZ+PR9gGyurInmpI17HPujIfF8HLEu8TWCr1ICDxsV6G+K8=
X-Google-Smtp-Source: AGHT+IGICJDgYZTyQLtQrb19UNS8GlFzTTuoxROSl97QOLqPlxpWyNoDe4s7cwH3PGktOiIdZ3+6hQ==
X-Received: by 2002:a17:90b:50c6:b0:2b1:e314:a5e6 with SMTP id 98e67ed59e1d1-2c1dc56c32amr7244785a91.7.1717389799209;
        Sun, 02 Jun 2024 21:43:19 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1ac1f9208sm7241985a91.41.2024.06.02.21.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 21:43:18 -0700 (PDT)
Date: Mon, 3 Jun 2024 10:13:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: dt-platdev: add missing MODULE_DESCRIPTION()
 macro
Message-ID: <20240603044316.7psjarzpopab3pmq@vireshk-i7>
References: <20240602-md-cpufreq-dt-platdev-v1-1-63c7d91c00ba@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602-md-cpufreq-dt-platdev-v1-1-63c7d91c00ba@quicinc.com>

On 02-06-24, 15:14, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/cpufreq-dt-platdev.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index c74dd1e01e0d..cac379ba006d 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -233,4 +233,5 @@ static int __init cpufreq_dt_platdev_init(void)
>  			       sizeof(struct cpufreq_dt_platform_data)));
>  }
>  core_initcall(cpufreq_dt_platdev_init);
> +MODULE_DESCRIPTION("Generic DT based cpufreq platdev driver");
>  MODULE_LICENSE("GPL");

Applied. Thanks.

-- 
viresh
