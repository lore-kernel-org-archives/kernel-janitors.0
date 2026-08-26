Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC73847607A;
	Wed, 26 Aug 2026 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769593; cv=none; b=ajmFRFSXQfZBDToaiSopgumAjRNsxzPNmspY7p2xfMVUG798Mf+A5lyEGQrpVR/BXdG566x9VkD4TOIW5EmHt6UzyU9qk9i5AegkUt0WDAOE4S/fwL4nqIj9FsRXvxoPQVFtZ6l7fqS4t7EIkF7C5JnNxdrTvHDBdaYq2jpkM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769593; c=relaxed/simple;
	bh=RXdCSlZlIXBpMj/AlfHkeBGm7h6CKN25XnLG6yDy0fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6XevVXHAma3VT/5Pctp6q3j/isL4PoOeAVstPMO/Fjop7kmsKf/BrbOrX/tiLAHDvy+u7acYSyyXv22b4qxofeD7g6WSU0ANbeZ2aEx+7O7xNr1jT1CQKS2mIBH73Qdp0g5qIurzRUymeb2dujlKo3QgzDyX90sOQ1t7bgRtFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RN2tDEKl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RN2tDEKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E54B1F01804;
	Wed, 26 Aug 2026 18:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787769570;
	bh=RXdCSlZlIXBpMj/AlfHkeBGm7h6CKN25XnLG6yDy0fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RN2tDEKlNXDhjzjBEuzotwQJmaqn0lyfcspcQG3x9oHrZ+FSmHSniaMZ4EBGMiHS+
	 IMtUPmjmRXnAeEfdC9TzMC72BKQ1IuXjCf4ZIiXM6LQaQ6etQMG75twB3Yc2SFrOSq
	 ey5uRjFeNe/YVBK12fBEF/Z0fDYWgodjSXQNund7BSKW2ib4UyJLLZmi7DKX987VvA
	 cUKcm65Pko9wc9iFnfo2BK7tdgpZWDjLGU4NnOZf0ATR4uC3oOleeuQqQuCIyXs+oY
	 qtn9c7nDZgrD9nuWQOawlYmoC0tasmxs/2o7DnZqeqobyzeBsu35rcf0M6Yku4BCf4
	 W93Y33q6FOBjg==
Date: Wed, 26 Aug 2026 19:39:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Yang Zi <2959243019@qq.com>, kernel-janitors@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] regulator: max8649: Fix NULL pointer dereference in probe
Message-ID: <0f550622-5a14-47d5-976e-44a20495d751@sirena.org.uk>
References: <tencent_87EA54368697A49844A89DF7CD19CD8C6C06@qq.com>
 <29d4c995-4194-49b6-8994-eba662b73b56@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K03hu2cMtzAtW5Fp"
Content-Disposition: inline
In-Reply-To: <29d4c995-4194-49b6-8994-eba662b73b56@web.de>
X-Cookie: Obey all traffic laws.


--K03hu2cMtzAtW5Fp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 08:36:29PM +0200, Markus Elfring wrote:
> =E2=80=A6
> > Add a check and return -EINVAL when pdata is NULL.

> How do you think about to perform this data processing
> directly after the variable assignment?

Feel free to ignore Markus, he has a long history of sending
unhelpful review comments and continues to ignore repeated requests
to stop.

--K03hu2cMtzAtW5Fp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqPMt0ACgkQJNaLcl1U
h9Dcogf/WZfBc8qxjiBbVaujXGbwMRJX0V6OX4DMqCCnS+AR0EHTbfR+MBJI1dTh
2ibiM8+9FBNOJYaN45ff6QLYcoqcTIGwReMS28bFDk1foPs9KE+GhHdeiqo7gmpS
3pHBGJO2ATnrsG/KnGpJWwbRh/+xpf3zy4koVKyj/9sos2kAehV8BZ7RVCwLjCLk
paO7d1BUUF23qptYOTQW2qUg0aYja74nyrEzz01NPZNSnZ7Q/cK8FmECkbBaDijk
M8OjmZikpYbfOli/Cs5h+z9+EMEgtkAGkQbsJ2ZC/sHSKi/GYnzPKKVqs/RqnVKI
aUO2UokUvJ5LvcVgQvAoWfbx4p1w+w==
=BwUU
-----END PGP SIGNATURE-----

--K03hu2cMtzAtW5Fp--
