Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DE0225A44
	for <kernel-janitors@vger.kernel.org>; Wed, 11 Dec 2024 12:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733920174; cv=none; b=dPGrCCTSIFAwDmN3EeTVFPJSfnQ8PRBVhWELEyyLj1J49KLQ1g9jmaVSMJCBBhcCdPnJsaQB0QVq+xu96otmpIEwAUoQ7DWbffqOmIpoqyd5/JtE85HKWzVk48n1Y/3uXCVO7iQWdPpExmZ8Wk4a9QCyVUgk+cfOXBOOTDTraOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733920174; c=relaxed/simple;
	bh=YEw/IRYYRv/+z+aIG9Q+90G+HCvcHBe1Et0PZYVkGhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAELGyt3+j/MZ2+PY2SgXZIzd34yHD8T+PZYSKV7Lu0ldFDc4XdFTappRWalm02mtaFWu3SV9ciQLfjch78ssoM4G9FZVW7IaxtnGkZzsUFaLvbe1EItWuMa4MRFHFxAcel35QwuacdBuUcDz1E0bRG8cZDEEw444XU6JLdWBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ekav7q+u; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ekav7q+u"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3862df95f92so3378497f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 11 Dec 2024 04:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733920171; x=1734524971; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4q1I1Yh84bKu8NCVCn6hfhSIWeIgmZ50vGMDpFsxBHQ=;
        b=Ekav7q+ufLl3fuWLREiCJGSstwg9iN8bF+06/HnGxcpTnMBpy9xC0dBe0vDwyJ50bi
         dfuPuscO4nO2AOynyAp3BKRJHhcKGtTCBPPvKDqEWPbMGp0NxpfXxWHZXsC/nDHckkIa
         APyp35geaWmbms2cJB/UKitcdDzHkhwr+jaEWO/sct6ZRUdhqspqEv15sEenALsvJcEG
         xkYvG6qaivMMZmH20EVyojtAf2CA9AK3Vv2xhnVDFR/ZweJMjt4/2mRFb4RqJ2laEqIn
         hzjjFUoRoKa1PAVNqtate1hO9jf9Xcbeg/RSpfqFdHCmvfh2Z8GY7U5ghhKyIWENz3AQ
         JjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733920171; x=1734524971;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4q1I1Yh84bKu8NCVCn6hfhSIWeIgmZ50vGMDpFsxBHQ=;
        b=qiTItNquYlywAVph6S8yEuRH7FvOBaYMjw12BMQ6JIyvBIvA9h477bIjYIW67jRxMT
         Ly/J3zS1u2bpxg/vWQqserxsojPC3n0JjnC1hfmEUn6I0htrjjzPkU0/83Sl3g+l94yo
         z/bDJoaCi/+SAsXQQBTcjGiodZxLsCDnuLgiibXv0Fiwxq9Y/7JKsNsKSOeQ8x8sfIL9
         DUQws3aiNXpvKtiwJF/GVQJ7cA5/6uu/UWLJZ2Gtesv5VtN75Br1j0qjvsZTz0nQKem1
         2Psvp/6L5+nB1Z12uzXJ4lZZdxGIC9uVSmHOioqHQb4bay+vnPzfrSLhGZXqG/Qb+AI3
         SbRA==
X-Forwarded-Encrypted: i=1; AJvYcCWuLLywwmHCqTwRMpYpXess53hE30UdgW1CollrYZGZmYNAAwpagoT9yM8MryPNRPsN4N2AQpBlCJbj7cfkj3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf1jSZG29n6UuuOZi/fdEuEZdK4qlSm4HsQx2jhjkAx6bD6zgw
	zxM/IEMjyDyGsnfWdUi5Jq0GK3RZsraZyPnaFmooOOFot8WIvGqscouDHBVb+bQ=
X-Gm-Gg: ASbGncsM1zFev5N8+G33OFWe91lfhOYYIboTEaGNa4cNKkaVdaq4qYTvqUtF7xEzLpt
	pcjcOkz3tnzRjNYeIDksnLt+i4rh5ROs9N2hX94d3IGCawAaiD+dxuXAY8CZlIp8JZD6erW0nU2
	sn4JMkyT4tUl0A/BLe7Y39Ct1eD3h1alX9oqEXxWBgI5yK99bsOOVpXDEpbhZdfyHoSV1VljEtv
	VwyiObXOYD/p+SKlFTMlSizSWoR3riT1ezJJYW+SOFMD1P8YfwLn+vlVM4=
X-Google-Smtp-Source: AGHT+IE0TgsU6/73zikWtGl+XcC9OJmbSxFiscCQo7i68052biLcQRUNTqXnT2vH4aEJK/3SFna9UA==
X-Received: by 2002:a5d:64e6:0:b0:386:424e:32d5 with SMTP id ffacd0b85a97d-3864ce556f4mr2228673f8f.14.1733920171168;
        Wed, 11 Dec 2024 04:29:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4361d541eccsm20564675e9.10.2024.12.11.04.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 04:29:30 -0800 (PST)
Date: Wed, 11 Dec 2024 15:29:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Esteban Blanc <eblanc@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: tps6594: Fix integer overflow on 32bit systems
Message-ID: <e434930a-f30d-427f-9cc6-41562a31d8dc@stanley.mountain>
References: <1074175e-5ecb-4e3d-b721-347d794caa90@stanley.mountain>
 <CAHp75VfssNnd9zvNu+N9xc74RO+qBPC_qhF5ed_G8p5HJ8LWvw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfssNnd9zvNu+N9xc74RO+qBPC_qhF5ed_G8p5HJ8LWvw@mail.gmail.com>

On Wed, Dec 11, 2024 at 01:51:31PM +0200, Andy Shevchenko wrote:
> On Wed, Dec 11, 2024 at 11:32 AM Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The problem is this multiply in tps6594_rtc_set_offset()
> >
> >         tmp = offset * TICKS_PER_HOUR;
> >
> > The "tmp" variable is an s64 but "offset" is a long in the
> > (-277774)-277774 range.  On 32bit systems a long can hold numbers up to
> > approximately two billion.  The number of TICKS_PER_HOUR is really large,
> > (32768 * 3600) or roughly a hundred million.  When you start multiplying
> > by a hundred million it doesn't take long to overflow the two billion
> > mark.
> >
> > Probably the safest way to fix this is to change the type of
> > TICKS_PER_HOUR to long long because it's such a large number.
> 
> ...
> 
> > -#define TICKS_PER_HOUR (32768 * 3600)
> > +#define TICKS_PER_HOUR (32768 * 3600LL)
> 
> Hmm... And why signed?

It needs to be signed for negatives.  That's deliberate.

regards,
dan carpenter
