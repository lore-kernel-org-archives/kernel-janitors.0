Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296A27442
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Apr 2026 21:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775167046; cv=none; b=KF/H/aR+8Yne22f6srMjCErnPs4aHQ6r/9L2hunRksUtpxsa8fZ5aqDWw2eJzeOfhAH3E+GGMsbR4laeuIJ98yBmK54EJOa5gHM6e09tyB8gux6PMX5Yqv2XpnneiDG4ap9fIygVh0OFCM2WOIpjVpplNrWDwQNO3qsREN/1pOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775167046; c=relaxed/simple;
	bh=vvGH+xompQFX+gbUy2hVm4WjVWikJqo9vRiXpQLYYh0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XiMMD7BZl7ENhcDRio5xNaLJgfSjiWl39S4DUfR86Y4d+QLHcpwuQQCbNZIhuOY2dC7SD//iDV1LFBv1nyL1jyPBRm0e+5lgiBx2++3xqvDo8JrlubdSDAWlePAq9vqLLOi35vwQNw8CEAhPdxH5CAHBxjVteYXLlKa5CADq7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njzQUcm2; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njzQUcm2"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a12cd0bd79so1587950e87.2
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Apr 2026 14:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775167043; x=1775771843; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pv7W6Yh8WF34hWR3uLvbvp1VTRrMlp3BaoHiFesCwZU=;
        b=njzQUcm2JD7dHfQIUJMvS2KV6WlGms2hWTmfzR3esjFsbmlkwdq+H8mzdRlNppkY5q
         p57spiQD21HLY6/hEvdBsOQ3GPyqgQ9+H98ihhlDbBEFozO6Npwf1vl4kpq91sRp6I7e
         Cdy8mNEErgTmE173Cn+pWHzV0yPym5e1yQLieNO4KJjTxBiaW8UAUj4nQo4M4k6zF+Ic
         vxcCocwsryWqQFmUV2PXUaro68Nc/vTkNW+6OiQV/92M2CteNYvBUA0SmIDZ4wNhQv/W
         NmLNFehJwIpt/Tsth9h+klys1kr8EOvyETcbECOTcK/xzYkWA/BacFgBWP6nKqE1kvwX
         Xofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775167043; x=1775771843;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pv7W6Yh8WF34hWR3uLvbvp1VTRrMlp3BaoHiFesCwZU=;
        b=dqNGV2RKy8zH+WDRaFmL9d7JrK+pnXVnZ1yhhmQPt1TjBqJsaRlrBKA3xr28xOFk30
         znnRqETn1qjGTYIk5NaskjAFvsHCgh9hIfsSllXDu7pWAopePIaQ3Jxc2brUZfJNtg3G
         bHX1TaR0MEar0UXmr4ynZFbta+3sgIN/3xaxSmcFaXzS2SdAIkgkDMAgkCTzh0PcSRrH
         RKyi0ClJlhAgjzqxJghvSIsLYdDtFKOUVMoFOlvy/SwMWMS1Ngf6iYrryz1QUNPqUm5j
         ZvOe4Wo1A/feNWdIya4ZTPFk3tSPY9DjLJSvTJy2618k3gnA5VdvS+1fV2DCW+Li7Ncf
         1YQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWm1UKRRBFB+/RNzoL/1Hp+OPPuBu8Yd+Yozg9AN5/g1ax+irSKXeDZ6bEKIKfCUuhX7qVcGvHNwvQmYFnaNUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcuc0NkJGA5XzEYWjVIrUs3o1DfrLVXMBTRtKrJ/M14YFzg/Nh
	KNuPvN9HvCi/DqsuBdtM4rGb2CWOR6bf9YmdPGl05Xfrc87kxq8tnhP4m2c42m62
X-Gm-Gg: AeBDievea22SMTh6eioKsrBd9dez4i1FMmCv6DnHdejCI9uREbonLocBKM/roKgxix+
	52XQdk4PJA1j8vcwMfFFe0vXdWmSm0EFz8IUFjnmtkc9IAavI9Pk4uGULKXbJo2arA7JMUdSry+
	VZG3X5wGYG/CEyjN+/UMDFruX04gyCy7Xr20rRbwnjHYghqZpjl/8mSPuRbEdDUYnNYrCdGqspf
	LwlWwOEKGn8+D+lDYZJdaZvSQsW4V+GuOyq3Xob9qlqM1AainnlOsR05zQorZjHmpRpa7d52Tov
	2jmYa7JbDKk24rKzuRGIDHhvbkh7C1Bleiwp/UPpmEGKN7AsUajlUv33o6PAgALtVu9Ns6yvPyy
	nc6PHReGANBK3J+X4BFSkasClplWAqZe0tSea/31wSVr4K/pGsZBRcSm9k7WLs1MJJf47q8MSXU
	jLxwRzXwtIou/fe/HSsz/qG74+n82JpFsFpqjuXF1tiRE03lYhIgd8
X-Received: by 2002:a05:6512:3b1f:b0:5a2:b43d:ac47 with SMTP id 2adb3069b0e04-5a33754efb5mr195684e87.5.1775167042475;
        Thu, 02 Apr 2026 14:57:22 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc7e20sm943024e87.46.2026.04.02.14.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 14:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 23:57:21 +0200
Message-Id: <DHJ074MZJ7KP.300Y06YAUW7IX@gmail.com>
Cc: "Linus Probert" <linus.probert@gmail.com>,
 <kernel-janitors@vger.kernel.org>
Subject: Re: Status of kernel-janitors?
From: "Linus Probert" <linus.probert@gmail.com>
To: "Dan Carpenter" <error27@gmail.com>, "Robert P. J. Day"
 <rpjday@crashcourse.ca>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <acpeJQEPtDKQ68uo@mosquito>
 <e25aa771-d3d2-4b93-31b8-15576e1d9512@crashcourse.ca>
 <acrhsqvXp4R-egW4@stanley.mountain>
In-Reply-To: <acrhsqvXp4R-egW4@stanley.mountain>

On Mon Mar 30, 2026 at 10:48 PM CEST, Dan Carpenter wrote:
> On Mon, Mar 30, 2026 at 09:27:25AM -0400, Robert P. J. Day wrote:
>> On Mon, 30 Mar 2026, Linus Probert wrote:

[...]

> There is a coccinelle check for this already.  I don't know why it
> hasn't been done to NUM_ELEMENTS().
>
> scripts/coccinelle/misc/array_size.cocci

So. I have patches for the amd gpu which I can submit. Just not sure if
these have been left out for a reason or if the coccinelle check just
missed these.

I'm also not 100% sure where I send them. I made the changes on my local
staging-testing clone/branch. But these drivers are not in staging. Do
they still go through the same channels?

This is the gist of it:

- drm/amd/display: Remove unused NUM_ELEMENTS macros
- drm/amd/display: Replace inline NUM_ELEMENTS macro with ARRAY_SIZE

Some guidance on this would be most welcome.

Br,
Linus
