Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A420B149C6F;
	Mon,  9 Mar 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773059259; cv=none; b=pgXbeGOKgjPFQXsyVe4ZeMxGNI4ixdmrLwy+RajZ9LbQBDU+nAAuH4KfzAhHTQ7ILZ4d7svNK5ydz5uMm3AZWhq1UMWGAgmUe5hcQZlC6A47l2nGE76MF5kOrmkmSkfEDBw4s7GuFdmr+GmjARMQYezy4UsspW5jE56h8UuyeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773059259; c=relaxed/simple;
	bh=mxdR8fwPMiO9dwW3dq0N7ILQo2x6FJ9Ozd6bJ3wCtYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K6xvJ35JvvsHFdnwcuXZwkJFrBWKo5zH0mnuUEyPcxTTT39+st0vMa3bgVAlN6GVs27qK0/laRgawSXCdBrDTBkQ+R5hS0UbzrNbB/2rGlJUlyq9YmXGgoYjaPR9n8awKwiYDY7wsZHkIOKRDcvYp2axI69i8ZiTQbwk6Be7Nio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0av7iU+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0av7iU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070EEC4CEF7;
	Mon,  9 Mar 2026 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773059259;
	bh=mxdR8fwPMiO9dwW3dq0N7ILQo2x6FJ9Ozd6bJ3wCtYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J0av7iU+SWenB6JjyRvktEcZkTx5rmkuWGIL8bFL5i7hqzmhrtr0WqbaEbPUHf70f
	 dINYgCodng5NiABBK0EiRqsB7i/MA3jBzWF52hkbBszkuAbcuaYwTG3iofABPmdsRP
	 oPSuejFHfR3OZrWteMx70B//Z5RiT8MWCRNxWQznaAQ6lEC8FdU8l1mzq4J2V+XLym
	 kT50PzEYhywIQRPscJ/oPkq0CjWjiGfpvAZK3MTcfpOYpfONx62yIa4V2oOIN9DvaS
	 HCIFHk9BnLCOxbDfw+Q64XpQMbjBFZLc58bzQKNRVMtgwFmGQgSQM4tmdaEXj+6uuc
	 OFV94jp0SV4Nw==
Date: Mon, 9 Mar 2026 13:27:35 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, cocci@inria.fr, 
	Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
Message-ID: <aa677-Ag_KU8QHjh@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
 <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
 <aa6vSvsp4J6InmiB@devuan>
 <f950c541-1c21-7d5-b7d7-1a14bb6e8a4@inria.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cd5ltaszjzcae4y"
Content-Disposition: inline
In-Reply-To: <f950c541-1c21-7d5-b7d7-1a14bb6e8a4@inria.fr>


--2cd5ltaszjzcae4y
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
Message-ID: <aa677-Ag_KU8QHjh@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
 <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
 <aa6vSvsp4J6InmiB@devuan>
 <f950c541-1c21-7d5-b7d7-1a14bb6e8a4@inria.fr>
MIME-Version: 1.0
In-Reply-To: <f950c541-1c21-7d5-b7d7-1a14bb6e8a4@inria.fr>

Hi Julia,

On 2026-03-09T13:21:23+0100, Julia Lawall wrote:
[...]
> > > > +// Confidence: ???
> > >
> > > I hope that a more reasonable value can be determined for this inform=
ation.
> >
> > I don't know how the scale works.  I know the script has a few false
> > negatives, and AFAIK there are no false positives.  To what level of
> > confidence would that belong?
>=20
> Probably high would be fine.  The goal is mostly to indiacte whether the
> results are most likely correct or whether they will require a lot of
> study to know if everything is ok.

Thanks!  I've put high with a comment about the false negatives.

[...]
> > > > +// Comments:
> > >
> > > Please omit such an empty field.
> >
> > Ok; thanks!
> >
> > $ grep -rh '^// Comments:' scripts/coccinelle/ | sort | uniq -c
> >      34 // Comments:
> >       2 // Comments: -
> >       1 // Comments: -I ... -all_includes can give more complete results
> >       1 // Comments: Comments on code can be deleted if near code that =
is removed.
> >       1 // Comments: Some false positives on empty default cases in swi=
tch statements.
> >       1 // Comments: requires at least Coccinelle 0.2.4, lex or parse e=
rror otherwise
> > $ find scripts/coccinelle/ -type f | wc -l
> > 76
> >
> >
> > It seems around half of the existing scripts have that.  You may want to
> > remove those empty comments.  I added it because the scripts I looked at
> > do have it.
>=20
> I don't require taht an empty comments field be removed.

Ok.

> > > =E2=80=A6
> > > > +@i@
> > > > +@@
> > > > +
> > > > +#include <linux/kernel.h>
> > >
> > > I doubt that such an SmPL rule would be required.
> >
> > Okay, I'll remove it.  Thanks!
>=20
> I'm lacking context.  You maye need this if the file doesn't already have
> it.  But it is hard to know if it could be include indirectly...

Hmmm, this macro is defined together with ARRAY_SIZE() in
<linux/array_size.h>.  I guess even if a file isn't including that
already (including indirectly), it would do well in including it for
using the macro, so I guess it's okay to remove it here.

The only concern would be files that *can't* possibly include it (maybe
tools/?).


> julia

Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--2cd5ltaszjzcae4y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmuvLEACgkQ64mZXMKQ
wqn6uhAAhRxwUq+7FMbWfJuKkdY+WdePvmNeYDMlxXAfzK17buNcjfTj3Z1ZzIBk
ZcuW9hxVH5UhWn5lFlSmY6+/8rmUB9K/EI2pERtbIlG7qEwOuCLxDLxuxsqyX7Yc
Tw0c7kLWDlOm9yRfrLzFiQHKzD+i8pq0XyInERaoi9rY3D7mezQ2vzb2hxtFUStt
kwnw1lvxzzLG7f47h4MfdNT/N5Cjct09rg/Smd5CkWmR135OwqcvorA2SKXUCH5s
N3ttS469atteNtxMdSYsaJkkBhUwUXMnt97l4PJp/u406Y8O0lnDvUV1zD9PrFXn
iDLl+lEJ2d1drJDXxkVbf2jvHodqCSIdPSN5jzFgUTW2UfShItCjS7hbM9SgJjmZ
5Q+4kNMRs5qWdZ2duWiOIb3vB1b1AhICEOZLlu2WL2cNRiQseWZFYYSGlCIwSRvk
xxuicHNf/w4pZvAIJCuSkbBnqbbbiDJVgFtUh28Ex22CHHIvlXGpyc7TBAT3Z3PV
Qnd5HyEoYgX8fNpYkl/tg8i06ftakB6uA6S165MiehYZ4/VyAupSyMYYzFjRIURl
2hRkrwvhAST3PNnbS91TQLljOO7U25rid+mlVP8J7v+FlJUyKIn4C438NpUmBeSD
i5y3lX+nk3J05Jq6PB4p0htMORILogUCjbY4Nu0cXzqgQxb2IfI=
=J0wJ
-----END PGP SIGNATURE-----

--2cd5ltaszjzcae4y--
