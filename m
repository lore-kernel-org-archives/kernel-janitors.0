Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1908E156220
	for <kernel-janitors@vger.kernel.org>; Mon,  2 Dec 2024 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733121145; cv=none; b=Qswz7/+6uYhLsfuJwY1rDgP3gmpBP8j/Yp6300W7Rxv+QFVH+tEE7ELnSUoghCBMcT7+lbJoExlHcnhRWN09VL4jxxPbuxSK6+2R4B/ukqUlcauTvo8EV+zuiGERhXrQQOHDKZbInpnuBdfYXy9DGuhMHiNuvyrOAjMEwKsskDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733121145; c=relaxed/simple;
	bh=QQLnYmKvGqFJ7sA2gHqV0Upd6Bo/7oU8H7gUN18PrYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUMG/4zawaPdaE2tdl58uin4csWcVWIjR2LF4unKJmgcpuaD2loqQvmj6F8GxvClji4iYksl8mbnvUXqCOxBpZ+kxrP6DE+vVX6LdPMJaAFGIZ61s0kDYeB8t8qxB2N8Cf8uKwbshDJG/87zyMW+t9nCuWm9F0s5BBqhPXD4YpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFYnVibo; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFYnVibo"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-724f74d6457so3735974b3a.0
        for <kernel-janitors@vger.kernel.org>; Sun, 01 Dec 2024 22:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733121142; x=1733725942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaAjXlMahWaPPK8kYZPf2znqjEQMRsE6lGjRgJChzrk=;
        b=rFYnViboTz63rorSBARNeVPsXGYa8+3OZUe0OflwbmEi1EtVtfRfFp8QeT0S8eHefx
         dNI6Ch0J+kjlJJDBxyhNOJPBLpC5L57iTm4motjKL2Rv9DR7V2eJH++alH3vs0gz4isK
         G6jsfenRn9LXlg2Q8qtgVEP1hZeDFX60kIr9EKtvVkfi/yI7+9KNOeNa2xNV1TH3a22b
         5j+NTabCaFh2Vap0r+vgh2x1F/20T7/kR47snLV6DfcoPT2RGnmVAbl2t/SZGfj0cGt2
         fm9pISuddgwNVNDWewMMJ9uTfNnQlzpyCUcNuflz9TyRH+wcTopIYIbmQ+lRCx9G7VS/
         ay3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733121142; x=1733725942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaAjXlMahWaPPK8kYZPf2znqjEQMRsE6lGjRgJChzrk=;
        b=UnlPpu8ANROIsd63f8rSTzhpSApI17LmNtfC2E6k4ABznj+LBTkrY+XfMFL1HyBmxC
         Qb7yJPxndb8CZw/tgIIuZTtK2AgOAGHjMcJDwqpzVFRP+wPDGwFmup72tl0LS6OErIpM
         nhLV1zmPjY7xHcbhYyewxCl6bVWC39gRDamqNYPsZrhzmbeK+7i+REZeF8Ktmss4puie
         iEvW5CaKH8Kk907x4mSSbL2DQ5gNSUAOpoojja0t+FNKNS6LtJLbgIGSKMrO3RTLRjIT
         pw/DCUBEyDVEyO8OW+myr+udIAwEXb5QlbAwuzcsqySkolHijjwO/qhox/zLHkD2EcJV
         IWNw==
X-Forwarded-Encrypted: i=1; AJvYcCXG8U2zL4li4Lo5kA5KxbvTQCi0EcuSU+elftvRRRYhMCawP60zHnZRzYsIA1ekrqCn7GsANOeQZoa3Qz+fDd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaXJQr+umQhOcMUNNygVyXm/EOfWr+rB8lyv7O0nliPtTfBa3H
	sf1a95bkaH79Hz/H32i2VgGYIBcJn4nUskw46BRQWotkkggmnyyqkpnZpHyI+P0=
X-Gm-Gg: ASbGncunj5elUB62sN+1HECXaWbPRiIBhrO8BM6cFJellC6cSwr6plcUpgBahAJ0xsR
	ZaM5eXTJz6vLQH1BS4EAIhRLqe02w9dl+AgNGy24qzapPLMDVcvWN09PEYCcaqBRZhq+CalHurM
	EzAkj1ebHUH629/UsFwceNYAx3hyagP5nlhVWH5CeNpnxHhFOWYJUa9Y690l5Vl45tSdk7tynM1
	QgtghUdoMDikb8TEeJwu7LELMEEfn4Er260rPlL3rvVIW1kuR9E
X-Google-Smtp-Source: AGHT+IGYhjUoHDCLwzmR+4DgTs9bkKuenJfFo+6JvE40VkbLu5HidScSvlyxpJil/9dg5jbAH9nNVw==
X-Received: by 2002:a17:90b:3c11:b0:2ee:b4d4:69 with SMTP id 98e67ed59e1d1-2eeb4d40232mr6275373a91.35.1733121142397;
        Sun, 01 Dec 2024 22:32:22 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee72dea03dsm4216447a91.27.2024.12.01.22.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 22:32:21 -0800 (PST)
Date: Mon, 2 Dec 2024 12:02:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] opp: core: Fix off by one in dev_pm_opp_get_bw()
Message-ID: <20241202063219.evknbyimnldqrymn@vireshk-i7>
References: <41ae307c-f6ff-49fb-a962-eb488152de71@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41ae307c-f6ff-49fb-a962-eb488152de71@stanley.mountain>

On 30-11-24, 13:07, Dan Carpenter wrote:
> The "opp->bandwidth" array has "opp->opp_table->path_count" number of
> elements.  It's allocated in _opp_allocate().  So this > needs to be >=
> to prevent an out of bounds access.
> 
> Fixes: d78653dcd8bf ("opp: core: implement dev_pm_opp_get_bw")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/opp/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index d4a0030a0228..09a1432561f6 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -121,7 +121,7 @@ unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index)
>  		return 0;
>  	}
>  
> -	if (index > opp->opp_table->path_count)
> +	if (index >= opp->opp_table->path_count)
>  		return 0;
>  
>  	if (!opp->bandwidth)

Applied. Thanks.

-- 
viresh
