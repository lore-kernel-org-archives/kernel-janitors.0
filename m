From: Mark Brown <broonie@kernel.org>
Date: Tue, 30 Apr 2013 18:07:10 +0000
Subject: Re: [alsa-devel] [patch] ASoC: wm8994: missing break in wm8994_aif3_hw_params()
Message-Id: <20130430180710.GB26160@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hQiwHBbRI9kgIhsi"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430072441.GB7237@elgon.mountain>
 <517F778E.3020700@bfs.de>
In-Reply-To: <517F778E.3020700@bfs.de>
To: walter harms <wharms@bfs.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2013 at 09:49:34AM +0200, walter harms wrote:

> the patch seems ok, but i would question the wisdom of a nested switch here,
> obviously the readability suffers and since it is only one case it seems
> better to be replaced it with

I don't think that's a good idea, it does nothing for the readability
and isn't idiomatic.

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRgAhLAAoJELSic+t+oim9sBAP/0bNqpewdSTDr8UF4gwF/7Tw
EbNx/trQbsqFIIT3GQoPj1/jERVdm61XPEPZIKHcyVV6uOX9hFA+JejEl7W0HAxE
uQP3izDtkgE8lp41qFfY7sYWgT8Zp7sAgmCq/E7Vib1b1HjHBxb1ej9Mty5DB1/L
QeEXgx7WkFHPtCNCz88hAmn9G8JSlD/v1sP0fij47WlqZtW9NGkbEeKO3Fy9JHoF
5HdLmxRQglKcp+Jlv4Zxugjinrha1w7EkifI/EKZ0wTSgnoFCy88lgSgXMlCLyPU
l+T2j1yPZV8fKvCWq+uTXxTaQjhNEddDT9CehRQ47stCtkR2ItJsTcoJH9e4h8Xw
5b6W5GYfLXA3OA/TeZ6//HUlpNhuWFZw2Ohpbz1NiWehCrinQB5mq8dSW4YXIrZq
bk5PVZSepE84wq/LORDn4xpaSFW6G8/tP/KEmn9jNn3ltdaN18fOo80m3RT+Emv/
uTEAjeG1vIxZSn5NgGKFY0m4b36UZHVERRioFUj1FIMyEyi8gLuOnMjs7fcrUS2q
Rm0rpswY74iuNyiHi/qI6nq8N+ftGhoGzsZSP3N8P7tlaf1pM6kKxRpxjl8lazm9
waMSvnRap4xZ4OoZl/RhDXLohOiuOlfWj6BePqupMV6DMpel0ujWftnN3uKi3usb
HucwHd9sjNgQlR6Zpi6+
=Fv2o
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
