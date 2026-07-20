Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15163CBE66;
	Mon, 20 Jul 2026 08:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536738; cv=none; b=Pf2lpQuV/26kJf73zspUeCt42WWSYDAN93K5x3asHiXji6AHOdNU9R+6hf5UDf6vvJUBYHtgEn6ELwDT6y0V8L4KxdTPrnxeYcpru48FRSFb9/cmXTnymRu2lQC4WedINJbdVVPmjdHO42toZRjQSMwPqzh5lU/wLdbNqrWCeIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536738; c=relaxed/simple;
	bh=FeyCKybCKNi26Ap67LUgL8QuPeogms6U4BAgYafTBio=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bVVEd0rYlY9U46ZLNQ7M4ExGRSgDL/q1INA8R2UIlCgfKtiQ1o8gksWFJKGJK7ILTeCjugtO4fHGSE94JvMdnWqFhSA6ori7kxHdjs5XYxGJsfns0cbRmfmaVUvzpw36+NVqWdOVckGKCl64t3f0z4w1gDa1BvArR3VA817NXMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T17qGW7h; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T17qGW7h"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h3Yp20yWNz8tWm;
	Mon, 20 Jul 2026 10:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784536730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wnD+41BeIxwW5o6SrXr7fbssSBi01iDhewk5InRfPfg=;
	b=T17qGW7hxfL9g8xYwtqNZHLJMoyio4CXsAGd0/i9NA0ab8ZBUfCivdDvqt+VD7ndJ8nOoj
	7v26RWMJJOecOAuibowY2PLp3nT3Y7i26klnBP0ELh9UQ6iN81xNI8R2MZC8byj9goEqdR
	sosQgrLXbf0XZMM5XkqpBD0A7ARun5DBH/Psw8irhWPFgLcNSQQJcsep1n+XavuJzYOakq
	8PFusdPCpzbLEPaREswz3UIS+8UkR4XeGJFMyY5f1t+R9sir+QTgvh9JmWxEAv684Z8wM4
	adcqSP89VdAMfA7TGAjU9g6OoNf/uDYYlngOZDODuICTURCsFRmKwVf0dZzg5A==
Message-ID: <0ef30a524e15530c6fc0842066367b1f86e679f2.camel@mailbox.org>
Subject: Re: [PATCH v3 3/3] Documentation: deprecated.rst: kmalloc-family:
 mark argument as optional
From: Manuel Ebner <manuelebner@mailbox.org>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, 	linux-doc@vger.kernel.org, Kees Cook
 <kees@kernel.org>, 	linux-kernel@vger.kernel.org
Cc: workflows@vger.kernel.org, linux-mm@kvack.org, Geert Uytterhoeven
	 <geert@linux-m68k.org>, Janitors <kernel-janitors@vger.kernel.org>
Date: Mon, 20 Jul 2026 10:38:45 +0200
In-Reply-To: <871pg0ras8.fsf@trenco.lwn.net>
References: <20260424174743.257951-2-manuelebner@mailbox.org>
	 <20260424175740.258522-2-manuelebner@mailbox.org>
	 <871pg0ras8.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: b7ec4e02521ad7167bb
X-MBO-RS-META: y6rid3cwbcupdui55iwp64d4x5gtorkb

On Mon, 2026-04-27 at 03:51 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@mailbox.org> writes:
>=20
> > put the optional argument (gfp) in square brackets
> > add whitespace for readability
> >=20
> > eg. ptr =3D kmalloc_obj(*ptr, gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr [, gfp] );
> >=20
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > ---
> > =C2=A0Documentation/process/deprecated.rst | 12 ++++++------
> > =C2=A01 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/process/deprecated.rst
> > b/Documentation/process/deprecated.rst
> > index fed56864d036..b431993fd08e 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -392,12 +392,12 @@ allocations. For example, these open coded assign=
ments::
> > =C2=A0
> > =C2=A0become, respectively::
> > =C2=A0
> > -	ptr =3D kmalloc_obj(*ptr, gfp);
> > -	ptr =3D kzalloc_obj(*ptr, gfp);
> > -	ptr =3D kmalloc_objs(*ptr, count, gfp);
> > -	ptr =3D kzalloc_objs(*ptr, count, gfp);
> > -	ptr =3D kmalloc_flex(*ptr, flex_member, count, gfp);
> > -	__auto_type ptr =3D kmalloc_obj(struct foo, gfp);
> > +	ptr =3D kmalloc_obj(*ptr [, gfp] );
> > +	ptr =3D kzalloc_obj(*ptr [, gfp] );
> > +	ptr =3D kmalloc_objs(*ptr, count [, gfp] );
> > +	ptr =3D kzalloc_objs(*ptr, count [, gfp] );
> > +	ptr =3D kmalloc_flex(*ptr, flex_member, count [, gfp] );
> > +	__auto_type ptr =3D kmalloc_obj(struct foo [, gfp] );
> > =C2=A0
>=20
> Marking the GFP argument as optional is fine, but the documentation
> should surely say what the default is.
>=20
> There are, of course, other kmalloc()-related entries in that file that
> could use an update, but that is a job for another time, I guess.

KTODO: Update the sections suggesting to use th deprecated
kamlloc(_array)() functions.

Thanks
 Manuel

> Thanks,
>=20
> jon
