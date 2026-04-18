Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43B3278156;
	Sat, 18 Apr 2026 10:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776509171; cv=none; b=n//OgB4PsuON/ofOgN7pkD/jA0juYR/45zQMaQ1Dpi3A5Du+gwCv8KMnbSDCmnZ40/QhP1nNv7HQr2H6vMzFXBDn4bSQEY3J0sYsv4YawZnJvo8JWOTk9xaImkrivQ+rkB7qMk5GU+vXeDGrM7a35a0Z+W8BRZJ49C17mwLlIeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776509171; c=relaxed/simple;
	bh=Ir0qLUR/r3WJt2KzeUx3H7b+A0/ZkWKvELu87SyVyfI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IhRP8PbI58k5VNge/JPkWJaqkZ1C5YZ61KA+k+cWlc+PGKxjwMIv9Iz86WD05/eYvkCRDA8+Yab2cgnSYG31ejIFbrXYtdkVPWwwXEgvz6J77UUbADWgzCu6j/jp8wZhu0lzOed0DYXoOmuSqfTRwYUhtBzEEntQM0TGJR7qJdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HWP9kWgW; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HWP9kWgW"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fyT1m6yXcz9v8P;
	Sat, 18 Apr 2026 12:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776509165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ir0qLUR/r3WJt2KzeUx3H7b+A0/ZkWKvELu87SyVyfI=;
	b=HWP9kWgWI4ZxvUTH9DIaA1XYwaEZzJUnFWIHEymbWZg7sjxylsM0xIiTGXHpiEDrSByebX
	ZIgwGYd16wGku7H5i0jVOQ8hLxarEmr8FFh2dKrFkwApVP7W15HMvlDQKVAxoTNYeXraoY
	ib6qObVY/C83qeseKkzlS9KzNf6EU3GITU7yR78oAUW53M//EkrNSP8qZW1SvQiG6JhBiR
	ETw/Zbzec0/Ww/soORSwHqmEry4z0Ss9sh+H+2dWQRTH5WdpX6+BxKpfgY8kFqpvyed6hZ
	LYzDO0NobRuGFUPnkeFp4qPXAXoxHrQxoybTTEjS2fcszO0S03dIt5giiEoGmA==
Message-ID: <980be93ce680c831c37dbeeb070135b2fc8f4fb8.camel@mailbox.org>
Subject: Re: [PATCH] Documentation: adopt new coding style of type-aware
 kmalloc-family
From: Manuel Ebner <manuelebner@mailbox.org>
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	linux-newbie@vger.kernel.org
Date: Sat, 18 Apr 2026 12:45:19 +0200
In-Reply-To: <aeNcgSu8kVEyWbzY@stanley.mountain>
References: <20260418093101.130335-6-manuelebner@mailbox.org>
	 <aeNcgSu8kVEyWbzY@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: x68at7d5ak98dwp53bru93d44wfmpx66
X-MBO-RS-ID: 758a58929862b72aee3

On Sat, 2026-04-18 at 13:27 +0300, Dan Carpenter wrote:
> On Sat, Apr 18, 2026 at 11:30:48AM +0200, Manuel Ebner wrote:
> > Would a patch like this one make sense?
> > I think i need help with the change log. Is there something to much or =
missing?
> >=20
> > ptr =3D kmalloc(sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr, gfp);
> >=20
> > =C2=A0This one is done. The ones below are not done yet.
> >=20
> > ptr =3D kmalloc(sizeof(struct some_obj_name), gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr, gfp);
> > ptr =3D kzalloc(sizeof(*ptr), gfp);
> > =C2=A0> ptr =3D kzalloc_obj(*ptr, gfp);
> > ptr =3D kmalloc_array(count, sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kmalloc_objs(*ptr, count, gfp);
> > ptr =3D kcalloc(count, sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kzalloc_objs(*ptr, count, gfp);
> >=20
> > change log:
> > [PATCH] Documentation: adopt new coding style of type-aware kmalloc-fam=
ily
> >=20
> > Update the documentation to reflect new type-aware kmalloc-family as
> > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and fa=
mily")
> >=20
> > ptr =3D kmalloc(sizeof(*ptr), gfp);
> > =C2=A0-> ptr =3D kmalloc_obj(*ptr, gfp);
> >=20
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
>=20
> Yeah.=C2=A0 Fix up the commit message and that could probably be merged
> through the documentation tree.=C2=A0

how do i fix the commit message?
 what's even the issue?
 is the one-line-message ok?
=20

> Probably no need to split it up
> by subsystem, but you should CC the affected subsystems.

Thanks, i struggled with who to send it to.

> regards,
> dan carpener

can i add
Reviewed-by: Dan Carpenter <error27@gmail.com>
?

Thanks,
Manuel
