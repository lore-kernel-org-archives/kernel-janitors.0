Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2976930CD95
	for <kernel-janitors@vger.kernel.org>; Sat, 18 Jul 2026 21:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411278; cv=none; b=MtlaHQB2QSLTVPtoimJ9pE9NDJBHwHXegRgM973sEZV8GsXMwPxmkviGsMeFYOFgYayUVB3N1b0tV0hWftLIg8I5E9Rgr94osxuFRcwyVAqTHAFDNIQJFqxG87ttQMmmYvMyRUGxJtluJHyvsi6/rBt/7zgMN2BWHpTKL7zo9r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411278; c=relaxed/simple;
	bh=LSej48dHmbtGy45nBhv0MbNaCCnVPoeB1r++WlGI0W4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPJtapph5G7aG9KPONSUEYqWsrhS+iFAvQQbWcwbnn69uFoXPn/C94KsTDQYhAZ+tjH9t4NPBAS0KzmA6KFN15vOTkK+BoE+RidBkFhpRi6hV9lfJopjYVYQ0ezJXxMITTQzRECAPckzxeqRCyEdJg+R2iEzLl+3GdOZxhPHL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gr4yElkQ; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gr4yElkQ"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-47de008b020so1986399f8f.1
        for <kernel-janitors@vger.kernel.org>; Sat, 18 Jul 2026 14:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784411275; x=1785016075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LSej48dHmbtGy45nBhv0MbNaCCnVPoeB1r++WlGI0W4=;
        b=gr4yElkQxRKMTEdSowsfeHiVMXyt4TCAUj0tJpuJUvTNiyYqcJpk5Tyl5u9wQmCnc8
         t2IfJvCN7sKJQkWyKQ9V4N25a5LqmMQ2sRH4J14ZQwqGhwYmWbiK1jCZWOiRY4cewihO
         BQo7QnLibH8NTPmotrVIhY2+ymzAqAaExI4TeYlV7QT2/rqBkwWHZIFIjmLxj6jkWCeq
         dIxZjEVMfnJ+BTl1Kr+wUwQRjLGagexb1z8LPU3jvddArJT9vGbb25RxasDJnKLBICzm
         Jeu67852MtoSjC7xiWdVkwBn9cxiclALfmViEITrkq1Bgc6HF59XeFViM0oHOWlEE5LO
         t/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784411275; x=1785016075;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LSej48dHmbtGy45nBhv0MbNaCCnVPoeB1r++WlGI0W4=;
        b=onJnUbveLzqPSgQzmkAYD6pPx9ogyPlTLsxXzH9L2ugcKcDIC42mm+mXMrn0zVeeRK
         m2vyumaSPJTgkyfb1ijRs8nl5paKDPmf+aaiuF5lNYq6ff/AyPxNgHSjPETrZlYKON2g
         j+34elWifRm2S8fY9PuwAEn8C6oc2Fz2aFMe7BqImH/3iOonOVKtnxnyqmBQT1Ye50/B
         esq3APW8MSfQNpxgd+MtzSUeFlnW3tF1VTCkP0FI3UC9UKuu1ipr3r9yP27fUVI7gJAS
         5sSZGHImZWlKUcJiPiQXwO0enjB+UXj0gk8JtYs0iA11f1ESFbr568CysGrOOmYmrq21
         n1HA==
X-Forwarded-Encrypted: i=1; AHgh+RoiJIX2RA43qi4aIt/OcRwFKTKpsp6/PGMlzdzW1iNemoXVwB+Ij4ktwKsM/UIYM9gD6xmN1n3L7dtqvS/JN64=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyZgjhFs1sc5n+J4kLTWXh3oBfCzVnb75cJoJOlCKbhniUJLz
	EwsIpbz4cZyoGNIZRlqaEKxpEWHzioXD7py/43cvboV/RnJx//xD4MgNdJ36e63v9qI=
