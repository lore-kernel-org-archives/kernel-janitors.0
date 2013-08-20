From: Mark Brown <broonie@kernel.org>
Date: Tue, 20 Aug 2013 10:51:39 +0000
Subject: Re: [PATCH 1/6] ASoC: omap: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <20130820105139.GL30073@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="KjG/elEj40fDqMBW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376902316-18520-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-2-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, kernel-janitors@vger.kernel.org, Jarkko Nikula <jarkko.nikula@bitmer.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-omap@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org


--KjG/elEj40fDqMBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2013 at 10:51:51AM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Remove unneeded error handling on the result of a call to
> platform_get_resource_byname when the value is passed to devm_ioremap_res=
ource.

Applied, thanks.

--KjG/elEj40fDqMBW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSE0o4AAoJELSic+t+oim946UP/2FUpnHZ4XPlWCG8ipTV91x/
sr/qCKcgLUZpuRe+xxXWn5Atk/5CYkwPtRiy471ah+QVLNN070vAh6I/fyOdDaLc
+X4AR898rv3mDfwoWQFPmiETM/jmqHfRuSjjNCvWljsCNOlYYPQ+lgpOJwcUQPae
gFCECXEd+t61AyYOhWstNUcEvq/I4Fj1FSbr08ThTHKGp6BHfcgbYUad/Yc0a1Ky
rXNyKToj7g9PBu/6VdFrakYJg4X1ygJQLvDKEu9hPYBSQjWpiQCYM6OTljeEuzCB
pNPvf4CdqPCOEW1ThPsRIuvQhCzysc5jjeqcxIxQ4tQc7wEULYQKeEP2x7ajHTk1
fIiBWjjaHZXHMdfhkZZt6zYe5YuJO2Yx5I1vJ9llY90OXMfiEIBu4fKr6Cc6TxOd
NVrsTvH08dS0BE8tIzokxQqzX0AbPuuZ0gnCVekoo20J6IJmPhJ2AGVMpMbqXgJk
S4U94frGXZw5Ws3JsHioaJnomWOB28QMkvH4O93U+9MRIIqBUXaxPxwGN36i3zQA
w5T9S4JNQ4wf3kigk8k5nSh7ZSelw51zg+sxDMdHu5+b2xBegs25mqnZbG+CGTex
Bgj5udIFzHhnNfcUewFpjatOEGCH9idQ5EmwJlHqPpOOfvSy+LQ5HOnyeDC/gtP0
OBrFsZYJgCsItMvacK4x
=Fgtl
-----END PGP SIGNATURE-----

--KjG/elEj40fDqMBW--
