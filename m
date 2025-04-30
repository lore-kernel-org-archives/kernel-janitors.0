Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3392DC768
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002822; cv=none; b=cXQHigNp+WqFfxrTvupCMR0Is7JeQfXt5eEZijXOh3ybjBFvwmJUAxNvJ6Yz8b8rXu2m723F4XjHXiqQ56uuqF3wseNrX0dwTa7HEA23HN9ihbtNqapOqSZd2hBKvffh5Vcxii5i5sRPLRb8BNhu8lWN5RfpggcevUVdfgmV8bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002822; c=relaxed/simple;
	bh=Y9EbBv9uhTQU/4WYy7VxL5xhYLllbFHdTeX3Z/LCSbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6yCyRodOO/DeD3/Fx8wXDrsUiokeNFq/AuB9CRn8JvxvHnDe9bqbedAEqcG55uM3NhHOAg6VTB8w8QgbBNJ7w3TyovPZ+Lff4BVzgebE61mZhF7cb/zZuSqzvV2vCtTdZzWI74wD589YFip7gmCERkPK4mkY2Ld2TTkyg8OXhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8fxuge+; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8fxuge+"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b07d607dc83so6194440a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746002820; x=1746607620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps/GlO1XvNY/W7BO10G7AD+oWxCe2mK1nHWx1SJsW+4=;
        b=z8fxuge+hR2OVuksWIz7AdhAMDMc9PyK93b7VA4uTYAQ2D5gL6SaoaoK8NnCutElXT
         cd+Gu4ofvdGXSUOXXXhyCsNIvMZ+8oa4NCRtwBxG1hDMWBov1VaDO32gRGeVfdvGAJS6
         rNJLy76dkqS/Ms+Kug+U+06OxPmuDlQcEWJMHSiG8P4ZmnDGQ5KKZdSVbwIDbS5xsvoB
         M0h9ho5EgMS2vmpp7OgQ1GgJKcyp2NMCDUIxPjCFdEfiVhCOkWH3NhlbmfUHIW8YHiCf
         imRFfXRWkRdobA9lM7ac5Rq1aigs7yFLYqHzwSmWjiNa9tGT0Q6sCHjFxAcpyuEQ9Uxf
         qjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002820; x=1746607620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps/GlO1XvNY/W7BO10G7AD+oWxCe2mK1nHWx1SJsW+4=;
        b=Jnc8vsh0dFKs2bHBY5ycPWXZPD3o2Kaf2IZPP8uOwtWxTBOCb/rIrtA5zFpXmYLE+d
         X9/PVbYo3LR96Ru64JG/Fj6Aa5xee8wuNLKN/AC2dgmNl/6ZGum87C+IVS2TIEQ2Xeza
         ukes+INkkcVcKlEArtKDZX1vvsPFczr50Ycc2A8CU05JxuSAVtENflMwFViYtGs8bQkg
         dtNPv9Arr22kaKHkPB/2QF4QqZMBw3YuNGCyTRTItOuR446zF7mwdyLVsfYWwXV0KlLa
         krskOpTK/Q0Mz6cJH8aJzMAw6g/ht+vmiODNM8ccIpjSpmDK411b7d7WsbTcgrv3D8sG
         EBYg==
X-Forwarded-Encrypted: i=1; AJvYcCUEW8RvgVnC6dCPhPHfsKav5U76Q75We06SNSYTUouHKHBrftSF8l7LbG2sqfGBdBkKWzjKFKqvEx8e57VgFlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjsjhOSVY1bkW5oL/0MEVuyaObRdgEsR+BsVt4rvEizeMzvCTk
	b9GXpv5RtRHBjSPKsK1Sa2P9ujDgZk3ex6ip3CFf4jDgaHy4sj5bBBsrg0Un6T0=
X-Gm-Gg: ASbGncv7xg5DnmQYGWv1A/8UBc82Kz498g4CF1UGWKR+b+dmYt+9esww8I6Ifu7lt0R
	kU8BG6G917OQWRe+8vxOHQhmyiREubrKTFl1EAlp0rBfq0OrcOAG+RT07jNkZ26m8piyDfgqhB6
	Ex55pcoVb6CImM5CYi61l7Jk/DjXXJ7hcCgzttH6UKzaMhHExtBFMBJ7DYSL4w6wdyGCcNmzwLe
	qNlpJcZ3uMMXkw//kqwBEukv0hycK6KGBx94L76dmkAnyiEGW5+nXYjgshzOO9jLVmkjD9yBB1P
	2UHLTDR/B9bduaIL/L1m+Wn+rt99J5oEBSuqgbOuIA==
X-Google-Smtp-Source: AGHT+IE71Ft93uGd7KPOG74PkFqMkkrdRnPcFWUsK9xk65jelbG+5UbR6p6ZpkO97gGUVEbhaAbNzg==
X-Received: by 2002:a17:90b:2747:b0:308:5273:4dee with SMTP id 98e67ed59e1d1-30a3330d535mr3768179a91.15.1746002819741;
        Wed, 30 Apr 2025 01:46:59 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349fff9bsm1023758a91.18.2025.04.30.01.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:46:59 -0700 (PDT)
Date: Wed, 30 Apr 2025 14:16:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] OPP: core: Fix loop in dev_pm_opp_sync_regulators()
Message-ID: <20250430084656.otga5l6nv3u5frug@vireshk-i7>
References: <aBHaOOE8xHTsMap2@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHaOOE8xHTsMap2@stanley.mountain>

On 30-04-25, 11:07, Dan Carpenter wrote:
> We accidentally deleted the if statement in this loop during a cleanup.
> Add it back.
> 
> Fixes: 5330d0dab736 ("OPP: Define and use scope-based cleanup helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/opp/core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index fc9874946453..f56ddae35ef2 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -2889,7 +2889,7 @@ int dev_pm_opp_sync_regulators(struct device *dev)
>  {
>  	struct opp_table *opp_table __free(put_opp_table);
>  	struct regulator *reg;
> -	int i;
> +	int i, ret;
>  
>  	/* Device may not have OPP table */
>  	opp_table = _find_opp_table(dev);
> @@ -2906,7 +2906,9 @@ int dev_pm_opp_sync_regulators(struct device *dev)
>  
>  	for (i = 0; i < opp_table->regulator_count; i++) {
>  		reg = opp_table->regulators[i];
> -		return regulator_sync_voltage(reg);
> +		ret = regulator_sync_voltage(reg);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	return 0;

Ahh, thanks for the fix Dan. I have folded this in the original patch
itself.

-- 
viresh
