Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97303BFE34;
	Mon,  9 Mar 2026 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773066744; cv=none; b=PFI5e8s+hRwGe4DIZ3Qpm6W+ynFzUuLDTcgMP0KDdrj5vZtlMUz+fb6IgVjp9Rojif3NA8WXNc8eKXIdWbgVE9iijbA5Vy+tPwx9zTlxeuEQfpJwsvHVdZ4icI32poAkbeVWlVLOxl+jtMogTCb1TvZVB/erjXXTuV0ClfRZDzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773066744; c=relaxed/simple;
	bh=P4uqY66mEvLGCVbjfMVajSJDDF5nxFuwbjyaPKqoJ8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqh07mJCjaioCdKtr0ada6GThqbk9t5WM8MTSz2woUJ5GKvOxfa3k99Mtq0vStpWPY/D3r9oYMkub7/T5iAEsdQKEZ8vbNZZplml2byFPNRjf8dnWq5uWqRJKMr3P+CLjkHc4V3Aq/NGTjLSawT4InbAgs0+Z4auGTkMlGKXULU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ey0vZr7n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ey0vZr7n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C816FC4CEF7;
	Mon,  9 Mar 2026 14:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773066744;
	bh=P4uqY66mEvLGCVbjfMVajSJDDF5nxFuwbjyaPKqoJ8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ey0vZr7nq27r42J+hvWD6MeGujJYPQ6Gv0OygZs1yTH5tk0AhbcDmOTUqjC3y/3Zn
	 4MaRjZz7ubLc74OYtJtXk23UJVyjcmD9DS+5Lee92n/Vnb0VS7zaYnuzyItcUaS5yM
	 VkZ6P1/IVVlrgKZlWVTweNLmkqNQHkQmDiziKUW4W4rj4ixBcYM3xpPc6cyzYGpFxh
	 eraj5D0uCPVWEEe519wABhv7+Iwp/SH2AJ6MMs2rrpJD4+WF7ga097KHwAxwTMsvAe
	 +tMGMNJGGNJmqr9zG/2oh3i3DGZpCdZw38/C5wDmSyHRosO4iMpHDPh5J42+ANzyLH
	 /ldenvwfmZerQ==
Date: Mon, 9 Mar 2026 15:32:20 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <aa7XD-rk_KWQvTQX@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o6pp4jdt7au2a2ah"
Content-Disposition: inline
In-Reply-To: <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>


--o6pp4jdt7au2a2ah
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>, 
	Nicolas Palix <nicolas.palix@imag.fr>, Kees Cook <kees@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2] scripts/coccinelle: Add script for using ARRAY_END()
Message-ID: <aa7XD-rk_KWQvTQX@devuan>
References: <cover.1772752564.git.alx@kernel.org>
 <9fd8d3d1e7ef3efb6e6dae0972dd515ff02e42bd.1773058287.git.alx@kernel.org>
 <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>
MIME-Version: 1.0
In-Reply-To: <806bcb6d-3ebb-4454-973c-f9d6530a17c2@web.de>

Hi Markus,

On 2026-03-09T15:05:08+0100, Markus Elfring wrote:
> =E2=80=A6
> > ---
> >  scripts/coccinelle/misc/array_end.cocci | 74 +++++++++++++++++++++++++
> =E2=80=A6
>=20
> Some contributors would appreciate patch version descriptions.
> https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pr=
eviously+submitted+patch%22
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv7.0-rc3#n310

I replied to all of your comments, and said how I would address them, in
reply to v1.  This v2 is in-reply-to v1, so that that sub-thread is easy
to find.  And at the bottom is a range-diff where you can find all the
exact changes from v1 to v2.

I could have noted in plain English the changes from v1 to v2, but
I thought it might be a bit redundant.

> May a subdirectory name be omitted from the subject prefix?
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/s=
cripts/coccinelle/

Yeah, we could do that.  Here's what I checked for writing the subject
prefix:

	$ git log --oneline --author Lawall torvalds/master scripts/coccinelle/mis=
c/=20
	f01701ce update Coccinelle URL
	92b2dada scripts/coccinelle: drop bugon.cocci
	c3003315 scripts: coccinelle: boolinit: drop warnings on named constants
	518d8a56 scripts: coccinelle: Correct warning message
	b825b432 scripts: coccinelle: only suggest true/false in files that alread=
