Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CCE3DA7F9
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 09:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194258; cv=none; b=o3BZDQclBvRMWdoX1z2xs11XOwiL2RnGKo2STzwxfiovNKmyHcFo6laEQ9wBgW7EaHAPFlpfM3Ti9hlxNVO5Dm9KvLU7XykGexbFvqyVHYfNjLQVpvaZbJ0I5Bk/s5MKHiFv7nAa0nfUlbXnRukBSf0BUY/1h5bMt6icgwShjJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194258; c=relaxed/simple;
	bh=pfuyWgnWckbEnoDkJJeEl5ch2vupcxskEvCrGOFWUBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OybCJhelLjDVmL66kvpyWWJtAFaZTFT50xfxAu3Bl7tpN4CGmMTyC1v4IrpTkI8AbbmQe1JtDuAVuOK8WbnJh2ha9L+HRul7pMSwm91UHMfEnXu3tBexF5ezEj/kaJeUFR3CkDVQhls3FSsGpeBX21lvSJOLuByAqCHED8A6fEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXlEJz+6; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXlEJz+6"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9ecb1e13bso2492299a34.2
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784194255; x=1784799055; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1EKuk/C1yP1k420D+fM+wL8Aaex9k+TpkPoGeES0JJs=;
        b=gXlEJz+6Ma4xEZ8XamayC77e0LBD7ZW7WmkovfIuPVp4IZPzP1NuIAkXvNCgU6fxd6
         id4oBw12Z7+PGy1XHBuWrMbvY4/vO1ceb1BS7rQfA64zmd45kldaMIDE3xoyon0tq1Ja
         xeVEUmPh2yd3AQb2qkFm5OypvWKIvgQjlRepxBZNZuR44SadXyxKN6DsC3SIc/iReGMa
         ajsmF9VR/PUQPZpxTZ9LZbaVX5ApNkoLzIWTcFB++2sycPBY6HyppaDnNnZFad94uI8V
         gJTgb/M2E8rx2Sbmdova82q3bhJxEsipAJGksCgNWmQn8qX2J11HfPvENGfuVeW7IXxu
         AIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194255; x=1784799055;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1EKuk/C1yP1k420D+fM+wL8Aaex9k+TpkPoGeES0JJs=;
        b=n2661IxLGBl+COOM2O6aYdq2mjT4yerwKATDBHV0LAhOkkeQgpfRs3YCQHUWMNF6IM
         +oDY+pQrqM12aolAOl6hn/kWDTJkpEz0TpUCgTvbxaIrI/q06k65dZa/CfKdoLwFVZ6t
         lkDfMdqkUjted9vNyb0Cy6DaCDKvxCMgSAif+s9TK39CvDnurXeTcrwWeq/s7vaVlVRa
         sKTKsc3MtJ69/dc1uRITk3YDM0U5b5v3awELgw2qxFDB/79im3QEET3LwZL1bX3K5nxc
         NSVTScRI/LLGdNlgzV6joF7DBrtCWyC962ieey1l2kUwJdJ8TRaI/hz50ikqkjQP+PcZ
         vQHA==
X-Forwarded-Encrypted: i=1; AHgh+RpccorYCLCVIKJ6KeoKsUkDvHJOelabQHwaE3TCEDZznCXahBG2ehMExukvJRRNvEvko9JeN8oNLJitMVB6z+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLh4TzrFecyjUUxLy8hkzYDO8zVZYcY9tCWFKSFKH8vXPnX1pM
	zFH+DFWcE/h3+x4b72K+gpu2IcjcHe3T+wlmmGfdv0XPKBVsZ244qRP0
X-Gm-Gg: AfdE7cnM1/MZbIat9ejolEEbsAV8KzOaf0qVF8258DXCqMh/NJvByzNmRC7SBTucC+r
	ulfglq9fLslZ6WXJpcQI008Xu8WrzUZxHxDrZcTC8M0C7ZKeKc4PZmkL6PQ1NfwdnwFPnmH0Gno
	F9SWDOSG+4lXMZ20QxePL30m9NsrFEOdtva6/r0JWpZo4FvdS4B+zPAnMuEpVSPxtnjtd9Ne9Zx
	piYpthSFRdBGMlIUezSmPdiuyNsBU7lPf0a9n5bX+Z0rRL6z+wuE43Nt3/ZPt+GcghRDoLZ4QHS
	Jr18dRorj8gM3NbuBPBAHkIuCMeGsoZOtvd/AhHduUlHYD03rHCVfmiHcompmFghbgXloSOX6An
	N0RqrZzHPIh/TTujSdMpglpBBtu/mIgFrJKNrVJTVNMbY5qhnqdCEgQu1hKHOzeUkV3k1NQ==
X-Received: by 2002:a05:6830:6d11:b0:7e9:cad9:4bd0 with SMTP id 46e09a7af769-7ec59b01b92mr4444987a34.3.1784194255207;
        Thu, 16 Jul 2026 02:30:55 -0700 (PDT)
Received: from localhost ([74.80.182.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f27besm18605443a34.25.2026.07.16.02.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:30:54 -0700 (PDT)
Date: Thu, 16 Jul 2026 12:30:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	MD Danish Anwar <danishanwar@ti.com>,
	Michael Grzeschik <mgr@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Yibo Dong <dong100@mucse.com>, LKML <linux-kernel@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: net: rnpgbe: Pass an expression directly in rnpgbe_rm_adapter()
Message-ID: <alikx3W3NX7r9o99@stanley.mountain>
References: <7958e26e-a4f9-48ee-8d79-3797016944c5@web.de>
 <alScHkiC3EmGzOlI@stanley.mountain>
 <8110bb3f-70d9-4f0f-82f2-ffe1262b2962@web.de>
 <aleFN4Z2XT3NP3od@monoceros>
 <85ad473e-b2f5-4458-8973-a643f90eda5e@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85ad473e-b2f5-4458-8973-a643f90eda5e@web.de>

On Wed, Jul 15, 2026 at 08:45:48PM +0200, Markus Elfring wrote:
> 
> Jonathan Corbet provided the following information.
> 
> “…
> But Herbert's patch added a line which dereferences the pointer prior to the check. That, of course, is a bug.
> …”
> 

Notice that it says "dereferences" not "does pointer math".

> 
> >                                                       Note, I didn't
> > study the C standard
> 
> I hope that clarification approaches can evolve further according to this information source.
> 
> 
> >                      if the compiler is free to optimize out
> > do_something() also in the 2nd case, but at least today gcc doesn't.
> 
> Can development interests grow also according to another clarification approach?
> 
> Does &((struct name *)NULL -> b) cause undefined behaviour in C11?
> https://stackoverflow.com/questions/26906621/does-struct-name-null-b-cause-undefined-behaviour-in-c11
> 
> 
> 
> Would you prefer to omit a “sanity check” in the discussed function implementation?
> 

This is irrelevant.

In C writing if (!p) and if (p == NULL) are always equivalent but weirdly
the NULL doesn't have to zero.  It's part of the C FAQ.
https://c-faq.com/null/machexamp.html It's just a bit of fun trivia that
doesn't really matter unless you have a time machine.  Even if you invented
a time machine, the code here would still be fine because we have a NULL
test before dereferencing the results of our pointer math.

regards,
dan carpenter
