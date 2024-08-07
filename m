Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ADC79945
	for <kernel-janitors@vger.kernel.org>; Wed,  7 Aug 2024 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044171; cv=none; b=Lh+emNiUJW07YWlpC9janOO67oIfa6mAlqTdKsLeZ4mjmL4sXlHbksdyEOEfaOnHQ4URVNstm9CJm9cVuxUWApr+ghYdeaqTqnPyPf4mfXAGE5npz8cFBLK4xKs50yevYOUNevtr26RUHMFlykHf1/q3Rl47NKssU/K1r6wIXms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044171; c=relaxed/simple;
	bh=b400N+knfVALmbzGgPj3BTbRD+oELeXUCqkW+G8VIW8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f01G5u19JaeOLOcqxYlJk2KOY6sXPuuB1lpqJyDOzmKAWXCrwx+kdiiXlqjBV6A+Lyxk9JHuuaBHrllLAsU+uQS+CUNCULBGMapS3A9OrX4zmisStLuFLmRqczgsQU2cXnhJsaJeddd/kqSlJ7TBmXC39KgvZy66a974lHbocpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nbr1uIGE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nbr1uIGE"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-428fb103724so6103125e9.1
        for <kernel-janitors@vger.kernel.org>; Wed, 07 Aug 2024 08:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723044167; x=1723648967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b400N+knfVALmbzGgPj3BTbRD+oELeXUCqkW+G8VIW8=;
        b=nbr1uIGE6Tl9bgsKyljrKH0N2j2DtlW1huEQl2IFRlPqMxk3eYpZTZfytu7HtU3Nrd
         nsluPTIirbHupzh8EZOs5quFuSEA0KdVfqmudHkTtyaRi7NMJ8JkVjbmoHOujAgLkHfO
         wDWMZpBlveuiLXBBbObVYUzhC+OryhQF9nCUYxmg4FJtlASNHDSK1e7rN1iwNOVFFBNJ
         cYPzmIDgVnEZwuk/PBm8XauQmex0PBm+kGqwLlHRDRbYJO9xAPecgAR63ntDcGN2MIbZ
         D/TZ2VnghfcIMLQVGXyTfY9PXUZl/iklrHsoldVfzEs2ymyN4N2iro6usvJr1DePetup
         NRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723044167; x=1723648967;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b400N+knfVALmbzGgPj3BTbRD+oELeXUCqkW+G8VIW8=;
        b=NPwh/U6xOOyOCR9lAV2kH8yrCkTyhyCiXO42dzKo5xLxORKcmbF1Kk0iHN9rJ7QfiS
         1KFTbxJDZD4RqGcre0sGKtJscnp5gKod+9LOpprfKTsCeY2cwe5mqMD49I0aZzOvw5Ot
         +JwjNEVsxYaE359b9lLeejRitCSwbrGG0Y97mKuA6qh3UhZ90p5vfJiLeM+YWcu0ImcK
         zMniYhwgADc3hvB/Imp/ZWvfouUad9RYOxVvGhRTgf8v/Ln35Jwy9MJBBak9cfcAr41b
         eadQeIBVqlEtx/yqmvJgu3mY2tHUREhDXbTNBByG69BCp5TZlDLNaWM2pyFo6z5Fp0+L
         inNw==
X-Forwarded-Encrypted: i=1; AJvYcCVclVJ7rE72d92VVIbPsJ1it3ffRrZIjCqQNt87KiIy6gAtW34iomkPlMlnEHK+QAbR/T9rpQ4e8wvKZQUqKo59rWZ8Qq4VuR5/CpJNxF64
X-Gm-Message-State: AOJu0YzB/a+zlImfA6xHHzzhd6aE52cH3x3QPy+ftnZ/u+gyiHBazkaH
	v49HelvWWO8e6itd+K3bNDNZJC6UvDi2DfoTqVs1QZhBhaQPW7CD/X/oiettgIw=
X-Google-Smtp-Source: AGHT+IEee9/+95rBHM9qmfhHhWhuk6lT6qGII5W5sxauIeebfdopV9mCLXxpK67d6U+eT9QpOoZVag==
X-Received: by 2002:a05:600c:4f14:b0:426:698b:791f with SMTP id 5b1f17b1804b1-4290509fda7mr20851805e9.3.1723044167397;
        Wed, 07 Aug 2024 08:22:47 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290580c970sm34320015e9.46.2024.08.07.08.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:22:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linus.walleij@linaro.org,  neil.armstrong@linaro.org,
  khilman@baylibre.com,  martin.blumenstingl@googlemail.com,
  linux-gpio@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org,  linux-kernel@vger.kernel.org,
  kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/3] pinctrl: meson: Constify some structure
In-Reply-To: <c8eca123-8ca8-4dfc-acc6-3e196ff0c844@wanadoo.fr> (Christophe
	JAILLET's message of "Wed, 7 Aug 2024 17:08:27 +0200")
References: <cover.1723022467.git.christophe.jaillet@wanadoo.fr>
	<1jy158xvwz.fsf@starbuckisacylon.baylibre.com>
	<c8eca123-8ca8-4dfc-acc6-3e196ff0c844@wanadoo.fr>
Date: Wed, 07 Aug 2024 17:22:46 +0200
Message-ID: <1jttfwxsqh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed 07 Aug 2024 at 17:08, Christophe JAILLET <christophe.jaillet@wanadoo=
.fr> wrote:

> Le 07/08/2024 =C3=A0 16:14, Jerome Brunet a =C3=A9crit=C2=A0:
>> On Wed 07 Aug 2024 at 11:30, Christophe JAILLET <christophe.jaillet@wana=
doo.fr> wrote:
>>=20
>>> These 3 patches constify some structures in order to move some data to a
>>> read-only section, so increase overall security.
>>>
>>> It is splitted in 3 to ease review.
>> I'm not entirely sure it eases review in this case.
>> If a v2 is necessary, I think a single patch would be better.
>>=20
>>> Patch 1: struct meson_pmx_group and meson_pmx_func
>>> patch 2: struct meson_bank
>>> patch 3: struct meson_pmx_bank
>> Is there any reason for leaving out 'struct meson_pinctrl_data' and
>> 'struct meson_axg_pmx_data' ? I don't think they get modified but maybe
>> I missed it.
>
> No good reasons.
>
> I'll send a v2 with everything constified all at once.
>
> Should I take the R-b and T-b below, for the v2?
>

Leave them out. I'll test again and report.
Thanks for this

>
> Thanks for the review and comment.
>
> CJ
>
>>=20
>>>
>>> All patches are only compile tested.
>> Looks good anyway
>> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
>> On the vim3l:
>> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
>>=20

--=20
Jerome
