Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456391422C5
	for <kernel-janitors@vger.kernel.org>; Mon,  6 May 2024 11:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714994771; cv=none; b=iE/WUbo75DaQC43XYmmhwWMMR4zUUUQGDywQowmtC0RevBx/JmiS/a9ejre4jNIShkzisRv4epqAaANWI4nWdJ5sDmn82+80AgiqSkZUWXouyjJUt37EvfKvYBm+2f9CzR/dMBkGiBlmDrICqbA/6Udf+//3x+U2vXjhL0LmljA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714994771; c=relaxed/simple;
	bh=nyIvye1mAmsLXOpkXDLUu8L+een5qozkaTlT/QXRRxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZcyp3FpPH9PIX0q3rNUEP5JHjUByqR63x9qwmDOuXJsus8+dvHlP/9wPvOsOyin44V/Zk4FaNe/Lz07Gmcqus2s/9s6YaFZ98xSbAyxgPAd845NPKv5pYuCVInY461fLi2MSmCGzQwapdBhyNsW/K2Xw4MijuRWgsT7mBUdgNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pWL82/Xa; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pWL82/Xa"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-41c7ac6f635so12039655e9.3
        for <kernel-janitors@vger.kernel.org>; Mon, 06 May 2024 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714994768; x=1715599568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nyIvye1mAmsLXOpkXDLUu8L+een5qozkaTlT/QXRRxY=;
        b=pWL82/XalcjwtDKG5w5yIONzOa2tZ6JvaCJlVjkmX2hb1euz0pqLRNlW+QvpKJiyZA
         j+RhE7I1XdMNgPI0zcHmVPAlQSbc99Zg3W6PlMG8CihAcLeDDkm85eC5rMJ56nSp9ptO
         s5lpG96TzqdOG7xx2tEdoVTOrof1JwqsjdCKL1hPATeDxdR5EKf2PvhMCY91TT+iPXEZ
         VTg7S6j7S4zAmFLtQONRMs7v80TO9Pkp0vjbuYGKOD91NRSOYID8mF6WYzVICtFXy8yR
         meF22vygBk6hPaZdcwN1naC/es1M8gjkv/jym7DOcaDWJ8RVCsqhhAwTPTMIDIK21/Yh
         SSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714994768; x=1715599568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyIvye1mAmsLXOpkXDLUu8L+een5qozkaTlT/QXRRxY=;
        b=af67hyOiAJ4fWvcS3qtdO362SHRVxTO6YeZ+ogR/Hb/t/Y39VtKlsHrajfwnaTFes3
         7oJK9U5IjB87cb5wjoZZhYeidk45bmOIUYgKdWqWhgiR2tXV+x9vLm1jvzG/Q2zNQ6Kq
         ui+N985ypnXGrY3CZwbeZuxXeckhoSSz0lmWdDCOQunRCNT5m7OZJ7/z+XeaPWVdyX70
         1t8uxcYdOmhU6GshDg5zt3N43aEX/eAhs2YZXYnOOfg63paXkGHWI/lSVHtB1y7T9z99
         Q4Dkn1fqJOUjjpWQDwKWLML5TJsjPHyQPcKiqnf+zz5R3OK7/O+1w70qjwzxGOkpsKhu
         lFgw==
X-Forwarded-Encrypted: i=1; AJvYcCUFHbjuOMJ/+GMIQWF7pkhnYhvrPZpAusYjrYsdJPp1Cm9sN7ITXBFZA2/TKuZSVyVwENRCiS6W7/qV7QKR4i+iw2Gy/vtGc6eBBBiTQsrC
X-Gm-Message-State: AOJu0Yx5veTXvXng3l5tUOCNu/LTyR/aA2/fIMEsESCJl2Zq8iPje0uy
	i2z+dDI3aNw6bgsb3bt3OEl1uHHGu0zoAL4CBUBRgY8Es1gmypU5X3tJY+Un8Ys=
X-Google-Smtp-Source: AGHT+IGCR414tDgIBuGRHSWPl4962sZegL04EWcxSJEuof3KPdT1YiHxQPEtdYB4aEFgGMKCWpBjrg==
X-Received: by 2002:a05:600c:3150:b0:419:f241:633b with SMTP id h16-20020a05600c315000b00419f241633bmr9840596wmo.8.1714994768460;
        Mon, 06 May 2024 04:26:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n15-20020a7bc5cf000000b00418176845ddsm8033022wmk.0.2024.05.06.04.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 04:26:07 -0700 (PDT)
Date: Mon, 6 May 2024 14:26:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: Amit Daniel Kachhap <amit.kachhap@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] thermal/cpufreq: increment i in
 cpufreq_get_requested_power()
Message-ID: <be825436-c310-4565-b902-13b1be930647@moroto.mountain>
References: <a7c1fe73-b40e-437c-8ccb-7b3baad04df7@moroto.mountain>
 <67159a18-3923-4345-bff8-ade49cc769ba@arm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67159a18-3923-4345-bff8-ade49cc769ba@arm.com>

On Mon, May 06, 2024 at 10:41:52AM +0100, Lukasz Luba wrote:
> Would you agree that I will keep you as 'Reported-by' and send a
> separate patch to change that !SMP code completely in that
> get_load() function and get rid of the 'cpu_idx' argument?

Yes, please.

regards,
dan carpenter

