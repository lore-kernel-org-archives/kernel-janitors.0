Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAF4A20;
	Mon,  4 Dec 2023 12:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h16gMuhI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3EEC433C8;
	Mon,  4 Dec 2023 12:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701694797;
	bh=FAonTAOsKYxkIBInJnPaG0IDs9j/ADjNhHEtOgd1s5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h16gMuhIxjNXadC77sFaQOfK/iiFhz9ptmJFq8iEZWuPUQrUzljUDzGdNvk01p3Ma
	 10naFgQClVTxaENvezcYbAygkDR5Viau5k1uOPQ2SZs0TQ3h6ytnl2/6QmnshaPQ5d
	 n1uQSvGUR5gXeWfH8+cffx1tLH/Fm7O/L8rsGOT7qJ3I+epNZju9wwAUHpYNDSlhX1
	 aYmdb6qwN4K5P76uXlRrsNzLllwxDziMQ1tkuk5A12Ht+4KZcIto0oBEJXw8qzh92Q
	 FzmU1QevHJzZoAEI8glhe1ZVT9wdI/SrKuoU9mws0WscYH3/Z+od4qOM5oLtV0009S
	 XedXXMVNExpIQ==
Date: Mon, 4 Dec 2023 12:59:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Shuming Fan <shumingf@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: rt5650: add a missing unlock in
 rt5645_jack_detect_work()
Message-ID: <40947cc0-2dd0-45b8-9527-0ffe5a113f6e@sirena.org.uk>
References: <0d18b8b3-562f-468e-991e-d82d40451f9a@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5aJyrTgEIoBKDIk3"
Content-Disposition: inline
In-Reply-To: <0d18b8b3-562f-468e-991e-d82d40451f9a@moroto.mountain>
X-Cookie: Every path has its puddle.


--5aJyrTgEIoBKDIk3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 03:29:47PM +0300, Dan Carpenter wrote:
> We recently added new locking to the rt5645_jack_detect_work() function
> but this return path was accidentally overlooked.

This breaks the build for me:

/build/stage/linux/sound/soc/codecs/rt5645.c: In function =E2=80=98rt5645_j=
ack_detect_wo
rk=E2=80=99:
/build/stage/linux/sound/soc/codecs/rt5645.c:3312:37: error: =E2=80=98struc=
t rt5645_priv
=E2=80=99 has no member named =E2=80=98jd_mutex=E2=80=99
 3312 |                 mutex_unlock(&rt5645->jd_mutex);
      |                                     ^~

--5aJyrTgEIoBKDIk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVtzUgACgkQJNaLcl1U
h9A2DQf+K1zZCyxEhtKLm7CRkShs7fFK5qf1yalwhviIJ2Ms6TFBHVhkohNfnBeg
QDfOYb7kQWfsSGimxKjNhkE3WhWBiSFVu+CARg69nqLZWV947lW9VTDEKoyRC1fx
Eg2+p7NGBWw9zzWh8JTDY/P8f6vji4+qRHaASpP7zQNSc+1cmSO++AFdfsg2OnhI
Oaj5ZiUhlgiN9qqd8vqrdEoMst3bT7kecTNMUzSLNnpqH9mpRYDZE3klV96UEOHP
UJgSCQvdIiG+ER4nlbNWjrgeTXVlqCwGWqIrBSiSGjSQkyEUtAKk2f++voTXVmip
8GTK2H4dIXMx1NmZkjMhkld6hPjDBA==
=giWb
-----END PGP SIGNATURE-----

--5aJyrTgEIoBKDIk3--
