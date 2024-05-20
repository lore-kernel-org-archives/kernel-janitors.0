Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E411C1BC43
	for <kernel-janitors@vger.kernel.org>; Mon, 20 May 2024 09:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716197521; cv=none; b=nJsBnk6ocHrNgLr0ps4LUZa+7RDSiUzv4g414Jzs3Eq7hqdTf6JZwoc4ukyFWYZk8Ba/dhDbPp831o1sldlv3AQCO+XyGNRhtkxlsctsYFzFfI7g9BU+PnuZIoetN/cKFcERPoX4AnmdhFDay4IB1mciKBatZu/H1wbf+Rey/6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716197521; c=relaxed/simple;
	bh=fAwbFrhZucuUROZuu6MGO86O8/hvc7iTiETnrY7aFhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GCVEeYpqZIjHUvl/TGcw5EPP7ZKiZhoZ8qdPRnYpExkXLhBvMgPGxW+2PMyu8p2o8YOXXkpNU09Vqx1sUHGhfD1Oeia3tlGh4aQufCjkZ8AvOWvRMcSU6AeD2p8uKMT4YCPlP4V5m1cP4q16+dmEz/tpR69VrFJ954roXcQXy1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mdwplcUz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mdwplcUz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ec92e355bfso78350705ad.3
        for <kernel-janitors@vger.kernel.org>; Mon, 20 May 2024 02:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716197518; x=1716802318; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXcTr17OnY8F+y7pmTPTBCYGtlM1VN1xAJVrjdqU4FQ=;
        b=mdwplcUzhjzfcshi8DefU5V6JxPFbVR29v/II0Yag5Xn0aBEQX0xTs8XE2OAJEpRrs
         vSmmYr7NxNBs8CkLQFQqnS1aylkznKnHiL/LuwTLoRlGHCjY9BGPG1VlLdEJO++cZwsS
         fYYfzm6KxtgRL80o0Ioc4nnUdVsYKjTVoMt2QeOxwT8BULP2nW4J0H4DpEzblrVJpJ6l
         BV2oZsnGknsx1s0VrLfIBxOekGntydFvHZxfLjEszKi/CwxnGRuzPr5ap1cQcj0+MLIq
         /WgxoOEW+swmatM3A9J7XxOHnd/G8gs1hppWjFY1EE633eLRPrE88jYdlTgpB83H255y
         AeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716197518; x=1716802318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXcTr17OnY8F+y7pmTPTBCYGtlM1VN1xAJVrjdqU4FQ=;
        b=ODwzd0hdcDHETcUS9/ZhsrelgQlPPig+60H7Fi+D+OOP9GG3BiAdVrGH54KoM7LwV/
         zoQWqJftb3bkdBQJdruSZWnJDiBjKU2D67Ej1XkTsZ6srN/jRqc91QXe5CpkN5w0hczl
         8lXDhyI8JVU2UeOYE8vnvL45o/PjMGia03lYc/8Y5tc8MeL4rIoaDEO7y82uF/9TjdF5
         VYX+cjvTBFDZst0GHPC+p1SXuScpl9QWgKawijcbbiBjyfISJBP5upPLgp4S2/gf8dTl
         zO67kDdGAmy+XlczAN/ioRgL7UjZAvfZ1H/IU+yMF+s6Iqw47rc3KTZrTm6BXieOBukN
         J7hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj8V1nzfsEuSllS9/eXGy+ZCObYVAgp8TOMR5JHh89WJ7vaAMzG9Ax8F4ZwbiV3yfY1Wu4N5XyfC11LqUN1jw9j+suFyeTX5tFYtRtE7+0
X-Gm-Message-State: AOJu0YzKPpTRZBReGI6M449JnU9xBTbKQwygddLPA3eB0jmY47bf472p
	muCd0p/IAsIL1x2zfxsCiLWN4fmVMik34vq6bP0W9urHgFMzqqP2HYtu2NJdWmw=
X-Google-Smtp-Source: AGHT+IGMHTUCwV4E0Ap2p7ORxGvqyBKBjNs1RXtEdI5wPX18pjSwCUiOZO84RIQPeHBKQrbbAVVGHA==
X-Received: by 2002:a17:902:c40b:b0:1e8:6614:51cc with SMTP id d9443c01a7336-1ef43d0acb6mr329578705ad.5.1716197518171;
        Mon, 20 May 2024 02:31:58 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c15d516sm199167955ad.274.2024.05.20.02.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 02:31:57 -0700 (PDT)
Date: Mon, 20 May 2024 15:01:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Yangtao Li <tiny.windzz@gmail.com>
Subject: Re: [PATCH 2/2] cpufreq: sun50i: replace of_node_put() with
 automatic cleanup handler
Message-ID: <20240520093155.bn4m7lpvkagopxve@vireshk-i7>
References: <20240520083522.vvga3aqjg4w3adkj@vireshk-i7>
 <fb6ee370-54d7-4eff-8a44-ee7cf2d13e61@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb6ee370-54d7-4eff-8a44-ee7cf2d13e61@web.de>

On 20-05-24, 11:28, Markus Elfring wrote:
> …
> > > > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > > @@ -131,14 +131,14 @@ static const struct of_device_id cpu_opp_match_list[] = {
> > > >  static bool dt_has_supported_hw(void)
> > > >  {
> > > >  	bool has_opp_supported_hw = false;
> > > > -	struct device_node *np;
> > > >  	struct device *cpu_dev;
> > > >
> > > >  	cpu_dev = get_cpu_device(0);
> > > >  	if (!cpu_dev)
> > > >  		return false;
> > > >
> > > > -	np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
> > > > +	struct device_node *np __free(device_node) =
> > > > +		dev_pm_opp_of_get_opp_desc_node(cpu_dev);
> >
> > Won't that result in build warning, mixed code and definitions now ?
> 
> I suggest to take another look at a corresponding information source.
> 
> [PATCH v3 04/57] kbuild: Drop -Wdeclaration-after-statement
> https://lore.kernel.org/all/20230612093537.693926033@infradead.org/

Ah, I wasn't aware of this one.

> See also:
> https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/Warning-Options.html#index-Wdeclaration-after-statement
> 
> 
> Would you like to stress a scope reduction for the affected local variable
> by adding any curly brackets?

No, it looks fine.

-- 
viresh
