Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7401B2E83C
	for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710759438; cv=none; b=MDKLq4t7gX7sMePjeOHP5H+nAntbVHW1sExpZm00sR4/SoiZ5qLb8ECsoaiMuBCM8/XVEgSMvU4m5VwvJp+E7UeHcodzSC3YZgn0JcECeLeR/HgTO52r0uAEBWNW8Nz1J0NWzPM1c+mEuI9R/2NCcfvn2+ISxM+byCwMnE+9fII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710759438; c=relaxed/simple;
	bh=3h+E+hcgQ4vcDM0k4nAVO71XgCj8+OwE4lTWOvy8hsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7V9sCVvAONpjez1fCQGo1G9JToJA+Rc8seEYN4hIAQCQ3avq02KNOlZOUDAMMrSJtQNnY1OOC9170Ubeb5NIVC9ursr/RGcMUTLB0x59NMzBKynIsY1QPu3A+4OQmXnw/Azp8XPEZ6/wAwWLMvXM/MFrk13sa9UjglnUt7uPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xGNBF0zR; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xGNBF0zR"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-413f76fcf41so30638335e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 18 Mar 2024 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710759435; x=1711364235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMEQFRnKe/GtgVhTR33NYEWIYjxVZMpk768Ijuz317k=;
        b=xGNBF0zR5Fwu0oS6poTVpQUyv4pei3sC9K0g5Ihq+4QNvcWHwD9Ytrxl1es17beuFo
         agwAWOf3WO9SzSHn7xMY4HLUpTT1gNabQs1CB8LIPZ3ZupkUcB5qFVXHyacQmhEYjhW0
         LmZHX77hcDKi8pfUU1ppQr5WkkmgWFB6OLewQrSpNmhHC8ztBsL6uG6CVpdcxu0W0PQG
         azpDuhcuPt1G2o/nrr4nyrZKjOAEU8xaC1bBXLpFAELR4P/u/KWdgxtZHXTKF4TrEp62
         svwJ8GB0aEA2itwO7nIAfvlGm4gSYCmHMBJw4zzjf+4F42JxyCB5AFvyuBUK4bjeO6wp
         ysUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710759435; x=1711364235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMEQFRnKe/GtgVhTR33NYEWIYjxVZMpk768Ijuz317k=;
        b=dK+zVt/ObU694mn00KwAUEIHx3gf1piCfKzQrtl5ByRFDuu3EB7t9C1M6g6Zfm9g3D
         xHo8KD1GRkxgsWIjeA7c5aqvRHBQRbGtPDsZaWf13khcA+exANSWdkOspwnubZkt+KJm
         xHZYhwaVKpatUTqrX3jFfE3h4TIqR7gwLsmLTnP1DHA1OSkDOVwAo1+IVYokvRjYnRvD
         y0igILR/vcAIoKd2vp+1pPLJxIBq6cxg3SxqYmBSmxc51gxAnulO19S459ZdCaKX0TEa
         NxV6dLaZWjTx9Bhj+8H5lIfuDZnz5Vx0pAZCSLlfVDIMQfMwXkXarxPygLPSGHdKtu4K
         o8Og==
X-Forwarded-Encrypted: i=1; AJvYcCUs0sCq9t8vZXuzG8CuwN30l9AjWxxmnoyPU5k6Ve1zlhZwjyYCMJ2w+29hWAWPP6IEZeRxIAYY2e8s7JmXc22TLA3ChM0lO94ntplLUZfJ
X-Gm-Message-State: AOJu0Yyqjo+TMmHGw46blLAX8DXdTKzOjOcKobsd8BdrDtthNzBYOgh/
	qqsB/ZWaoMyvqmkrVWXIg4PuCRD+AmzpDJyeCkNhPa94j+5HtkYekDvP3lTcNPI=
X-Google-Smtp-Source: AGHT+IE29K2FxY2E1zd26b5u2He0AYwIVzgw2XE3wy4Qxd0kaljZ223UA0Jwz59ql9qOjp9el6rE8Q==
X-Received: by 2002:a5d:4e11:0:b0:33e:7404:be91 with SMTP id p17-20020a5d4e11000000b0033e7404be91mr7884838wrt.43.1710759434720;
        Mon, 18 Mar 2024 03:57:14 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id bn23-20020a056000061700b0033ec812ee0esm6824449wrb.71.2024.03.18.03.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 03:57:13 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:57:11 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Message-ID: <20240318105711.GA16260@aspen.lan>
References: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>

On Sat, Mar 16, 2024 at 12:45:27PM +0300, Dan Carpenter wrote:
> The "num_levels" variable is used to store error codes from
> device_property_count_u32() so it needs to be signed.  This doesn't
> cause an issue at runtime because devm_kcalloc() won't allocate negative
> sizes.  However, it's still worth fixing.
>
> Fixes: b54c828bdba9 ("backlight: mp3309c: Make use of device properties")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