X-Gm-Gg: AfdE7cncStwnYMcpZ11GDxyMpRbO4pSeJ4Sw6rr7Axlil8orCin5ThtbgVcBR1UM1ln
	dGOOm52bIk4tmir1pNde1Gbrp46vEiKVOPm9CtcV3oh1fKNVTLRi+NPoXEiUUat+YSGn0IkgIKG
	DUTpSXy7jCdIuXdidl/lQLqGFPdIQXPlzo1ZJ7tFj4EiTyTYa6xGc+3MXQvXLvh39GHRWjhJ5Jt
	BzDTPN52y+1kWgN7tz/f4b+gb6oEXCEtqfCOoJRdoEgC9HhGyD3geZodvg000ymEtRt2IEoWTiD
	b98DwLMZmcuQAfgD5XflMHTDuXA9WrOppuDDdD4nHpoFfG8apkkLyk64t5uzgabn+wnY0WER3nY
	CT2j+Mu4YP2989vMJ0P26MDCbTAOTLeTt1VSdsH+rJJdAdYud3jv03wRJJdGAFK2+4Gs9Biy2Xp
	xCqzwkuqs=
X-Received: by 2002:a05:6000:2509:b0:46f:1b89:999 with SMTP id ffacd0b85a97d-47f5a676c8emr16623315f8f.30.1784411274957;
        Sat, 18 Jul 2026 14:47:54 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63eeb360sm16216646f8f.34.2026.07.18.14.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 14:47:54 -0700 (PDT)
Date: Sat, 18 Jul 2026 23:47:47 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Kees Cook <kees@kernel.org>, kernel-janitors@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: fbdev: arkfb: Move a variable assignment behind a condition
 check in ics5342_init()
Message-ID: <alvzxjwBr1gxu3Eb@monoceros>
References: <36d0eba7-e78d-4a06-95bc-c97d9b91f8f0@web.de>
 <40d5e392-3f99-44c9-b30a-3481f60143ba@gmx.de>
 <550584cc-863d-48c3-813b-3a0cb45d9084@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f3fkxfadp6qkpugc"
Content-Disposition: inline
In-Reply-To: <550584cc-863d-48c3-813b-3a0cb45d9084@web.de>


--f3fkxfadp6qkpugc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: fbdev: arkfb: Move a variable assignment behind a condition
 check in ics5342_init()
MIME-Version: 1.0

Hallo Markus,

On Sat, Jul 18, 2026 at 10:34:33PM +0200, Markus Elfring wrote:
> >> The address of a data structure member was determined before
> >> a corresponding null pointer check in the implementation of
> >> the function =E2=80=9Cics5342_init=E2=80=9D.
> >>
> >> Thus avoid the risk for undefined behaviour by moving the assignment
> >> for the variable =E2=80=9Cinfo=E2=80=9D behind a condition check.
> >>
> >> This issue was detected by using the Coccinelle software.
> >=20
> > There is no "risk" here.
> > It just adds an offset to a potential NULL value (which isn't then used=
 afterwards).
> Does your understanding of programming language details differ from the v=
iew of
> SEI CERT C Coding Standard (from the Carnegie Mellon University)?
> https://cmu-sei.github.io/secure-coding-standards/sei-cert-c-coding-stand=
ard/rules/expressions-exp/exp34-c/

We recently discussed a similar case where several people told you that
the "problem" you fixed wasn't actually a problem. This patch is in the
same category and your reference doesn't match the code touched here.

Please stop to absorb maintainer attention with useless stuff.

Uwe

--f3fkxfadp6qkpugc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpb9IAACgkQj4D7WH0S
/k4yugf/X7EoA2Tt7mChQ8eG4wWf3eTDK6E37TtKWLPT3R1witunWCOP7nOhxZc3
D139hRqc3qXlbwDBHpZTY0c+y7G2EE/7aBrnnhF73GmWLJaSb+CQ2WVCbUuMJ4kC
qPGNY/7HaxPwlylhjJSxmeBt1JtxWDy6qAOgR78JEDzCVSN9+aWL5fFL3SFQOJhR
OjLghlkWaKckJbm//CWA3NLVNHAgFZq58ozqVfTKmXKmKqvYH+iARxU8+V8jfPyV
nFaA9mHT7NuhT+oLzm6orz0tQTgvszXI6SpaGBxiXoe1gbvexg+4MArqV19Gb11W
7j6X45B9ImkYY6zrD6JK3heICJiHbA==
=5CWK
-----END PGP SIGNATURE-----

--f3fkxfadp6qkpugc--
