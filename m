Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641F13A9D94;
	Mon,  9 Mar 2026 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058226; cv=none; b=DteADlHQv6YKDPoKkhpnXU0HqdBwc3olfHg9zsoUTmfQMa2QEe5gZ3GLMG2R/97m9wA5FD3SORB6YntD2mQwwatgRxYdOi57JLSncGLL3SHeXGsmnOq8Ya25bfmo7C9cAI3KIAetyPBPYlyVlcHmD5dWjsPtlPaVsvGOrORPl/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058226; c=relaxed/simple;
	bh=Q5cOPE6T5rdZ2KwqIlpqd/NhV8/TkqTjqCcs/GNI4mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtNakav2t3PnMRREJrsR4Xe7bZI1dI/0w3/HHpDZGH9OZUvsVOo/BpUGej40JP3e6IiW1cxtkfWOVK8bx+MM83jsalHAGyjH8Uog6oXTSFOpe4PC1Fu8UbEmKONf5jQq3EixwD1ujL9B5EBEEaHMvF2Q3jV4RH8Fa+hcf8Q1Qw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZrSkZ9u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZrSkZ9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3D0C2BC86;
	Mon,  9 Mar 2026 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773058226;
	bh=Q5cOPE6T5rdZ2KwqIlpqd/NhV8/TkqTjqCcs/GNI4mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZrSkZ9uw+K+Z/G74mQmuoVzgSgE+ZrcP0eihZh0CVp6GsUe7BT7PwLT9m0/XWw8l
	 MaMVu70b7ejsOI4m61mluJcgIMq2E2uBdv5g1iOJeZzdt6I580Rd/SIDGyFTNdEztb
	 qfSlXmLwOkwZ2CaxJDhHZjksIe58O2GqWc1X3WZh8jgtGtIalfiNQALJOjSnALKeO9
	 jninxuOagNablZ3WDOyshO7kB+R101Jgh2tbKN0G4XEfIS7WJRXJ0m6Zib0ShipPCR
	 23dJfvwe1qJ+bIFWEQkriV2fKF8zQF+Qi4o5tDDBOUakTvD1UAJ6BlKEIvkq/nN3k0
	 pMHwAUHCLzh1A==
Date: Mon, 9 Mar 2026 13:10:22 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
Message-ID: <aa6vSvsp4J6InmiB@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
 <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cvowzgf7khn6nplo"
Content-Disposition: inline
In-Reply-To: <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>


--cvowzgf7khn6nplo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: Re: [cocci] [PATCH] scripts/coccinelle: Add script for using
 ARRAY_END()
Message-ID: <aa6vSvsp4J6InmiB@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <f1c9dff525752dc5a839760269a1c96d6e0870b4.1772752564.git.alx@kernel.org>
 <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>
MIME-Version: 1.0
In-Reply-To: <cab3d2a8-4c3f-45e6-9e7f-8bdca48a6209@web.de>

Hi Markus,

On 2026-03-09T12:17:00+0100, Markus Elfring wrote:
> =E2=80=A6
> > This script makes it easy to find more places where that macro should be
> > used.
>=20
> See also:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n94

Thanks!

> =E2=80=A6
> > +++ b/scripts/coccinelle/misc/array_end.cocci
> > @@ -0,0 +1,93 @@
> =E2=80=A6
>=20
>=20
> > +// Confidence: ???
>=20
> I hope that a more reasonable value can be determined for this informatio=
n.

I don't know how the scale works.  I know the script has a few false
negatives, and AFAIK there are no false positives.  To what level of
confidence would that belong?

Is that field a keyword, or may I be explicit such as with this?:

// Confidence: no false positives, but a few false negatives

Or maybe I should write that in Comments...

> =E2=80=A6
> > +// Comments:
>=20
> Please omit such an empty field.

Ok; thanks!

$ grep -rh '^// Comments:' scripts/coccinelle/ | sort | uniq -c
     34 // Comments:
      2 // Comments: -
      1 // Comments: -I ... -all_includes can give more complete results
      1 // Comments: Comments on code can be deleted if near code that is r=
emoved.
      1 // Comments: Some false positives on empty default cases in switch =
statements.
      1 // Comments: requires at least Coccinelle 0.2.4, lex or parse error=
 otherwise
$ find scripts/coccinelle/ -type f | wc -l
76


It seems around half of the existing scripts have that.  You may want to
remove those empty comments.  I added it because the scripts I looked at
do have it.

> =E2=80=A6
> > +@i@
> > +@@
> > +
> > +#include <linux/kernel.h>
>=20
> I doubt that such an SmPL rule would be required.

Okay, I'll remove it.  Thanks!

> > +
> > +//----------------------------------------------------------
> > +//  For context mode
> > +//----------------------------------------------------------
> > +
>=20
> Please omit such extra comment lines.

Agree.  BTW, you may want to remove such lines from existing scripts:

