Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71CE19B3F6
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Jun 2024 16:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717778101; cv=none; b=W1OcHYNNiyn6D+ZQ/dtMD2kLE04GyK5eJlW8VA76RKv4VPHVoMKgnvOPIn6YBBfX4bgYyFXHK6n1gH4GZJeAk3kyVksHCRmL7W4iBzeW2KhoPMYBEjgzVnZ29lb6SVFf1li4rF03EfuVU8DTh8jCPhCAVQ9glx0HN09LRmc6fqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717778101; c=relaxed/simple;
	bh=JSjugDn364e1bR2NBfOIb6HAziv7A8jZrYbuA88Eh+4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGihrV4uuT9+Ng8bhhSi9ud6VIlsvp4NiJbBABxSl/s90i8GqFYchsvS6lANSeGYnCeYSdq7Lhps9iB3xfBrlS62sOzFkRm09jtnzK8JqYPeZKR9Aftkb+LrAmEG58jUGNLB1rO0wybUzOmW2FFStWHmD0nQf6mdObYnE7lCzVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Vz1LTUe9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Vz1LTUe9"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42178999284so2703705e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Jun 2024 09:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717778096; x=1718382896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSjugDn364e1bR2NBfOIb6HAziv7A8jZrYbuA88Eh+4=;
        b=Vz1LTUe9I471TI69Ynuiuhq9MswC4g5uooJcYJjaMDtAqCc6UddtnVD25Egc9n9Idq
         7nufaQ/AnSE1/FanmqWl4vpHz3M9+8rQtAGTIkfehR+dthNkMG59dMXz/lRgwTcrgwhV
         BZ1mlpPYYYAu8Gqx666X+SwcpOJkC+DMYY9nQPIwylAgzj//b1bTGho5pHWXBrXcn72t
         SSKHCnqYgEmsnvxZaca733bYXntpu0UFRn4XIx8wmU5qkvyXMuOBzVBtRROo669ovwYC
         5zq1uGrBmSi5NtQv0M9dsY9IlskcwlPpFpT5VXxd+zQE0zBtpX07S9HzKBYbHyFQm2Ju
         bNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717778096; x=1718382896;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSjugDn364e1bR2NBfOIb6HAziv7A8jZrYbuA88Eh+4=;
        b=h+7ghbYwN/kaaIiN2KifR+DdCG6ajxe16qe43f9RJRhY/9Ow/SifS1M3Bh4zLB8jh6
         vTBul6CDSvDOhd9paE8rfjF0YXPtbVOsP40/APWztjTcGbYEJHw4cW3IDJ6nk+Fel2jN
         EOuAy8Q8STu/3zuakbn92Jj9kkWC8GvSrp6pt+kAXeEYZCfW3dmCGpfmGUQbyi1+UhTE
         zgDdNwaL3y7hk7T9l5bzqo5QUiJDjwYznivvO4us0err4ydxHNvHEqko7Etp1uK/Pw+5
         4ghJ1W3uV2LFFCRODOZmUhTAefmyJQ0W97ZrsusfLOgezwv2JUvl7Hv9ozkvZ53w7PD1
         cTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpEK1J9ov85h7Ey6/E7oNdGMSDCF0TLJapuXIPY0MpsdKHp/BWsa9GDzjKI2CGLup2ipu5SfphPlxdDZAhEAZ43EJAJpUmjXQT+kj79xs7
X-Gm-Message-State: AOJu0YxxPnv+Jeyjz4X/K8wAK6m6z2M9teiZ6hD0b8JNhsej8yUaPhnQ
	IZxjRC6KnRX19eOdcR1lNhUOWUNNCHKxSwX62oDvhevA6iPCvU75/Q3vUmpZGvg=
X-Google-Smtp-Source: AGHT+IGpGEuV4DVZ1kdf6ue+dBm6Ke4RvEdYp3g9xEjXsaFgOxYEd6wAXfkcbKsCsHOsq8Dy8bGbhw==
X-Received: by 2002:a05:600c:3c83:b0:41c:13f6:206d with SMTP id 5b1f17b1804b1-42164a2e9d4mr30060715e9.25.1717778096151;
        Fri, 07 Jun 2024 09:34:56 -0700 (PDT)
Received: from localhost (p200300f65f283b0017c92b05fa289d44.dip0.t-ipconnect.de. [2003:f6:5f28:3b00:17c9:2b05:fa28:9d44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c19e719sm58262335e9.3.2024.06.07.09.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 09:34:55 -0700 (PDT)
From: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@baylibre.com>
X-Google-Original-From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Date: Fri, 7 Jun 2024 18:34:54 +0200
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pwm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
Message-ID: <vunkvcpe7omv5tbsyw237hhauzyrhf6nujwvyv6vq5zd33udee@5b36qxbz5mjx>
References: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uegcep6av77uozx5"
Content-Disposition: inline
In-Reply-To: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>


--uegcep6av77uozx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 07, 2024 at 09:02:33AM -0700, Jeff Johnson wrote:
> make allmodconfig && make W=3D1 C=3D1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx1.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-intel-l=
gm.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediate=
k.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung=
=2Eo
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-viscont=
i.o
>=20
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>=20
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> This addresses all of the issues in driver/pwm
>=20
> Let me know if you want any of the individual module changes
> segregated into separate patches.

Looks good to me, I applied it to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--uegcep6av77uozx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmZjNqkACgkQj4D7WH0S
/k4LyAf+MocX0RpPC44cCBO/dFFZlEnU4+NMAXx+vRXpg0ASWbWuBgbMvXujfpeo
YRQZYgDgLp/7/FndOQIPT59C9fFbWz0UdLPSiT/MkN+cbRAoiaMXD5JqiTrORPFq
RFbNwOtXzQoRAEceczkKFb65oV7rwmyNyIBN9Vv3Ce/o+avvmlqdAziFU/smNwKz
en3MhIonz85eSOessjikio9bmBGGFzT8US8WiD8Ya8zcQUZ/i9aXH/verkoyfsb/
9hIlW/QY+mBn61RQeVHuF6O5W5Trnq4/sPf2TtnicRafEYBtwNFJRZmDviEqVp3g
UVN+CF/yOMS6eo/89WixvZXyYMNuEQ==
=bpJ1
-----END PGP SIGNATURE-----

--uegcep6av77uozx5--
