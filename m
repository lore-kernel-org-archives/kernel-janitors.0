Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDC018BB8C
	for <kernel-janitors@vger.kernel.org>; Tue,  3 Sep 2024 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725382119; cv=none; b=ODLbRN/zTzFJvGEKh2ITxXTV8Fuqx+/svz/nlt/ZIP5lO1In5VpbmfG1irWtg8RBDBKAylKyINlW5Rey+CramH6f+4XZsscHg1pKOZEe74jKZDuRyvFmC00Fi/N3ud6fnlESYhfL1XdIzuFJF2xlhQzpgzlMownEWAaKLpKE19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725382119; c=relaxed/simple;
	bh=JUABkBov1BTpP8X1cXy8Wu9gRM5Z5iLqdXxeMqPSSEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pv7K28RZtJdX/JerydGxG3G5KamJeydvWF1ovzcSLBF+OWH0f3+t47lAXo3+qQL9ybx/u57bJqpfzeJUktrgiKvaUISniDhNz22Ot1XcVoJkQzGbHJH+Z0rJXEY731bEo1Op0ixtzXn7Ti1h3G4f3KRLYNRMteVBfZz3dryf3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RRadP83q; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RRadP83q"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-533488ffaddso6922936e87.1
        for <kernel-janitors@vger.kernel.org>; Tue, 03 Sep 2024 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725382114; x=1725986914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/N3PvcbOxJEyoCocEYxC10jX1CQUHnVIF3e6bgsLpns=;
        b=RRadP83qchmqTrBI5ZVG95Q2hnh8TvQM14nO49o4T8Bwm2qKXjEtGfhYsPl91HSXWm
         JsFpAF61CcykPOOReGalF2sbHCmwiXm4DmMO1Ekh/iTghQMjUs1c/Ayl0BaMfDRyqr3A
         Bm0fainJQzpBVNHMyYr2TdRMkM2VUcJ/JyNpsf4j/QZXx/2jyO6evCPDTO56REImlGCE
         JGwY67FXtw7PNf6mf37S/AfTPa/xV/cGAww9Shysif65M568cl+kMY6qaIsMaeWBBKIA
         DH1P/mbz/16MbMVcNvmxnb1cdQT4A82Ha0Dladng6kTe266/50IdBNM9AgUYD0zWH3i+
         BgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725382114; x=1725986914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/N3PvcbOxJEyoCocEYxC10jX1CQUHnVIF3e6bgsLpns=;
        b=ihpOaFAURhqJzohF97njOEuhJBvm9T/72lAmRyUmu+zQRI1WWN8z3D28leBhqukrc9
         xs5Kdp2uPugLyx8LpQJujFFVIS4MYplurXGqF+Psu9kv8jMapiWyaL9ROAzQBm0WPhKI
         L2wRA29/SDpUs2fKeVHsZR5Rj9abjPzJ0wk5dikm2nvaqUwydXxYx9VIihpy9Mq9ZhGd
         PnGS1t4s8S0vmaZNxZmMH41OSP00mLYnaB40IsvrslxLQGNLelHBVZNgc7qf7c2UQUKa
         AO+XIjiNf+PJs/WF4MZI9+9AuczZOViVDkvE7+rMDAcmFhNsLuWdhBLdSeg3TI36t/QD
         W7cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp+vVz/rTNrf/tV0YAKAyKsTEi6BaS8GBf2UV8VhlKw6I8wdVbcDQvRwgsTUdfgCzJwKLCKGEs1SPRW+pJdcs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyduIxFlbfZNj/dQRiQRlBFMH/ZT1BQ7dISPycmmU/z9FGboO01
	c/cTybWInqIHKpqm25/BBl17AeuRnRgFjB1nNdH4uwTCTs8LyAV+5H3q3NJ8gKo=
X-Google-Smtp-Source: AGHT+IEpu3Q/jFO70kBzSh93T6Qwv4WexikxqzsC65yGsBSq1beGHqeLzWkh9GJIUhCSyIDtKtfsQw==
X-Received: by 2002:a05:6512:6d2:b0:52f:cffd:39f9 with SMTP id 2adb3069b0e04-53546b2c596mr10142123e87.24.1725382114159;
        Tue, 03 Sep 2024 09:48:34 -0700 (PDT)
Received: from localhost (p5dc68f76.dip0.t-ipconnect.de. [93.198.143.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891a3e52sm693125766b.116.2024.09.03.09.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 09:48:33 -0700 (PDT)
Date: Tue, 3 Sep 2024 18:48:32 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Rob Herring <robh@kernel.org>, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH] pwm: lp3943: Fix signedness bug in lp3943_pwm_parse_dt()
Message-ID: <e42tqtowldqybyqf33xgkj5lc6u4bmmxkv7dr6mnqswicsinql@mevowrbo2umz>
References: <5e74df19-4469-4a10-8b87-e918769a2f9f@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4xrlgwefelnzgxs6"
Content-Disposition: inline
In-Reply-To: <5e74df19-4469-4a10-8b87-e918769a2f9f@stanley.mountain>


--4xrlgwefelnzgxs6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 09:43:11AM +0300, Dan Carpenter wrote:
> The "num_outputs" variable needs to be signed for the error checking for
> of_property_count_u32_elems() to work correctly.  If the property is not
> present then we're supposed to continue, but in the current code we will
> try to allocate negative bytes, which will fail and it returns -ENOMEM.
>=20
> Fixes: d6a56f3bb650 ("pwm: lp3943: Use of_property_count_u32_elems() to g=
et property length")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/pwm/pwm-lp3943.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-lp3943.c b/drivers/pwm/pwm-lp3943.c
> index f0e94c9e5956..803ecd6435cc 100644
> --- a/drivers/pwm/pwm-lp3943.c
> +++ b/drivers/pwm/pwm-lp3943.c
> @@ -219,7 +219,7 @@ static int lp3943_pwm_parse_dt(struct device *dev,
>  	struct lp3943_pwm_map *pwm_map;
>  	enum lp3943_pwm_output *output;
>  	int i, err, count =3D 0;
> -	u32 num_outputs;
> +	int num_outputs;
> =20
>  	if (!node)
>  		return -EINVAL;

This issue is fixed since next-20240812 with the similar commit
adef9a535479 ("pwm: lp3943: Fix an incorrect type in
lp3943_pwm_parse_dt()"). (Up to next-20240830 the commit id was
861a4272660a, I rewrote that commit because I got the Fixes line wrong.)

For this reason I marked this patch as "Not Applicable" in patchwork.

Best regards
Uwe

--4xrlgwefelnzgxs6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbXPd0ACgkQj4D7WH0S
/k7B9QgAp0kiihdPrzH5PDixrMEQeS8JDzUGoLQxGPzbSd/on3WPnuh593JQi8Fb
JlFjK8jldFhAOFuBoHU7eyg5MyyycNhILBHPWz1WUbYEe9mwjMyHUs6lSSFGlmpC
A3YP+yCv1lxQ1Da7fm+xdZsRLiHFhcY9udJhA4TLh7WT2KKwl7+YKvD80nhd60x2
BTgJgJiIDO+Gm0iHYxSuOB4ConG8ywXOTMZ9mfi0yE6OJpTiGIcx/M0NLTOm5RCF
fiyBpnNctEHaqn1HKEnLSiZJ37F+IunkjtjYj8pKYRgLAen86jQSfJ8JKMqmfnVF
NwG2o9aYbLJ3+sofyKQ8zHmGfiFh8g==
=n4Cp
-----END PGP SIGNATURE-----

--4xrlgwefelnzgxs6--
