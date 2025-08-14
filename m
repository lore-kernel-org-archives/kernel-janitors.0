Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C712E7F1F
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Aug 2025 08:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160936; cv=none; b=CN0IZm7cd/M1E7r+WmoLapVOMbc0Qa3ftJZNP13T2DtgYZ3nppFba5wvWnzN2yYXENAyqGUzYHKzytS0vBc84Db6/jco+qkxBHdki6KOKyCxP0f+wGQhmW2oE47zHDE3ACFnA7eaEfwfaY74VAbSuOmsVTx7zWa9uWwmrSgFB1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160936; c=relaxed/simple;
	bh=ZLJ+OvTO9Egq2EDBDmrCftbeyKLRuoLdld/Xe68LeYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOnmtowHFRRh1zxyZn/SD9z01rXWTlvKnaqGthwLppGQtDMoOLafwUny/uCof2f6OPa+FVupXoad9dZqezMOirmQCWnX2uqrgTDdvThxmUt6Od94+fUSfbefDjwB7ftQbVHbfFkGyteuKJ0nfltqIHWJZYGBpp77GvduteLHvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuU6Euah; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuU6Euah"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce5284d63so580989e87.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Aug 2025 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755160931; x=1755765731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LG6dQwLAbECIeGoi2Xeo1tsUHSb5SDFit/yFv4rq4XM=;
        b=DuU6EuahpUEIIkQja/tfYIOrM/AopXqcl63toq9TKuL5pk5ZF/AzsUAv+hqwYcykvd
         dPVPEJC9nrtWppsJ9J1HeZUGXQ3GXfvHVyMiE++R3TUfwtY+VQKHAWmgQj2a+tfTC+wG
         b7GyKEooiQYMKWFW/7Q/dB+nRcnzuQgoqG3UTtZ3E9wWhqYhkatldo8m0uQd+/t3BlRV
         AkrGN5l1zNXYhtET+qCA47OpPhAD/6Ry+VV8t4n4wxFXdv9xSPKE2pKR3g7TVLSS8zBU
         ME/tw9Z9N5CNdbkzxAN36qyAyg2uYDIZnrXJSGMhEHIeoAp1MQxnZJ5fyJLmNrYHLoDB
         FP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160931; x=1755765731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LG6dQwLAbECIeGoi2Xeo1tsUHSb5SDFit/yFv4rq4XM=;
        b=thO7E5Qd8NnnCLEF/WykSZZY0XAYwEuKO8smZv3ZMC3nuixm+FS0nujT1jEh7KHFI5
         hWPDkDIZgjGuZTRLRVsd4ROWNWIsfgSbJ3nx+l50HSsuBmjcHdq1X9cv7onU/4ECsfYx
         8EtJzjCKv63U1/Iz9kQnFHqtmvebLmkKTl2o583/krcmVYO6zcVOflN73F+brRh3hJ48
         /0aeNLjFVrDjWrVUYxM4r6rKyuw1G5n79ic/rqT9sil9w1Q9dm22E8OOaouVCY8DW4PR
         FW3SbtPDmNWtCvCz3+DSEGiq3Tw0nthM/L74W2foSJCrgub09Sv15Y5ujYMes7sMKBdk
         lQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCVJsP38HDrX2AR7ugXG4cIPvQvg7TZjLeSSv0HYqLWH/KeTXXewaxDpHvcL9dSIqSIie3iHw2qc1HNaw+V7Nig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+6ztf6AOAiNBbQ8/wuYpUZqjTprSNqMqFpn+MNldIbJYVxHz
	Zc0/4gBDHipzPhM4W+Gh0VTteEg7zcZXS6RTbRJbLYaxjJ4ZI4gKgaqTfYGbUQT7RpLxqQzKuCC
	BmitN9jdtwlb7PEL/egvSUZxpWLY3GDSXYmM/jNK28A==
X-Gm-Gg: ASbGncvnKdC30iW2TVZOaUwA9vgBDYDY7sVc60Toa1CH6w8mU7Jfe55Uw1Z7hJ+dmrU
	MmXgORBO5ioLxsZlISWh9n1Jnpu2fLheFrbUTQ2z51BeX3/c6zhFJzcSo/vDb2MR7jUzGf2LWlb
	Ia7lB0DV/MRw1+od3Mg5CoxdD3lOnwiGhTm+zWCUkQ+H1XkqSEZE19S7sdSoAEOKkyS1ZXMMpIi
	QElQJM=
X-Google-Smtp-Source: AGHT+IHprenDdT2lQfzU6Lhu57IKRhlpEZsnmmWVHV7r4cnpXiXk5gJnWOJBt44y2tnOfA/ZI4lRbK2Sb9a3BU4XGrM=
X-Received: by 2002:a05:6512:3190:b0:55a:4b21:a80a with SMTP id
 2adb3069b0e04-55ce62623camr605127e87.1.1755160931332; Thu, 14 Aug 2025
 01:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aJwk0yBSCccGCjX3@stanley.mountain> <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
In-Reply-To: <175506979055.8476.10658684000717777329.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Aug 2025 10:42:00 +0200
X-Gm-Features: Ac12FXzC-XOfXo4WQ45R4xq6JzH2dBOftR1LqQ_rC3r3c1A0HvmOG4EuWVtRZ8M
Message-ID: <CACRpkda_-JBGTTh7pLd+MkoVyCCKDqTZm8t9vaxWMWDE+sGyLw@mail.gmail.com>
Subject: Re: [PATCH next] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Thomas Richard <thomas.richard@bootlin.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 9:23=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> On Wed, 13 Aug 2025 08:38:27 +0300, Dan Carpenter wrote:
> > The "> chip->ngpio" comparison here needs to be ">=3D chip->ngpio",
> > otherwise it leads to an out of bounds access.  The fwd->valid_mask
> > bitmap only has chip->ngpio bits and the fwd->descs[] array has that
> > same number of elements.  These values are set in
> > devm_gpiochip_fwd_alloc().
> >
> >
> > [...]
>
> Applied, thanks!
>
> [1/1] gpio: aggregator: Fix off by one in gpiochip_fwd_desc_add()
>       https://git.kernel.org/brgl/linux/c/148547000cfc1ba8cec02857268333d=
08724b9cc

Do I need this for the aggregator immutable branch I merged yesterday?

I have only merged that branch to my new development series, if
you need me to pull in a new version just send a new pull request
and I will use that instead.

Yours,
Linus Walleij