y use>
	937c812d coccinelle: orplus: reorganize to improve performance
	69c4907b Coccinelle: use false positive annotation
	f75621c6 coccinelle: bugon: reduce rule applicability
	c7eaa887 Coccinelle: array_size: reduce rule applicability
	8f551bef Coccinelle: reduce rule applicability
	74a8478f coccinelle: misc: move constants to the right
	932058a5 coccinelle: misc: semantic patch to delete overly complex return =
code >
	24f0c2d6 scripts/coccinelle: find constant additions that could be bit ors
	ad99ac2f scripts/coccinelle/misc/warn.cocci: use WARN
	2cbd0825 scripts/coccinelle: sizeof of pointer
	4619c2b8 scripts/coccinelle: address test is always true
	89910581 coccinelle: semantic patch for bool issues
	4a05f067 coccinelle: semantic patch to check for PTR_ERR after reassignment
	29a36d4d scripts/coccinelle: improve the coverage of some semantic patches
	a1087ef6 scripts/coccinelle: update for compatability with Coccinelle 0.2.4

Since the latest line and a decent amount of lines have
"scripts/coccinelle", I picked that.  I don't have a preference, so
please let me know what's the preferred one.  I tend to prefer more
explicit ones, even if slightly longer, but I'll take whatever the
maintainers' preference is.

The only one I didn't really like was the 'scripts: coccinelle:' one.
Paths are more readable if we're going to include all the
subdirectories.  But this is just my opinion.

> =E2=80=A6
> > +// Comments: No known false positives, but has a few false negatives
>=20
> Would such information motivate for any further software refinements?

Yes, if anyone here knows how to handle the false negatives and wants to
work with me on improving those, I'm very interested.

Here's one case which isn't caught, for example (which I expect will be
difficult to handle, if not impossible):

	@@ -2876,7 +2876,7 @@ static struct dentry *proc_##LSM##_attr_dir_lookup(s=
truct=20
	inode *dir, \
	 { \
		return proc_pident_lookup(dir, dentry, \
					  LSM##_attr_dir_stuff, \
	-                                 LSM##_attr_dir_stuff + ARRAY_SIZE(LSM##_=
attr_dir_stuff)); \
	+                                 ARRAY_END(LSM##_attr_dir_stuff)); \
	 } \
	 \
	 static const struct inode_operations proc_##LSM##_attr_dir_inode_ops =3D =
{ \

I could research and find other false negatives.


Cheers,
Alex

--=20
<https://www.alejandro-colomar.es>

--o6pp4jdt7au2a2ah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmmu2e0ACgkQ64mZXMKQ
wqlWBQ/8C99MHd/FasCpExad6HTYSDNWnqLOhDVeLnAam8fliZai0EvveKOeRpNg
Cdzmj7ip3djHD8x+3z5pHS9HEXhZqvreN9sEM2uqK4AvNCQRLG+TLBcMai0sSiSu
XDWI7TgIKfvW4YumFHmvJv3IUj1SuNxva7yfrEueXZU548x7C37a9j2hGfNof3t2
SSWh/TQ2/cw3jmfViJwtTF55rjMGvBt1swto9iJAhKJI0x82tWWupmCcyTWrQqum
DApgmBJ/5Vx8RvCfdqQ4qssX7LGhFcf4JXoNLZsOPAk0ByfW8j1OZcjFnaHQc0Xd
njjfBfdcNvnBgk1f/snt107KLTj4O/Iq75Co1ey3+B1/0U79ymI4xL/d5eBLu2g8
l8v6kMC/+L12VTfPIvud8OwJ9daljQS5puCX9KPt1egL2UImQ295egKXl1NRAXdM
RdNgXdD5R7B2l9wZ8OuLHbrx4o/ox+mNrGwsfGc+wlWhztnXZcOOwmzsU6/Q12VC
Sfj6cwx1YZVgmuSITQKiOnAYIHiY2wts6Af/vb/4GsEWm4+RoswkJ6Ike4eYMfbL
clTZa6CpRnYnEOd4p24oNvemFs5AVuZDiAEq+R4AJFc66Yb6z7p8TZj8d3I/4951
EM7QilN59IJzv5ejkFKdql9UGy02k4AjL3u5PPrERbPn+TYHCpk=
=ue2C
-----END PGP SIGNATURE-----

--o6pp4jdt7au2a2ah--
