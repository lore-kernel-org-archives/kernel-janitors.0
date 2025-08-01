Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B438615A
	for <kernel-janitors@vger.kernel.org>; Fri,  1 Aug 2025 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754035586; cv=none; b=JXiFAcp5QEqJ2FMR2fJYHtffkXEGD5q5J0So6Oh2JBjrUhOju0KMQeHeD1/LzoCYGR+BHL5fddqfAMe2QO2mpIASNAK79JA/sayHc91wKWkMDmrIUh3KiScpeUenDWClnd+Z5/TmXiGI2aZYzFuShgiL3oJjpsCsyeVTJ9SJem8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754035586; c=relaxed/simple;
	bh=vd78SXuialJaPvnj8hPu+N2YlkKX/hUriyvsL21fTrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DoJbO2YFv9N7Lq+YC662+UsGCrsQoN6cksYdQhuYBabWvGH/TCtoGfY3ecepmZomR1XIISW/Y6xZE4+jf/hNCvGZbEJ45PIcxcow3zvTnFUIAHaa1sSVLTv6/8p5hsjJyILj6jKB9+Y/EwL/6AdFIo+XvJMnLaLi0dOwUE8kPbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dSmEiG0u; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dSmEiG0u"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso6990555e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 01 Aug 2025 01:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754035583; x=1754640383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HC5FdN+p83TIgj3QdaEXrFkwg6zsrhmSO1nWzeQxiOM=;
        b=dSmEiG0ue09LZICHHIKISo/7lfRKo112Lv6TDyby5WXXxVTj4BVBc5WiOfeaCp1WOj
         vGPL4U8jAFa33VmlSfj7i3jAAsfvfYAg6oOBs0xAA+YFcJOHToB7lpzdPKZawj6yIeyK
         qf0ndxn2KPx+L+7o8kMelOXiijzyeRrcO11Ak8H3i7J6a9q4BSSwZBK1Sq197eRhjP7A
         QNADrhZ8nKVuZIqMBZ8ks2JiE0cs4+zvjUjLb/tFNA4nVvzzUJBan9yVqkWYfTBsdYZR
         tEdD5NX8cj2JbYbH17kwHB91iDEcwTzpI85fber2+hr4Amzzu312sLpYQ5vhuDf0fMBI
         8h0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754035583; x=1754640383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HC5FdN+p83TIgj3QdaEXrFkwg6zsrhmSO1nWzeQxiOM=;
        b=jDSt23ncYgXyJCWaAB1MaJNpqvzjzU8/5h6k1REDX9bRVtjZhFMiY9NrEj0VqDDGeU
         8Ytt4jcOwPBqeOl+635HFZb5+14wGM6Y3o4Z6K9U/IbC6ff81F6e1M3yr7jdIgTkVyUX
         fFPbCWqOy/Qx2dyVGO8c2AMNR0+jqo+xabSKTV+/6Lmbwj8HqPlFvRcfvoP8zZJgIQuQ
         CMgm60dok3t+j6qENDq9oAdA2FTFa8Y4AMKBADDahfHqkchzIUChONNxpM+pAlgZIsHq
         yv63e2QViOYUkQKZ4OZbxV+hLTb29sSy2Fy1x5jBCdyoXVoXZ5t17fSNvVZSzo5dYLTP
         lXvg==
X-Forwarded-Encrypted: i=1; AJvYcCVkqqs5mRPMFFYdiLsWAy4ODqZ47kVJYJLqUiQJYd42Fbt6nRo/vuS6PHqvxHarvIpXYlHWrrPKO+q/vc5QFfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTDZsPLiz9/QFNyDD9Juk5mcU8W/W4uH4yAPL8w0EvyURnpR0
	jHanpQjxcVfzxjQUxXzldtJUUsLi5OxDt4Y2Y6FMsW5oJxHR5iL+my6KhyfMTIteakA=
X-Gm-Gg: ASbGncvExa1BuG6XqBDkofYifxDivrEbPDtYXr3ctCfCh8pfHqmaN5sUHVOffV7GuyA
	VgCyLBbomsG2oQSqUlmhXYLC8PsZqsLVhUksD/P7iieAtJV6eWDOK29DJlyjUbqCgiflUjnmx4T
	ddwa7QzOOcc5ppr1Y/oLstnAK3fZ0MCw/ztDjOQ6MDvGoA4Bp1mdkBGmiu8x0dPh2uJ1Djpi8L1
	/FyDG49k3oNW5pjvIxBvij/4BUJsfvIXlR5ilt44QaXTYs8QaPWUGTO0WotsxSaCLPiQTleDHHD
	2mOv3pOLKpMZZAbSkTIxNfHKsJw/B4NzmByVZRTEHI4IEEQuqYeY4EOFTgScSU1gWKFBEPAaOE/
	vbiOOMGnK/FoqDtIaxe+3SqitcaA=
X-Google-Smtp-Source: AGHT+IFZ5j/ri1LSVCrIKHdpKUGNZ4kJZd0EPzHedTGKYZyuiPBOa23Fu0ExGYYHmBSKu3o8jHljdw==
X-Received: by 2002:a05:600c:4f09:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-458b0216ba7mr6486295e9.0.1754035582631;
        Fri, 01 Aug 2025 01:06:22 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589f0803e9sm56881375e9.0.2025.08.01.01.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 01:06:22 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:06:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ruben Wauters <rubenru09@aol.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] powerpc/xmon: replace sizeof calculations with
 ARRAY_SIZE macro
Message-ID: <bea4e3d0-78ac-4c96-8d5a-96bef8037839@suswa.mountain>
References: <20250719225225.2132-2-rubenru09.ref@aol.com>
 <20250719225225.2132-2-rubenru09@aol.com>
 <62aa5231-ed31-43e2-84b7-d6b6ec86e78d@csgroup.eu>
 <8381a142d72f3cd0e92de4dac6acfc0241a87365.camel@aol.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8381a142d72f3cd0e92de4dac6acfc0241a87365.camel@aol.com>

Can't hurt to try at least.

If they don't merge it, then for code where we're not upstream, it's
pretty common to just endure style issues.  I'm thinking of ACPI here.

regards,
dan carpenter

