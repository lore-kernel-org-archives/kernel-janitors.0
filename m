From: Mark Brown <broonie@kernel.org>
Date: Thu, 31 Aug 2017 10:38:25 +0000
Subject: Re: [alsa-devel] [PATCH] ALSA: ac97c: Fix an error handling path in 'atmel_ac97c_probe()'
Message-Id: <20170831103825.77shnqzi7ykpm7ah@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="sj65f6ptnm2w3c2q"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
 <20170831081021.g4luo557ggtnyfyg@piout.net>
 <20170831101903.avhj5tqywpvfsj4u@sirena.org.uk>
 <s5h1snsjaey.wl-tiwai@suse.de>
In-Reply-To: <s5h1snsjaey.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, nicolas.ferre@microchip.com, garsilva@embeddedor.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, arvind.yadav.cs@gmail.com, Alexandre Belloni <alexandre.belloni@free-electrons.com>, andriy.shevchenko@linux.intel.com, bhumirks@gmail.com


--sj65f6ptnm2w3c2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 31, 2017 at 12:31:33PM +0200, Takashi Iwai wrote:

> This is again a typical problem by such a trivial fix patch: the code
> looks as if it were trivial and correct, buried in a patch series that
> easily leads to the oversight by the maintainer's review.

Right, plus the amount of context that diff shows you.

--sj65f6ptnm2w3c2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlmn5yAACgkQJNaLcl1U
h9DpcQf+NRJiJpVSJaKTc1vePwbgOCafygwxhOHTrnSlNLRQjxakDkUcdvw8htuf
TgR4iBV59vMh8y91FBnV36NMqYKgJmX3PZy46S18Szm6jUYoV2INaiQJUeddmWNa
KUq4EqZEvf0XjnV/c5f2geN+JPOM36mYh/Ndkp5v98opU2/UTQ/rHtGJeHdjHgYQ
rGFJweRJlAaofY5oQXkvzOyaF2z06bheBq4hpL5aQFhNUSopbqv1dEHzVjxC+ZNL
gov/C6udBftxCxRS+tLAknx3txBTn077OTGEQb4xp+Bh82Lap9DNFLTaS3dqcLGG
5NA+DtMlKTH5oIReI0cp2x4msP10CQ==
=l4TI
-----END PGP SIGNATURE-----

--sj65f6ptnm2w3c2q--
