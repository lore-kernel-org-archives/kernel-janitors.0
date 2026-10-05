Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7854848986F;
	Mon,  5 Oct 2026 13:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207080; cv=none; b=g+3KQh/c/wQpkCS6RDVL8NPNCnlHRJkt54np9lglw4uLQIM3bH1bso7gFtwA+tBVhSFqK6og6YojtMvea7/5J3+lc5/l0B9Nv9zyqv3MsrgUsx+ItJK8Ulwuy2jyeT8SSghdqSPoEiMH3IcPOq1cLzvn3L2ulEMRK16kumTjjRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207080; c=relaxed/simple;
	bh=wZ5K0oLwSFm+W0CzJYR45zy3tF154x/ek22CARy7A9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=stGUc7kaO2Dv/MUJ1OsnUxMkDJqZdyn+2hJly8ovXaQkZTbVxnUreqmTJHXK+B3EKHHRyInzU71L37wMWpjawnun9ZPhq7RIX+e1ztAMl7JM81d2UyltwEXkSbo7ZX94KiJIB+vNm9INl6Xv7d0OXD8CVZhKNxoEsa0fR1jFU5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7DcCw+j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7DcCw+j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D2F1F000FF;
	Mon,  5 Oct 2026 13:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207079;
	bh=ZwsTN1+zaw/6uT96xfGA1p54TbfeiALzR0F+UocRgag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P7DcCw+jvco1+70fSFL5RaM0iQTNQaXml4C5TE+Qa6dqlgS4qOCS+80aKgVYa1Zag
	 Ug+ntCL2U2s2TII8Hwty1xmu50eVj3FE9bnLlEAOGjgpKJXkn/8jKdDeMJj7a0aLll
	 WnMdvXMVnLFx/HMCl1iFRVllvudJoET0NqpVK3SNWUq5A7nKW8W5m043kgewzOQgMC
	 GLoMOn+6Ad0WmmmBBQa76JUmC9lSn9cOq6nNbiUL9KiW1HPzfI6euIqcVDXQlx3hTa
	 veBcriFsQOVCkzj97QqnfBly7xrec9vKqHaZ1I2Jrd6i9MBUW117EoJCRju4fg9UFF
	 vS6b+r+tjnQ8Q==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id BA84A1614818; Mon, 05 Oct 2026 14:31:16 +0100 (BST)
Date: Mon, 5 Oct 2026 15:31:16 +0200
From: Mark Brown <broonie@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	Colin Ian King <colin.i.king@gmail.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] ASoC: tas2781: Fix spelling mistake "config" ->
 "config"
Message-ID: <asOmpNMdmZPJXYyH@sirena.org.uk>
References: <20261002113953.1782731-1-colin.i.king@gmail.com>
 <179113127609.150114.13801161604243660987.b4-ty@b4>
 <20261005132644.583ba73d@pumpkin>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jzNruwRuHEcxcyV"
Content-Disposition: inline
In-Reply-To: <20261005132644.583ba73d@pumpkin>
X-Cookie: Use the Force, Luke.


--9jzNruwRuHEcxcyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 01:26:44PM +0100, David Laight wrote:
> Mark Brown <broonie@kernel.org> wrote:

> > Applied to

> >    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

> Did you fix the patch subject?

If only there were some way to check:

> > [1/1] ASoC: tas2781: Fix spelling mistake "config" -> "config"
> >       https://git.kernel.org/broonie/sound/c/7d6adf283a83

--9jzNruwRuHEcxcyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrDpqMACgkQJNaLcl1U
h9AdEgf/eY53x5m/7JbibGOLVBiyZ6tIpIUlal3yOQRjyKUWH6pMmSP2FXcR8UPy
iZrGLZ/1hqwfrbyykVWIG/PWkdc2e4582H8I5AZ2l8z8glEWXQ8VpUhbv9n+bL5z
2oP3eL/fo+qB4TcbydeovQRwrWAjXVQcRgVckBcnu23ba6IFW47N6idqOSZZRyXS
ET6DDhg4Gp5Y6vJUq7R8tAZ21qCXnhuOIg2lyvmgbNCQroiEMqfMJZ2u/UAKsfKr
mwE5KqXqVnXqWegP9wTyxP09qiKpJeVawqV+9ksGynXmBbgzK55bKb2GwVlm/jRU
leRPi3FJraVer5JRIp2QMmN34JeGmQ==
=pDvn
-----END PGP SIGNATURE-----

--9jzNruwRuHEcxcyV--
