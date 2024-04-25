Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739F1E492
	for <kernel-janitors@vger.kernel.org>; Thu, 25 Apr 2024 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714021713; cv=none; b=DrguDBQiejwpT1G6DqgcTx/WMUkREs/+XZ9gzE6lrut3unba0r72QGXscZ9A7N6nxAXkscWxuBZOQPwDNvUc/yjGqCLrtp0WChTB2fvxS102+L9tdktyCngZ6gWvOerosveW0QL4fSyYfbXTxCIQvZGMHJneWVs6cuO65Fyy5sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714021713; c=relaxed/simple;
	bh=N4Ty+El9tAcjw3QBXTN044KOd3tT2Ym9s58oTkqWx9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwgMJSphCbgmpn+VCXJPaAIQLiCA2LzsIW98CPRw/5RGbhlhWcC+Ns7Ks4lSxeBbBGCzBDkMqWKgcMKMKX7f256LZPFBc3f9QutCuIG9blNxmVTP4d/oR10twsIakaLUhwZf0Rlxz+mHGuzP8qmmF3IEf5aY+Fn2rlBkd5epvOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=otpfreBf; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="otpfreBf"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1eab699fcddso2090735ad.0
        for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714021711; x=1714626511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qrmw5y3+0dGAzUFADTeqpuhqYtgOQVDO3UIxdvuDfY8=;
        b=otpfreBf0w1nb2icaPBDebv3Ur0n/ujJLJXh4Ssq3Rxdnky44X4rra0r6vKU+Vxx5I
         PoAAk30oB8tmLw9LRO5HupzJEIeCvP88ZpVlYr4Y9LtY4si0aBikZXuCBbcG2H2PKpld
         j8hg/XUbkaXhgoe9X15jPaY6y9MERgP+Q2fQ0vRbBqPw9CgpujHk8uEc9kwArQXq1SOb
         BfU4gx0h3gcLN72BOCCMrKFLLvgXt6YPt8a2wVNjga+SD/qbfCoLIE+Bpk9RHJrUEW77
         bO3cEjkeyd4QYWOIvI30MO9EMVNu6s5qkR1nNNeqMOxqZ/dmpKb/LEskc42uAXxGHCpL
         NjSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714021711; x=1714626511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrmw5y3+0dGAzUFADTeqpuhqYtgOQVDO3UIxdvuDfY8=;
        b=KUW5ylMinvfeme32wi1E5sWRS1txMLQIcdF2F1Td19RysJW419W89MpX3VS9zAhEN3
         oNSsH5ml54kollwO97S0nAeglNybMTqqzySxMy/jWn1nWLCsF7UvRkiEEjphGrZ9ch+0
         Q8ZuXiYKeplWDckBm3Hea9g+C96fbIpMtCrlffyOaQ4MKHBT7hS5zMtH8GqXG03rALta
         Y6fgVl2fmmpAW7U6+5cbyjit+NhcBgZnFJRA+AGRhDt51nSNbbKaqGIh2Kih37LpL0H2
         voccS6240Vln88ndMxMLYYEcuEnOL9KbldkMTGzMP6omHnbIJxGZOGZmpN1AcTNXBm3S
         yf1w==
X-Forwarded-Encrypted: i=1; AJvYcCVKHNO0nxQqtw0hPB0ggruofcvzo0UYHpiAGMIwM6liXeuZNUG+lf+y2QXl6X9BTWfmsUsPAmO3rYgUhfkm1KNNibMDrNNz4NxF+8YBniub
X-Gm-Message-State: AOJu0Yxw1dW4DtJxy4ZH1WKjb7Lh+qZ0DhEAhmjT+EeOUJDatQRp49NE
	BsL/wgXUewHK7JmmcZY6kCcXCk8d/fPTIhiRgGvGKsgSwOyJZzIbNtla/pX7L1A=
X-Google-Smtp-Source: AGHT+IH96vmh25j6BBEQazt7ICu3yODBTiA7HitL6kUOUPKSDrXvwY+WRBVCOtppGPgOl5/xC362JA==
X-Received: by 2002:a17:903:41cf:b0:1e3:e1e8:bb5 with SMTP id u15-20020a17090341cf00b001e3e1e80bb5mr6077593ple.28.1714021710657;
        Wed, 24 Apr 2024 22:08:30 -0700 (PDT)
Received: from localhost ([122.172.87.52])
        by smtp.gmail.com with ESMTPSA id y17-20020a17090322d100b001e5572a99c3sm12756023plg.207.2024.04.24.22.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 22:08:30 -0700 (PDT)
Date: Thu, 25 Apr 2024 10:38:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: sun50i: fix error returns in
 dt_has_supported_hw()
Message-ID: <20240425050828.iqs7cjslxvb2fzn5@vireshk-i7>
References: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bfe5703-b39b-4d98-9995-f6a7d0ea558d@moroto.mountain>

On 24-04-24, 14:40, Dan Carpenter wrote:
> The dt_has_supported_hw() function returns type bool.  That means these
> negative error codes are cast to true but the function should return
> false instead.
> 
> Fixes: fa5aec9561cf ("cpufreq: sun50i: Add support for opp_supported_hw")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied. Thanks.

-- 
viresh
