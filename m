Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D944B1AAE08
	for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728916139; cv=none; b=GI5xAOjCyouCKZZmsH6S44zmcm8DFFmD04F99dx6MTfdJQklbXtmuFxnBOdyxy25WH5jRsv2ivMN4PttbIWUT5czaO2gVTtByms+EBd4Pz3+XDrMfRDaIPFdYgBIMtw8MZR8z1AcMIphv8swCdjAeoRbcIJrKy0kVup6fH6FDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728916139; c=relaxed/simple;
	bh=1rB7p9FU51p3IzLrmdkUyjlzmEnmhxPq0Edr78fwNtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7IMVfJfEA41RPgQhoZjxun/ymyyBtyfEijpbqmYS0bxaaYDllNKQftTMG4uYKYl5bocP9ED9ZjVPhGq1Ry5A7I1ylf45rBK7j+9tO7HK+NuN2205IHvC1HWOkBviQODd/vpQRJbvbaonIBrGLnbhI44Lf/hmRtVo5ARGXYkR68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gALPSt20; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gALPSt20"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9932aa108cso653819466b.2
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728916136; x=1729520936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6ZPaCJu1TDjZj63KvPFdyuvQg3nHFta6L0bbhS5g2M=;
        b=gALPSt207Ld/o7WdJXPRnoMzFesr2jZ7D7PsMSIxMwt4hbojJcdLt8frQMJXG+pmuN
         pMM6QAhTy65XsWP2opjE5R0Gw4j5a3GcmAG+6bA/hK8Kt0XuHz21byLovz2YwYO/Q2nl
         QpPQm3IRpwNat2t5Jrpx75l5jYxk4cBwmcXTY0+tefNBH4Dy4IunWkc/rIKQoXU4BHFb
         uVZK9SY2HLsb9ETZCwNIZniisxrWDPLEDv2CkjhhxHCat1W0JsJxY9VFkMGD/Sqk0vk/
         NpcXIwu1qXJd2VX/cPfEVfm3DFbSdfI+fbEH+nIt/2gvXlmGXoiXbndE1/EhDaTY5mPN
         0g1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728916136; x=1729520936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6ZPaCJu1TDjZj63KvPFdyuvQg3nHFta6L0bbhS5g2M=;
        b=ai/T7W/fMyJYP81a4MKiWsd//Wv2zoKM34I4OSFvVVkU42bR9rSbl0ZkmTe/iv/dw7
         hSDBodmyYF+ZNZ3BTYC6LP2VOqUpTINxrNezAFWLcdCYXYfull9zc/O/BBBs9ZHrGeRJ
         uX7rMM4lyvSSVuq3uIOXFMw8pnWVd/Nn6mTlmhUz0PzhxbH62cCOLj1aixi5+8wlWxJc
         z5S8qk1oRgTRTKhQW8wpvBb1pWBtUkHY/JeZoisd5TS7m/CqkxXn4FPe4ODY6NWjNDhm
         t1/iMOw0wZ7yyv1pfF6D0BE5LUUcofW1uH6mgatfJJBnGiaBUirBMQO4Cyi25YhzgDaP
         lWWw==
X-Forwarded-Encrypted: i=1; AJvYcCXNgQXspaQ4JUAH/ReUNj6Fn0vpR66AmGVkTIkR9wydhmw7dRQ1mHvN2uYrwlZOiKaCoDifjlZ/30n9px/OBFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnhByMdFX4wRtVdjAXkW5y8qwreM3te2zFyV10vWLd9L2hF2xX
	sSnBN0komFJRWMEfxO4yYsVX1UVT7XnS5bvQYDVkGS0OfRV9kvY4O349vgYHvs7gXTNiFuhT2p4
	J
X-Google-Smtp-Source: AGHT+IHmoNpZi7zdehXxeLP0EbUl7/f5MePWgVGlpdBpa3XYSfa15rl4TqJWVgT6lNMi8CisSrXVpQ==
X-Received: by 2002:a17:906:c14c:b0:a99:53cf:26bc with SMTP id a640c23a62f3a-a99b96b0c3emr1153930966b.44.1728916136180;
        Mon, 14 Oct 2024 07:28:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0a19757fsm202726866b.69.2024.10.14.07.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 07:28:55 -0700 (PDT)
Date: Mon, 14 Oct 2024 17:28:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian Heusel <christian@heusel.eu>
Cc: Andrew Mbugua <andrewmbugua388@gmail.com>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] Removal of unnecessary cast
Message-ID: <23018e93-bafe-4af9-bb25-dde6041f353d@stanley.mountain>
References: <20241014112207.688877-1-andrewmbugua388@gmail.com>
 <e7781a9f-3ab0-4916-b6e7-2c92dabe97ba@heusel.eu>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7781a9f-3ab0-4916-b6e7-2c92dabe97ba@heusel.eu>

Yes, and the subject needs to be fixed as well.  This is networking and they
have specific rules.  You'd need to put net-next in the subject since it's not
a bugfix.

[PATCH net-next] net/xen-netback: remove unnecessary cast

Also when you resend, include all the people from ./scripts/get_maintainer.pl.
You may as well not count it as a v2 because no one how matters will see this
version of the patch and calling it a v2 will only be confusing.

regards,
dan carpenter

