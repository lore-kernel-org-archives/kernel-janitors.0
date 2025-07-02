Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6AB224AF3
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Jul 2025 06:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438355; cv=none; b=WnD9UA2fv636inGrc3NAdjdfV+W9xh0ys6iwS2P11NW9s9v0CyPHO9xcpyVw4xDgB05tBz74F+Sj/PLTIANiVXLqoV/ETF5L7W8jE18zpukjYaASH3uXU5RvConJZmOZdCea509HdiumN0YGt2apf0niBns4JArBHU8xF7nS1DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438355; c=relaxed/simple;
	bh=/eoPnEunEB76YC7IbsU/tHmmFPbDK2slXP9EaWP9oms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJChe9+ZKSX+1zL74MPvC71d5kliAFbdfGPFEe+GS/LjjCT9As9/gY5xRxniBDXxCldtSAlYSaRJ67E0UPduxOtyg5Ax0JUKL8IXuyxVutZ7SIdqB4M0zrM5U2W95+OKF/eIN3rhDwHk3XOpVsewf+12uJRcl/moNHVrwN82J0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmMtyj5j; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmMtyj5j"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236377f00a1so65599575ad.3
        for <kernel-janitors@vger.kernel.org>; Tue, 01 Jul 2025 23:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751438353; x=1752043153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SW9FatXBBr9uVZr3p1oMLELHRqOke3lhi3vQmmUuOgY=;
        b=PmMtyj5j5ZoFsoC8w2h0GTszuNCycPPIkZ1IZCZltwXLSUr0zWT3p8A98VYCu0QyA4
         TbE88KJAcZEnTYkOqzxWD5SGXdvO82tdvtDNJwZq+nIi8ivt7EbOpdrdtRz7cAzhDh0h
         gAvXjgn3ohA7sw3FtkiaRtXBD1O9VDhWGzMxIWG63oxnCiGWCfb1xWyFqBhnYAfbW8yX
         92Lz0IT09KiLjcltJDfqmbB+YZj0kB/ko0J/rFxCv7hBg32YFFaq+yzU22kvmBVQzaqy
         RRtW6tkrgD0uv7sN660R5TYdtOlJaFngVSebLtll/jyxxt9G8slxsXeoyyE5zfvnW4mg
         iM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438353; x=1752043153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW9FatXBBr9uVZr3p1oMLELHRqOke3lhi3vQmmUuOgY=;
        b=Dc7eTkzW544uPVc21qpxEFvJD8eOyCTHlccspZiLx1uT5o0FPk8Xff0b7vJbHBJvhB
         2eHGuT0kGff4RSMqPe4CUKjE7e9jV6zD2qXaAQVbQIz7+le2L/MyKo6G0IhFQGceol6l
         6YWRUc6ZUEKJKEe1NHef4AQS3Wqiyx1NF6vTBQKrQSWMpzXvhCVAteL6dPqmqY5zfnco
         HOUhsgfXTR1EdVZiLZknvVBw3CYMuaOTXC/ukYE0UsUY9oNL8oFqnVTGbXC1tkUNJ8lR
         qDmm5H1XPI5LaD9mUIyWB/F+PPSaN1hK0L7z2YwIVwtCvknN6n/gPAft7k6anO2QXajQ
         KNqA==
X-Forwarded-Encrypted: i=1; AJvYcCUqbII7bfe5k9qJEKagzBfXECwBWdfI2py5lcgRgJekrpZF9o+8RRPE1kFWYfEKKEhcnf1poaGJB+kFfUoTJ7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUpkMd2KsYL0WXMBPRgs1a/Ikusbs6Wyli2ofin7AbdMqVHLuF
	kCuArE/Lc/FV+w5NQD/a2uBhEsEPIlQ89DAMz6Kl86UzHGR3vjGwmtlwnXd4QmqhKMQ=
X-Gm-Gg: ASbGnctxONuEG3duxVXpJ3ofEDXHdz4TCBu5lBYf6dhfGWBKO8wKNtfVKJLUl04yU/W
	cJbCFGiXij8Fe860qtjUmLockylad3FmzLlo+uC3+/A2oSkZNIP3oxFJ267+R/GcZ0B9lmA4UgB
	tLyLD71LhCOyh1qeDHVNhk+dYMqkWGhfEp/wLIRQP4BaV4XuM9kNb8uZ4NhzdhZ65Pr5a5RD+vv
	X9H6hVZJQynkQKm2+U3NqhmfIhTd3jcvZT8IExjn1w8ulPZAjBtUp9VtUwDi8pT39nGdKi7A6Qk
	YF0ChFpcjmB5nam/atbhW9hVFSAbOB0nD3U0GgtXo1JGJmIBWcIfVCOmKB+JFew=
X-Google-Smtp-Source: AGHT+IEyC4KmfLegb1B82Q909aH2SFqeih6Xb6CMFnbeqXshdOd8HpJJu9yHcNKFqbkSWsfoNu5s9Q==
X-Received: by 2002:a17:903:1b04:b0:234:8a4a:ada5 with SMTP id d9443c01a7336-23c6e5b5d10mr21914435ad.37.1751438352997;
        Tue, 01 Jul 2025 23:39:12 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f39bdsm128787855ad.80.2025.07.01.23.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:39:12 -0700 (PDT)
Date: Wed, 2 Jul 2025 12:09:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: armada-8k: Fix off by one in
 armada_8k_cpufreq_free_table()
Message-ID: <20250702063909.zeplodhdbvqscefm@vireshk-i7>
References: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ae149bf-5e4d-40df-b1c2-31d5ef418f05@sabinyo.mountain>

On 01-07-25, 17:30, Dan Carpenter wrote:
> The freq_tables[] array has num_possible_cpus() elements so, to avoid an
> out of bounds access, this loop should be capped at "< nb_cpus" instead
> of "<= nb_cpus".  The freq_tables[] array is allocated in
> armada_8k_cpufreq_init().
> 
> Cc: stable@vger.kernel.org
> Fixes: f525a670533d ("cpufreq: ap806: add cpufreq driver for Armada 8K")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/cpufreq/armada-8k-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh
