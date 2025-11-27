Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B34337BB0
	for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259355; cv=none; b=epdKBvWPgQNzVcmf+SU9q2Kee4KA+T/2cdL4tWT+FJS6D2NMkm8rC2RbIc8htPBz6SNEmJGZDx6tMBSAeB7ohUCeNAd/dBa8EFasMY89U0G4Lm+pxRzp9xjOtoXAJYFSZmfxURXqURhLRvHa5YtcjPJi70HRY87PzQhux/GyGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259355; c=relaxed/simple;
	bh=vyTrsB1e+2MkE4MM/o0IDxBEJy6eYzaBtOBs5fod1Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gO1GFtweiIVyn5yMDpFE1yZh38Rcjc4kuAWCvRkTzcjJk0Dio8x5lV++s/Ziu9qIAHSuXDfLDOMKBkWOXYCnKvbPh/xmaQH2RTbsSz9UANK7jo8umzlhBsU9Rs78DxOEwnWTpegXeScWXOaUPhdnhH/nYZHb2pBH+8/90FCUQUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rLqpkjik; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rLqpkjik"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29555415c5fso12172825ad.1
        for <kernel-janitors@vger.kernel.org>; Thu, 27 Nov 2025 08:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764259353; x=1764864153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=rLqpkjikhHVsmYqRok5k1kdfGgUMrxgdLgwH/07nQgW6/o6/iCYg3TJJOBqBGM7vuY
         3NvH4RH5aFSD3RGC1B42bE2qzwQ2mG7QLSfICBpaNSgTKHyR6MhjX5mLMIP1C6o9j8uu
         IhdiFRi3w1ggyAFX+eotM0DxEk50gGO2KU6OZ1RAMHEKlJjJfJSP5PZ1vNbcR+xuJGuR
         sm5Ro4UuFaGvfkiJ4XBsZ98kUsOfVNb80vJwhYx5V7TQZlW+Za/S3GvuA7B/UOiYDQQx
         x4ywjS8xz4i8qIVE7g+8qU1aEzFR8WzUEhJzhTZW08ekbkPZlWl0uAHmXO2Ua26KN2+k
         jrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259353; x=1764864153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY7k8e6rh86X1KFsb+QPer9lTYgSo+le4387o1pHLfg=;
        b=sxSnk3YxXI60wmOakuvfj3ogTCIq2+H8MgNRsPcd9H1xDmDlYRCa/s7FA7qcOao+FA
         hPMdkBeH/wqTG/d/jGDA5jF8smlh0J4/7ibyncVUm++G8ggIkyeziYayhdGhKDD5Rg0g
         bQ/POMTusUiZVNGkNSp/TyGy4d9xj/GK/1w/P69OpOdNqAJBCdW4H76o/SEoWr5bOtg2
         FbCsWiGUF6XSwIO8hWIhvgpD3kLS9TjZlAnlOSRn0Hqd1im7uAMiJcXjzX3I0FdAyBPl
         y8aNrxms7N0pZyDPqjjDs4HpCxI4F7e92yrUZEc6Dc5UBeVwCWPGmn/zbeIletHLE+Yd
         MXdA==
X-Forwarded-Encrypted: i=1; AJvYcCWJaraUbNXOD9U9ibpoAiZIRljJK8aDSQo0SqBjZ5s8rF941AbtKk0y8PhTKl67mXWsUfOG4J88nZHdGD/o6HU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzoo2R6GJzFf0NhFxg/e6ti8fwdPxeQVv1rGtyZl977rrp7b5JU
	AUu26HxNiAfaFXLeAhQ1IgXnolpGHn1wOsbIKAC+otuAzdXQiMkAXXblsK6B6pNAl9o=
X-Gm-Gg: ASbGnctoGafX230sQuekNFShiZ+LpUbaLddvh7AplVQU3Kqyu37wWGWHCjspNkovn+b
	deZZ/CNr2nOrc/Tv2NN6cM4g1DEyA3S/rMWIxl557fF59GPvDX2vqHmzzK/TxNc/Kh16P88yWhH
	5BJKy9qEBtXRInJkWQDESRVhKASOsGJDyZCk1ZOrjFM5W6glPKlTmpj0pVZKDkMVdXyaqfBBM8q
	0/76NTPIEiMiZom5ZhgeTwCgC8Z9+I9m2o+0T2/UPQkGaJQWfzoJxMQ2VOOYoShUkuoR2ArG5KY
	iUgdw0dNe9utPwk99MhGAF06XE5g80fuPQuWgZ4AVWiqOWHDcGHg8R2uuotTci3JnwOKWGbykUz
	bckAW1bNdyogh0ubvtWXtjMBEMN+WPuUY+oVLwkvMgcQHxOOxeOFa76gbkZdGoBnM+PU3qJZWZL
	gtLVP19oZCHFQAFV5datieLeiL
X-Google-Smtp-Source: AGHT+IEBS49WXHa1OQkXmOSzrd/2INN0XNe3pKmNT4J9ufCzVEdO1kJQ5meC0md/PjmvEoKECkjFdA==
X-Received: by 2002:a17:903:292:b0:290:2a14:2ed5 with SMTP id d9443c01a7336-29b6c3dc29fmr271962935ad.4.1764259352803;
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9ef4:efaa:23ae:f181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce4703a9sm21523835ad.42.2025.11.27.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 08:02:32 -0800 (PST)
Date: Thu, 27 Nov 2025 09:02:29 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] remoteproc: imx_dsp_rproc: Fix NULL vs IS_ERR() bug
 in imx_dsp_rproc_add_carveout()
Message-ID: <aSh2FVTS8jGUSInR@p14s>
References: <aSf6OerBbPcxBUVt@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSf6OerBbPcxBUVt@stanley.mountain>

On Thu, Nov 27, 2025 at 10:14:01AM +0300, Dan Carpenter wrote:
> The devm_ioremap_resource_wc() function never returns NULL, it returns
> error pointers.  Update the error checking to match.
> 
> Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index be83b5f20f15..5130a35214c9 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -710,9 +710,9 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
>  			return -EINVAL;
>  
>  		cpu_addr = devm_ioremap_resource_wc(dev, &res);
> -		if (!cpu_addr) {
> +		if (IS_ERR(cpu_addr)) {
>  			dev_err(dev, "failed to map memory %pR\n", &res);
> -			return -ENOMEM;
> +			return PTR_ERR(cpu_addr);

Applied.

Thanks,
Mathieu

>  		}
>  
>  		/* Register memory region */
> -- 
> 2.51.0
> 