$ grep -r '^//.*For context mode' scripts/coccinelle/
scripts/coccinelle/null/deref_null.cocci:// For context mode
scripts/coccinelle/misc/boolconv.cocci://  For context mode
scripts/coccinelle/misc/array_size.cocci://  For context mode
scripts/coccinelle/misc/struct_size.cocci://  For context mode
scripts/coccinelle/misc/newline_in_nl_msg.cocci://  For context mode
scripts/coccinelle/misc/badty.cocci://  For context mode
scripts/coccinelle/api/alloc/pool_zalloc-simple.cocci://  For context mode
scripts/coccinelle/api/alloc/zalloc-simple.cocci://  For context mode
scripts/coccinelle/api/alloc/alloc_cast.cocci://  For context mode
scripts/coccinelle/api/pm_runtime.cocci://  For context mode
scripts/coccinelle/api/resource_size.cocci://  For context mode
scripts/coccinelle/api/vma_pages.cocci://  For context mode

> > +@depends on i&&context@
> > +type T;
> > +T[] a;
> > +expression b;
> > +@@
> > +(
> > +* (a + ARRAY_SIZE(a))
> > +|
> > +* (&a[0] + ARRAY_SIZE(a))
> > +|
> > +* (&a[ARRAY_SIZE(a)])
> > +|
> > +* (&a[ARRAY_SIZE(a) - b])
> > +)
>=20
> Extra space characters may be omitted directly after SmPL asterisks.

Good to know; thanks!

Although most scripts seem to be using white space (space (164) or
tab (26)) after the asterisk.  Please confirm if you prefer it removed
in new scripts.  Only 39 scripts don't have white space after it.

$ grep -rh '^\*' scripts/coccinelle/ | grep -o '^..' | sort | uniq -c
     26 *=09
    164 *=20
      4 *(
      1 *;
      1 *E
      1 *I
      1 *P
      2 *W
      1 *\
      1 *b
      1 *c
      3 *d
      1 *e
      4 *f
      1 *g
      2 *i
      1 *l
      4 *r
      2 *s
      1 *u
      2 *w
      5 *x
$ grep -rh '^\*' scripts/coccinelle/ | grep -o '^.\s' | sort | uniq -c | hd
00000000  20 20 20 20 20 32 36 20  2a 09 0a 20 20 20 20 31  |     26 *..   =
 1|
00000010  36 34 20 2a 20 0a                                 |64 * .|
00000016
$ grep -rh '^\*' scripts/coccinelle/ | grep -o '^.\S' | wc -l
39


> =E2=80=A6
> > +@r depends on (org || report)@
>=20
> You may omit parentheses here.

Ok.

> =E2=80=A6
> > +@script:python depends on report@
> > +p << r.p;
> > +@@
> > +
> > +msg=3D"WARNING: Use ARRAY_END"
> > +coccilib.report.print_report(p[0], msg)
>=20
> Would the following command variant be a bit nicer?
>=20
> coccilib.report.print_report(p[0], "WARNING: opportunity for ARRAY_END()")

Sounds good.

> By the way:
> How do you think about to omit a cover letter for a single patch?

Sounds reasonable.  I like the cover letter as it holds the range-diff,
which may become a bit confusing when it's in the same email as the
patch, but maybe that's just me.

I'll send v2 in a single email.

>=20
> Regards,
> Markus

Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es>

--cvowzgf7khn6nplo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmuuK0ACgkQ64mZXMKQ
wqkSzw/7BsY+QbHN9FP+p5Frj+Yh5Vr3bWpVw9TsBPrJ7Uq3JcaZHHDmXtIxZSj1
toOrlHkdfWlOLA+4QEec+PyFf3tTcAPu5jFYRazT9QjPwyj/vGSep6A4XKrZ/CQv
Mvgn/OLhoW0/0SGqYp6xMmJxcNIpo+7Idm7cVnwf8WQNvHOToQBLDdXIOv6z18tI
XFFQxayGDbK39nQldUB7j7c+lfO8w/Qpj9yrkrgLFrkRa3CDyeMUh/n/SIoepHPj
crYvb2C95hZFEHdI8UbWLlRtpMRj/ZbltH0MZn7Hn6xrh55kKQOVgQzjew39IkRW
J3xyGV5PejQZ3Ju2htZPcdOsHVksmcBLb1W5IXxJMBIIPuMeyGiqf6sl/tIR3l5Y
6jHJMIaKBy6zZRBOx80uyZEVhuTV43bEjePDfVLou7KWvBLNnCpDALUaLzlfhlaS
HVPJJdVtUEQ96v+3tPdefIL/+HYvopI+L4Cg3ob5eIAxYTjd0JduKvZHh22a5vYg
ccyVRtO9IOtY77z/5bw5r9lY8CqN/1rG/tHUQhS2RPd9337bkcFFprt0UTZxnBPP
4Szqx+KeeaODP4YaAVlPkWfNFWjbWk2+0m8MFfGWz79OkJZpI6zY7EbvQlDU1zXe
cmMZX5yhs8JJ1d2n0GE6H3R4SLVcjZn64tSDO7w+zjx9v7W/1+s=
=gFux
-----END PGP SIGNATURE-----

--cvowzgf7khn6nplo--
