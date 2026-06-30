Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7E3101C2;
	Tue, 30 Jun 2026 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782843400; cv=none; b=hLSnTN9H6gX2BKgPTp8eDVX76/RlH7WdBe/tY3qQ811Q0H1VzgX4+qvjaK0epTzh/w8GwY/N3poJfxbYp7kqz75Suoiy2QT7Cfykgk4ljK0OwjNlAFNEegBq+Qu/W3Cq0eVHlROFPw0cBRbEjQHixLVcYmma+DmqX3ZJsg94qnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782843400; c=relaxed/simple;
	bh=mDUImyetwQTS3vJV5yrhrgHrQ6X8zLTJKcITvONYlKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXQYi0W25MMYfLM/VtvBU9Ev1Z+RwHeXg10lL/d+JqFeXSanxjR5F0Akt1ltPZv9ITPOv2yvpKq2EZp/xtHeY0vDAHTquHSwutOs4BbOV2msEPvapx7t7WFePiRybEjHQZPHOrUP11PHiC2qDYLFclzeCiD2jaUsjf2Gen9jyvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ly5SJNn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ly5SJNn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A31E1F000E9;
	Tue, 30 Jun 2026 18:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782843399;
	bh=SkwLh97jvwr2z1BCTi491+OaXOX/cf0Vko+b3IMbQ6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ly5SJNn7z15uLwUL+CXtAmrN3bXjyXOPeJPmkOvIryNcZMA2Up7Lm3Ic0gHfsxyAp
	 rpzuoJH34USRuMjuPUfCfJ+oDlzsQwGE1qN8lNqrK5hB8BlIQ6B54mX/4M30Xg94XW
	 GYCYCQ1DNmcrD2BD0vALTlCq5rxuYwViL9uFCqMX9Xr+PxNhrU3RqHkue+2FLMJZVb
	 iQfSoGV1eFCTReZ0dru3qPOnN+c9Ifdfvhr75wpkizsONHooOriX7+UsdTjEPMkFpq
	 inLBe0W0/isSGsEZL/nf2Rsjxj54qNp6WkazhJnhmRH5PASJs3z1h/W54Z+ySFUzO1
	 iVaDDMyzxRf6Q==
Date: Tue, 30 Jun 2026 19:16:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: ASoC: SOF: topology: Use more common error handling code in
 sof_link_load()
Message-ID: <b04d8e4d-3d13-467b-841f-262204514377@sirena.org.uk>
References: <40b93192-68d2-4de1-845b-9c9ba994a75b@web.de>
 <178281882519.79320.1939247511595511190.b4-ty@b4>
 <2811c5cd-f2a2-418e-a5ba-b1c68ef5f1b9@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ss95LoWsRAg/Xjnh"
Content-Disposition: inline
In-Reply-To: <2811c5cd-f2a2-418e-a5ba-b1c68ef5f1b9@web.de>
X-Cookie: Air is water with holes in it.


--Ss95LoWsRAg/Xjnh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 07:08:39PM +0200, Markus Elfring wrote:

> Will the chances grow that further development ideas also from my change =
selection
> can be integrated better?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--Ss95LoWsRAg/Xjnh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpECAEACgkQJNaLcl1U
h9BwkAf+Jjd85bG65UiIM3ZE8REeD4fnlKZNNa2BRDX8DODkZXMlmaxMnwFlrHR6
H9j/m4SoXppT6iQ1Ov5TuTV0s/NMVJO0txp/R8zVOBd8UdERHlr/yC9UKhsF4xfJ
1lh1x/hOd9lAonqTDP/7nH3fXbRWc6yxIRqFqInLeUZNXkBqLm895ViArNazgAQ5
KOlksKn3M07EyhoVwng5+XIxZgBAFY/CXRsDXWzqMA9Tn+gcFKiL/RwrQ/cjnJNA
wt92LpOmfEFLZyPO8dzLPj6hNuwhPAOi8r0Sj/e9yJYAuym/fL1sptOOiQAcCQWV
MLL4KChQ+DF3sMSkMRj69ifoCfj0Rg==
=5ujI
-----END PGP SIGNATURE-----

--Ss95LoWsRAg/Xjnh--
