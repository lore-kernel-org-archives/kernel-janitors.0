Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14B249ED;
	Mon,  4 Dec 2023 13:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNR9r33t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8C3C433C8;
	Mon,  4 Dec 2023 13:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701697471;
	bh=0u0eRbYHprO4V9O8E5GrXjK3jfpE3iV0/QIqDHMJU7A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNR9r33t2AYREGe5pJConGoNCG/boYkxNW4yTJ9C4bMcgj4ay0qZ1e0ia5BP9MwP7
	 yJdMRWiNMKUMUkY/Nx1wf8cYBRFdgT5DrVegcKIym/KLksSMsns0TwEvarhg/jtCXF
	 Y6UxZ50AX01p7WOArihhjP81u+p8PO1YGLgVWlOKv7YZpIWZHvOyIxRhwVEAlK4LKB
	 Zbr2m8i20wM54blbjS8BCkh8OzmL2ung0cu4+8vvtTdDR+PkcK70MlBIkxl8c1/NA/
	 AJvT+8fLzf3hexKq7VZhb/PFtHgXb4yGqQZUeqFDLrW+axCE3adgVgwUwmdCW8tAuh
	 n+XJqOwW4CfCA==
Date: Mon, 4 Dec 2023 13:44:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shuming Fan <shumingf@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5650: add a missing unlock in
 rt5645_jack_detect_work()
Message-ID: <41ab946d-38e2-4a93-a40d-d9c3a5b0ca5e@sirena.org.uk>
References: <0d18b8b3-562f-468e-991e-d82d40451f9a@moroto.mountain>
 <40947cc0-2dd0-45b8-9527-0ffe5a113f6e@sirena.org.uk>
 <b3229768-7b13-4d40-a6ea-2fde3ad2eefe@suswa.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3R7D5tTuE+alyALp"
Content-Disposition: inline
In-Reply-To: <b3229768-7b13-4d40-a6ea-2fde3ad2eefe@suswa.mountain>
X-Cookie: For office use only.


--3R7D5tTuE+alyALp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 04:40:55PM +0300, Dan Carpenter wrote:
> On Mon, Dec 04, 2023 at 12:59:52PM +0000, Mark Brown wrote:

> > =E2=80=99 has no member named =E2=80=98jd_mutex=E2=80=99
> >  3312 |                 mutex_unlock(&rt5645->jd_mutex);
> >       |                                     ^~

> I'm so puzzled by this.  I'm on linux-next for Dec 4.  I don't see
> anything which would affect this on lore...

Well, apart from anything else the mutex you're adding this for isn't
present in the branch that has the commit that you're identifying as
being fixed...

--3R7D5tTuE+alyALp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVt17kACgkQJNaLcl1U
h9DbWAf/VIWq1NcI4bIhhDNVfmZWekT/vDEEub5haXEPKZ/ftTPq9GdUa4GrK13z
hxTM7RBRv0XIf/qbuMJ0/zYeqjHAByaPLpWvsGG5gDd2hN547ayJL1eON0eFge3g
z62Y3mmPI9Dt9NYhkGDYFUdGlcjHOfj3PoaBOmhHSlUVNnUySEQndwoQ9krnv6RC
1u5gaPC5jEoJgLXBSsegaNqAx5O8lmCmMbOE8fSlQp2k6eUHYutX11b4mgWOxAbb
61fcn4BC95ffNK64pzWVJ7jQUCPPdA05PcDIOzO+SiB3B8O6nGawS+CJzCLN7Hdm
qFVNKX/fqd1NdLg81Bb3iuAZwnkifg==
=JgWl
-----END PGP SIGNATURE-----

--3R7D5tTuE+alyALp--
