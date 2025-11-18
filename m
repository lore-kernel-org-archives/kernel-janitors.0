Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1211FA859;
	Tue, 18 Nov 2025 00:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763425136; cv=none; b=gVFL4YZbBk+/beOziDa58F8sjpMWKHETfHLRgptoZ2rPVM3cFfwcoag7jdPNpUwSVFTwXTDkgHpkw+C8+DSEKSWIwxr/8ugr7gc3Zru8NFUfxNlu0pkXX3iq5fqBY/nio/tEk10voaDiV6EGshGj61YvmQj2Wk0TEBc8FKVWAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763425136; c=relaxed/simple;
	bh=H4Da9LfoTBW+hfMYJa7p3b4t7+UpntgAOkV+A3n7osg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBedTVI14VOg0gpQdB6XHZ+5VgcWBj8FLrI516S2BMA49CGKHAbIUanoYBOuPRzDW9A/I1IHz20yaENPzTdvViUCI7JnysBuuS98IGNMLVH+aJ3i+JCpsDPIHy5hOukKAMCQdmKeIBPkfUfkQ6pVpeZ3qJHolwplyGB1SFkGYdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GL+snsQ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GL+snsQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3087C2BCB5;
	Tue, 18 Nov 2025 00:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763425135;
	bh=H4Da9LfoTBW+hfMYJa7p3b4t7+UpntgAOkV+A3n7osg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GL+snsQ3PrUZPtrMveZTCYK03tfmkBmaki3CU0bIKelZgW80OhixrIYUCu0O8jGEO
	 BN0ySuRmMlu0as50bYQY0hj5TQSBqSIuR1wJO5X04mj479EFkcsla9w99wtmqVdI0f
	 ZXWAEn0i0uOFXQs3rUB31qZzUMqxGt7UwL5FTBHSXGlg8f/tCNv65r/ogpBd1DuTUb
	 HLER65uo8ojM0J3U3V4vOnn5YlnJqmYmTG85QJt5n7vo8euENVMOdFGzK8wDdWRclq
	 V1paUkRKB2hlcM6FiQK3T27RdK0DZjoJntnQpkMTtEMakfFi1p2s1ovvo+enIMJcvD
	 9ddrczEieVt5Q==
Date: Tue, 18 Nov 2025 00:18:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, kernel-janitors@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: refer to intended file in STANDALONE CACHE
 CONTROLLER DRIVERS
Message-ID: <20251118-broiler-engraver-b9bc787fa6a5@spud>
References: <20251117105311.293508-1-lukas.bulwahn@redhat.com>
 <20251117120639.00000a44@huawei.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVqjsSk4RFSLha1M"
Content-Disposition: inline
In-Reply-To: <20251117120639.00000a44@huawei.com>


--CVqjsSk4RFSLha1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 12:06:39PM +0000, Jonathan Cameron wrote:
> On Mon, 17 Nov 2025 11:53:11 +0100
> Lukas Bulwahn <lbulwahn@redhat.com> wrote:
>=20
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >=20
> > Commit 23db6eed72bd ("MAINTAINERS: Add Jonathan Cameron to drivers/cache
> > and add lib/cache_maint.c + header") intends to add a file entry pointi=
ng
> > to the cache_coherency.h file, but messes up to name the right path.
> >=20
> > Update the entry to the intended file.
> >=20
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> Thanks. Just missed my v6 (some changes in Kconfig requested by Arnd).
> Conor would you mind picking this up on top if you take that series?

Aye, I've grabbed it provisionally depending on how you would like to
deal wit Randy's comment on v6.

--CVqjsSk4RFSLha1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRu7agAKCRB4tDGHoIJi
0lxyAP91yZK5QkQhoKMaELFs9QbI480U3sGE0cv3By7P5pHvSQEA5YqRCkKQteZz
xuZl4E1o/lobsjZWQEyVzC3M2NpYpwo=
=fnrM
-----END PGP SIGNATURE-----

--CVqjsSk4RFSLha1M--
