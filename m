Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2823244369
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Apr 2024 06:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712903923; cv=none; b=qFYIa7+QYpNja2ywpHjW10p8WxCMPYTAIixWR9bxOU0WDGD1yo6JUbsVRcqF4iCSfPCkgmuZ2B9jVTicXxeOrxR2CR8xmIzx8IcJmPGa3IgiBAr90oeGl4de/E06+3/seCN8QEr4H++2cV272XQKsSUMjltXzuB/wXVSSjhkKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712903923; c=relaxed/simple;
	bh=4x2KfrgMq05hQgb3lvrZf7RhsofllJIN9Syy9mnrSy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uhedYvHl+OHjJbjVBbotCkFeLrK7hcDt5UtKEYeSaDPQfC0BgMXCSP57ho3LtZNy0Gk86OT12v+ckpcUQFRuDLXHe2AgkR8KVMIIxcLRrkYsJdeQQTFBZxIqKg1Gom1dmDjgEUmgkZPUR/ODrrWYJPX5D4UoogUN4BoFNe4yHLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iRzz3ILX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iRzz3ILX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Wx9+
	8FQVW/rTnhb1ijxTvc3bilW4XTDoJsT4cbG8Oxk=; b=iRzz3ILXXkDqE0O0lFCP
	8YKdrItQjlanEtLoMohs7EjTPx8QSrDN56Kmnp6u6YhUqhO+4gLS036xAgYXJaKz
	OfN7Intb4vpA9l8ZJfqLICn9p2PFcuZBannoZ4hCBgtIRiMsPhu/QVy/1ST5PgE2
	GD62Ko77yr+qBEBiveGa0ubuqugkk66L6bx1tJ4ZhjUItIvbLocc20f4GUbUey4b
	XLSTKG4rhplAX4LTnlDhTgIXVJ83XBENi8udcGO/YKCMkSq58zfaLzG2T7lGeJYZ
	gnF9czjoQwihMfk3bum0y7M8TwQUOOicbonI+UHLzV8lV1hTNAjaBzcF2uiQ1TzA
	Ug==
Received: (qmail 1117732 invoked from network); 12 Apr 2024 08:38:39 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Apr 2024 08:38:39 +0200
X-UD-Smtp-Session: l3s3148p1@QlmfheAVorNehhrd
Date: Fri, 12 Apr 2024 08:38:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ARM/LPC32XX SOC SUPPORT
Message-ID: <xn4dyzwe4quhrpiqrvdikx4f46eucw25kmwfevcyt3s2mvggjl@enzbluravbt6>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, linux-i2c@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20240411050257.42943-1-lukas.bulwahn@redhat.com>
 <whpjtk2nmbft4dqndhealztzxh5du4uemqmmizguwvhmfa2htm@qcklwqf7j4d4>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nbf2sfufwpt2b6mt"
Content-Disposition: inline
In-Reply-To: <whpjtk2nmbft4dqndhealztzxh5du4uemqmmizguwvhmfa2htm@qcklwqf7j4d4>


--nbf2sfufwpt2b6mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -F:	Documentation/devicetree/bindings/i2c/i2c-pnx.txt
> > +F:	Documentation/devicetree/bindings/i2c/nxp,pnx-i2c.yaml
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>=20
> I guess this should go through the arm folks?

Could be argued, but I guess it is easier if you take it (because the
conversion patch also went through your tree). Just 2 cents...


--nbf2sfufwpt2b6mt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYY1u4ACgkQFA3kzBSg
KbaHfA//Sf5XDnct5b7HrOvS+QpTvEeZDhljJLw5j50jFvDh/oMBmGCSslr2LB84
fZBMXq+f+aSeX29rXkfqyOVi7fzjmNNSw+JP4v1wMRQusAlbyroh9yOugn3kJsks
dCWD1c+JtpHDU9hH6WAlM28SpeAmq9tFDpqg7zpwPi7ZfvlGTK8ikkcQpiNXUaN0
qYMeu0T3gASJYhCZmYvqRaeItw4ozE7bnAoXVpzOrGgauJjRcNpdiGaFUMzE/7eK
Zo66sH/tYbKjwC6cjX5vuOD37LsDqJ71hcXLaVKd3gP1/jJ7X7VMdI/x9RWIO7oS
7vr64mOuPReoRtV3q6jaMDMZLoWrOWuu8+XKdqZGRHCW8ScYqONxoUOHNNyWXHMb
jCU5RQpzZBu8n+JjhCtE6xixPJ3OZYGOeprNhT44MoB5fWdtoCYAgDl87aIcwIPk
8t3s7p82cwF+vNh+0fIaO9DSjKeeeoWAGHOjnv6R31bqr77nhYnJihXWH38EeiU1
6Ax2lWdgBTX2EtrwRYBDmm0s+0QOYVg/vbQP92HjnfM7+Wil2K/Q8tVdeG+0kGhh
xewG49ZceYdk2o6Fu1ULagl+1acVoqxCFpR0FyW1WJvmpg831vveeSKczow22gA5
l6JqkuUDtswt5T1M9XBzTaBRIXLilhLAkCc00ZTnD/jALN4cwcE=
=0R1a
-----END PGP SIGNATURE-----

--nbf2sfufwpt2b6mt--
