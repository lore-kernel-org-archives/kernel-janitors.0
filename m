Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C11223EAA6
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jul 2026 04:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783915278; cv=none; b=uJBbRP4VC/4PrFmytHQW8SugHZWEH6cGU3tsTcaMNm5AmCM8zQ/Ts54b3GJi4l2dHXubQ3LvQeXlUI9qvLkkXggennPSdvoysCWByqnfIekAQ7uYaUtQUcMUPrUjKdNuPcJXUUweedS+EBHb2nW+mWaL+3K0kVJwnzx3YvJ+/Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783915278; c=relaxed/simple;
	bh=2btvzWb4f1fV7Xkk7YNTmYjsFJjgIYMJ4JoMe9ISYnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMTcBIYtfdES/8kCaH5rqZ/Rd9svIFgf7CiJvwXBTg/xYtlcVc0slt6XmcstmCqaI1jGEqlp9JhNMRBFWryafNTAWUXkiK3a0xizQGqJL23XSIwYF4aosdug5Rj6deTQFAUleUL0SE/YCuob+4aqwFCT4OI5rZH89f0pOJM2jcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dxJ9ueYV; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dxJ9ueYV"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8486ac3f347so3050407b3a.1
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Jul 2026 21:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783915277; x=1784520077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+4lglUIf7H+3FQoNuXHuJcCfTBfdwIBX34fYj/Zgw4=;
        b=dxJ9ueYVBu0vHUOcqJGq6MQS93r1DWZJGipq0zrrdA7R4IpnHqudowNcmzKA1k+/cF
         9OIp/ZlKISz5hsNQLAJdZ3H7E7L/LIjYEU24DQCsUmeiRCKmuVWeJhHQtz9ahcBQ1xEn
         Rx33ScF/TzMvooIHj5HyoagUza55WWeXJ70F7X03CbOXerkURxHu+THNObsU7ZXD5c8R
         zs+YOxCWKQcS7albPJmA3gFgLiHK2fTRkHEhOtgU0RDRHqSMVyy8++LUx1nAVF3MqSpN
         tBIXn3oVeiZzHhyEBgByzmthyPTk/FQkNC1UHHYxB7ND77ukSa/WZ4sfK23EsmTeooxa
         j1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783915277; x=1784520077;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+4lglUIf7H+3FQoNuXHuJcCfTBfdwIBX34fYj/Zgw4=;
        b=Vi9KRMBaC9CRvfk76GEJEqPFVYT5B0dyjP/JC9sOCw+/2Dmab0vvKSew5pbbmhrSoP
         yrH1BMuholTpnXUgx7+SjX13PQEqeYhWT6AqvdKvz0p7F90kqt1pM2n3/0qIg2HyjtXX
         83bMiG5qjhQKCtjAuR+NMl/RhTygUT4zw/pp4BFEnFQ/+VUxZa8tgIA07zdQY7cxp9kN
         nnt2RvHzg3x9XC3MUTnjLGNLe/EJn63oW3HMej0hcAl30XdS/jDBY0cJ5MrzpwdhL7gE
         3zPdJwjiqqpsy0fFyu4Jw1Zbqp6rX02H4HFCva8SEDDMzVSau6vHMJobiFC03VRuZlmS
         PPHg==
X-Forwarded-Encrypted: i=1; AHgh+RqSgHV82JXh1syRV1s64etYDT4sVnAb+Fih1gS8zkRfpvhD+2efpc/BEqDafpRxIfzIH6AOyIrH7rbU6OSfqOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YymPz3SOgOhvaLZU7bzXUchGx/RIDRQEpwWvsfN7vw/0sN+zl/h
	PdDa9eqtCGhFvyttmIx0q8V6N/Z70W6PfEIdF3I1idYCdfpUEKFu97svNXxKST3IY944oguLAaV
	NO5ry
X-Gm-Gg: AfdE7cl+5WMQu0WGPc3JO+bYLpKI+QuzQuFWaVKi+z2InozpvJKfOguHaa86dldShcO
	TOREIW5zq/2QsPa7fAC0yiVoaLiDm32aECyrB/QFZjyNeEHx4bYjbZEqRQDKfJvM50DQZS9JG4+
	9gjq2JPOl+5HTVcr+BXjmJGe4tWvl4wGw2zismoheXvv5nRknCifALTco5DwlrQWafTovLbKIls
	f7yLEXbifcy05iJmRdQM4cV2dQg6/04c36Udr+S8wjgdQPbAXQZ2UF3eV+F+qHW+07FC88UOGnP
	kSqmwhW6kjht0vcOlJeN9EmKaF6m/q+alO1IJJh0UbfBZEunUtN4H3yS2LLnC8WrrdnSRe1pNjA
	Wbb5vjPOVtGIKZykgcALMVTP382Bd6dF0ukZ6kKJYpj2gCUIDQBiLJ6x5WjJ34nhJp4103zJqXn
	cwDjdF5T02hWAy
X-Received: by 2002:a05:6a20:2587:b0:398:76d4:c7e9 with SMTP id adf61e73a8af0-3c0f0bf478dmr13440206637.35.1783915276499;
        Sun, 12 Jul 2026 21:01:16 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm23629968eec.23.2026.07.12.21.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 21:01:15 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:31:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Dan Carpenter <error27@gmail.com>, Deepak Sikri <deepak.sikri@st.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Fix an IS_ERR() vs NULL bug in
 spear1340_set_cpu_rate()
Message-ID: <sejbfcic3gey5p4uxgituyizdttimxhlrl4kwer27b4g7j5i6o@yvjnioeplypl>
References: <alFJNUllC3JOKv6z@stanley.mountain>
 <c0800c49-3435-4e89-87b2-21dfa20ae58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0800c49-3435-4e89-87b2-21dfa20ae58b@oss.qualcomm.com>

On 12-07-26, 21:30, Zhongqiu Han wrote:
> On 7/11/2026 3:34 AM, Dan Carpenter wrote:
> > The clk_get_parent() function doesn't return error pointers, it returns
> > NULL on error.  Update the error checking to match.

origin/master:include/linux/clk.h

/**
 * clk_get_parent - get the parent clock source for this clock
 * @clk: clock source
 *
 * Returns struct clk corresponding to parent clock source, or
 * valid IS_ERR() condition containing errno.
 */
struct clk *clk_get_parent(struct clk *clk);

I think this is the source of the confusion.

> > 
> > Fixes: 420993221175 ("cpufreq: SPEAr: Add CPUFreq driver")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> Nice catch, thanks for the fix.
> 
> Nit: the subject is too generic and can be misread as a cpufreq core
> fix. It is better to scope it to the driver, e.g. "cpufreq: spear: ...".

Right.

-- 
viresh
