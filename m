Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1879E1B9830
	for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726213796; cv=none; b=honP0mGPU7XOT0/44780QiVYTEBOYseMV8ODkb0NjkwRQmd8QnwDYiY9wKpHnS1urbrspCyijVQtGx26h6OcqLJ9AAy/bcjmXGvZcvWo4gjJQvfQGV+wxCxQTuQbPXs+o+hhSTOvPH837utEih4f/hTh06/TvpILtN6METi39/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726213796; c=relaxed/simple;
	bh=d6zsnM/knWuhWRTJbnRit/W8yhma5FuughHftgaJJpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaoOSeJLrn+aXiDds+4NzViI/s1r35wAcwYkB/hbl9j8+R+V1itFgjUUHdBSpiPpPr1JpGSbxilO9xoAB2NkBZfmE3AHW7z30eKkHftEXoN11hFCR85TPwEMLMwCblYHgeygWvbVxawJUD172c1vtnESe5X+wKntdmTS4pOGgeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ajSp0G3I; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ajSp0G3I"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bf01bdaff0so738994a12.3
        for <kernel-janitors@vger.kernel.org>; Fri, 13 Sep 2024 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726213791; x=1726818591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wa1ITqdE5/BK8kA3fdLjh8dVT7wr8VufQbhlGlfKuFA=;
        b=ajSp0G3IrAnphgfmGOGn7W3zg+N+b87LwNOeVRzN3MjRzaiZD72YbNzOVtEE3CXld2
         Q2laF/IzzKW36f/RCXz/pUcIUptbg4p7W8rTA3A2kWacbFUpCdQxTYnSFEvU1CtyR9fy
         JvQv3EvoBwe6oGfDQc9oGp8vI38eOfvyz0n/8sdTYoFPx1djGy+m8aKb/UkEs8csiHYO
         CE3vTdDqkRUGslkWlKBeyjdIBJcD1fMhu57IzIS3i/K+4xGl+ZDkydiC5QLuVIducHsB
         aHm5aQPeN3nh9SjOgGnOwm/GgtrUq+pOjzV2ufiplFy26f7UpoLb9m+8VsV+CQHMRdVn
         Ghgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726213791; x=1726818591;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wa1ITqdE5/BK8kA3fdLjh8dVT7wr8VufQbhlGlfKuFA=;
        b=bLznXPP0pfX25s8NnltqWU1OpLf1Qk3zQznvyVTyk2LgA3jUzGxwygcOBy0FoaZHYl
         Sm4aTasKu7zP6A/CCdJHsJyRPpuE8y24ucrndSK3MC3+wwkz1EewV9OmLQZ4MErpQ5Ax
         UhBzNnGj2bmqWL3evJZ8JGS96uyUlffUtsxIyRv8GvAIGtOTyHIkK7KProxH/u8dhaXp
         ERlKJBvQe+dOP7WUszkJSstz9wwLFyLDnUDGTeslWCSV30TcJ79DKUv0Jfn1ecG9AMtK
         t5Z4D+0ZFnF2wA7trr5WOhtWbKfXaFPdFKBD5RJbU3w5llg439TryXxuB/pb01rMaSNk
         J8Og==
X-Forwarded-Encrypted: i=1; AJvYcCWqb2y+nTEsZHXO449YkcF8KStVWZHf2mCTeZB7Biw27DW1p1U/CYBgz+39yYyrVUZLZDSnqcsgSlUsp2MOxY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlwy/w6S0QhKDyJY9BZYH3uM6puPnIKHAMEZ2DtH4QGynLRP0b
	X290CT1e9xIbmZtGmfJMpN4TkrONWm9ObdA0P5hgwUPhMOV50Od+5BCXsX1z9Vg=
X-Google-Smtp-Source: AGHT+IGNol1Ptrv5HMztO+XGTt6sF30N0ildaSdHGkDcLQdc26QC+9nMuku9fBuokfORM931FkSPTw==
X-Received: by 2002:a05:6402:1e90:b0:5c2:4dcc:b911 with SMTP id 4fb4d7f45d1cf-5c41e1b2531mr1444970a12.26.1726213791184;
        Fri, 13 Sep 2024 00:49:51 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd42620sm7231754a12.20.2024.09.13.00.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 00:49:50 -0700 (PDT)
Date: Fri, 13 Sep 2024 09:49:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrew Kreimer <algonell@gmail.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] pwm: stm32: Fix a typo
Message-ID: <hecpzmymii2aoqc5lgkycmxojin7gmrtyd3wnmhxcgeklnioky@vjkxayxmswzc>
References: <20240912124944.43284-1-algonell@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="332t5ftlx4yomxqi"
Content-Disposition: inline
In-Reply-To: <20240912124944.43284-1-algonell@gmail.com>


--332t5ftlx4yomxqi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 03:49:34PM +0300, Andrew Kreimer wrote:
> Fix a typo in comments.
>=20
> Reported-by: Matthew Wilcox <willy@infradead.org>
> Signed-off-by: Andrew Kreimer <algonell@gmail.com>
> ---
>  drivers/pwm/pwm-stm32.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
> index f85eb41cb084..eb24054f9729 100644
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -222,7 +222,7 @@ static int stm32_pwm_capture(struct pwm_chip *chip, s=
truct pwm_device *pwm,
> =20
>  		scale =3D max_arr / min(max_arr, raw_prd);
>  	} else {
> -		scale =3D priv->max_arr; /* bellow resolution, use max scale */
> +		scale =3D priv->max_arr; /* below resolution, use max scale */
>  	}
> =20
>  	if (psc && scale > 1) {

Oh, that's an old one introduced in commit d66ffb91c374 ("pwm: stm32:
Improve capture by tuning counter prescaler") in 2018.

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Best regards and thanks
Uwe

--332t5ftlx4yomxqi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbj7pkACgkQj4D7WH0S
/k6oEwf+LVChmqpZHYi9IgqxWAzp4xco9NwQ1aT4QyzvcrFPgE7d19tn9zTdxMzg
o3OTYwnhSwgIXfYNGkvu4OOjjhuivZqLJTgvv8W6foS+s1unjMbD65u+nxfy7ih6
YBFF1s5RYjPvVYh3cOhdwQ7HDR0V70ROQzOMtMvOlSqvS4b4zqYKY6GvxOW5cxsz
5285CZZJAZK0dH9W4W0DDk9vkcfflnGeqeBFzL50iFf7cssTGobrJ+Unyrx2LmSx
RiULRREupUOiCtD7FC3b1deLpNTzkLuoq8VSldVbFDfCvtR8zMUoJUm9BbiyoJFC
IyL+b/z5ypu86BarN8XpL25to2cg2w==
=8Lhz
-----END PGP SIGNATURE-----

--332t5ftlx4yomxqi--
