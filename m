Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9F13A4F30;
	Mon,  9 Mar 2026 12:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058584; cv=none; b=i97IAqK7zJrqxoQN3Sy4Ud6a4qi2IzQFyQbI6mlKxMJg3emZtaz9upjVRVOO8q2wsgNsSgInImyxlchTrAEzl1L8m3OPYTDjHRlbpFCtPWdJ0r7bc/B3eOi1zlW//oNsWODGZ0wlWQ7lp4e4ykqpXPmuR9WN9OxW69aQcsmDHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058584; c=relaxed/simple;
	bh=DYYmwym6ReyVABIh9NRKh4ITZWKOfAAlNCfJkeZnmYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kFT/e54IeZyMwVaulZrly0TUY8q0aqSRt1Bhf8zASwk2mPDo/NYoCif0UNMaxuYcxWGMfxEou/isSiTHysAS12zx3gXBS/7M2SR+q8IMuHRSXIWU3GCMMVfusCdPRiAYlRebAn9Vq1VtPgLfszJ+fND7U7yqDD2qH6/fr7SOdGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSR4u5tx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSR4u5tx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EFBC4AF09;
	Mon,  9 Mar 2026 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773058583;
	bh=DYYmwym6ReyVABIh9NRKh4ITZWKOfAAlNCfJkeZnmYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSR4u5txd1hoGn1+I1lcfU/56UN2uA2t+S26w3iLZPX2CrKyVgNmNaCQpz/VxMRrr
	 dO3cdEwQc0rZPRtGQy5zKzy4khHLZTG5YCQkI0ajyVpzgdUoJDXSr4wHApLQtBFUcH
	 iP8JS+Xnh3dwFevqkNtjpLb8YrjGgeejQuVnuV4GfpaApWRIgpf0S4xrGqqdaTIvsQ
	 MnNbnF1mKhB2AeH+vXOZC/QI/k5DDT4d+h5FJazf3j6sX2B4lIMqwNW+8XHxTCAMXf
	 lFDZyNLVn86HhZlfKdzAsujuR/GX8euLsq8zNENjvu2Qa8L98TOGCvCMLUelBGOKk3
	 S9ODFtzAOKGKA==
Date: Mon, 9 Mar 2026 13:16:19 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
	Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
Message-ID: <aa65s_alHWW3woUb@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
 <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
 <4aa2fc38-3c32-75a1-161-1c90709252be@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kqlfy2xevpf6bsix"
Content-Disposition: inline
In-Reply-To: <4aa2fc38-3c32-75a1-161-1c90709252be@inria.fr>


--kqlfy2xevpf6bsix
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
	Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
Message-ID: <aa65s_alHWW3woUb@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
 <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
 <4aa2fc38-3c32-75a1-161-1c90709252be@inria.fr>
MIME-Version: 1.0
In-Reply-To: <4aa2fc38-3c32-75a1-161-1c90709252be@inria.fr>

Hi Julia,

On 2026-03-09T12:59:48+0100, Julia Lawall wrote:
> > > +
> > > +//----------------------------------------------------------
> > > +//  For context mode
> > > +//----------------------------------------------------------
> > > +
> >
> > Please omit such extra comment lines.
>=20
> No problem to put such comments.

Okay; thanks!  Although I tend to prefer without them, so I've removed
them.  Also, a majority of existing scripts don't have them.

> > > +@depends on i&&context@
> > > +type T;
> > > +T[] a;
> > > +expression b;
> > > +@@
> > > +(
> > > +* (a + ARRAY_SIZE(a))
> > > +|
> > > +* (&a[0] + ARRAY_SIZE(a))
> > > +|
> > > +* (&a[ARRAY_SIZE(a)])
> > > +|
> > > +* (&a[ARRAY_SIZE(a) - b])
> > > +)
> >
> > Extra space characters may be omitted directly after SmPL asterisks.
>=20
> No concern about the spaces either.

Okay; I've kept them, as the majority has them.

> > =E2=80=A6
> > > +@r depends on (org || report)@
> >
> > You may omit parentheses here.
> >
> >
> > =E2=80=A6
> > > +@script:python depends on report@
> > > +p << r.p;
> > > +@@
> > > +
> > > +msg=3D"WARNING: Use ARRAY_END"
> > > +coccilib.report.print_report(p[0], msg)
> >
> > Would the following command variant be a bit nicer?
> >
> > coccilib.report.print_report(p[0], "WARNING: opportunity for ARRAY_END(=
)")
>=20
> Either way.

I've taken the suggestion.  Thanks for the review!


Have a lovely day!
Alex

>=20
> julia


--=20
<https://www.alejandro-colomar.es>

--kqlfy2xevpf6bsix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmuuhMACgkQ64mZXMKQ
wqlD7Q/+MC8nUpjlK/p9rr3OlX/h0Gt6qYb3vFL+1+Y7660U0CQL2Vm6fbrGNXci
P8etesjkt76rIR95FJTNxXhAXMeESb6GBm06BCg++RRDACo45PbueJuv7tqlgccS
1dKN7qEvwrEiNbZpGD4vNMaNoXk0MFmjU5weHHmqjNm1MmM/CqLnsiM7nQdFoHkn
cxqiG7VQSNKPWZ0/p4eGPphqPDQWSsMW4SRdF1FqwCCbgnyTZIMbLHZ9SqP261v1
nkcnkQU/ZNJqNUTwunB916S8dI5PsOBYRs8rl07iFXJPOCApnL/uC8Px+UI5WZIv
5dZt9YdZag5sUx7Ln91UjwKINUrjneAOTuAPPuUAf4HZuJmIPKL2vKvS44rdEtsO
idSu0Bly2q3cpcDcNS3ou9J1+zdJsSu3PoFfLesXX28uCYdF6oT9s8m1XxvQM5zi
aSoKoG8ZD2O5YGA45xXJ0ZUsxQIq6HC+myPcVPtLWVHIHo/yBnk7b6TmCn6HgMQQ
TSDgxF3YVCqS3xOPoz6LRdTBBPFxz9VF3lV8XKSpMaMnVJgVRoyHmxcJurIOzui+
9Z8UxtTUfNFOVW4y8b7lyqYFU2bfVLQUbFJ7dHk/at8FZvmFEcnbR4WhWxKXPQ5r
LYGj+lCzmOtl912j6MjLeJNv/8sNRWNXYxFpVjNqs2ha7o91Y+Q=
=Fthy
-----END PGP SIGNATURE-----

--kqlfy2xevpf6bsix--
