From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Jun 2013 10:00:20 +0000
Subject: Re: [PATCH] ASoC: Fix double assignment of .owner in struct snd_soc_card
Message-Id: <20130614100020.GH1403@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="7/IUJOcl5c0tDlVH"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1371203336-16972-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1371203336-16972-1-git-send-email-emilgoode@gmail.com>
To: Emil Goode <emilgoode@gmail.com>
Cc: alsa-devel@alsa-project.org, linux@arm.linux.org.uk, tiwai@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, lgirdwood@gmail.com, haojian.zhuang@gmail.com, perex@perex.cz, eric.y.miao@gmail.com, linux-arm-kernel@lists.infradead.org


--7/IUJOcl5c0tDlVH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2013 at 11:48:56AM +0200, Emil Goode wrote:
> In struct snd_soc_card zylonite .owner is assigned THIS_MODULE
> twice, remove one of them.

Applied, thanks.

--7/IUJOcl5c0tDlVH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRuumxAAoJELSic+t+oim9q2kP/AnbRKoCuS/4EoZPVoSWxUZE
Sq4LX2eq/DSR86zhOTMpwqqklNM+Xl+FBrsFTMB7uEkhenY6+zTvKJcKSsdB7Rg2
vWVEflULvI9vNz+MeVFD+ICkou6v/V20iaemlp5F5seFoxCAUAugwFDCEourNK5b
8bc3i2CUWZ8fqJ1EAtvliljaT+b/w7zCh8j+Gc1IPQzWptuQPduNV5GGeOCSkWrZ
JIdcJMW9oBi3dpBaAOm3AtSceV+YYy6XxWTDUds8pU21VDiiXQW2DrijSJue2hxL
ep10ty884mT7ehNUU0o/lXXs81HvktrHtN1BqcEyvKPg1+YalB3JWqt+02QTK9X5
Dn8LFA4dsdZ7BVkhZKHu5lI14wVCbRW5m6XyV1HHCLPRvWJICUFOnvO7xq7ChMNS
3+nMgX3gYehYU1PxsFVquM9d5Or0ixwrlFPWrPMYyc+jKjZtOYX4YSmmysgbr1S1
B8RD/r2ugqpVHyNJvskBrXUpYxYdkOQ6ek/5bDmJ6kfNk3rxDhP5rvah2tQGKXge
KlhRQlOOZ1CePS5Vwv8IgVPanM6JtRDOyf4aDb0wn4m2xQ3Fl+t/JfLlLilQBlFN
asnB6cPw8Kp8DYIkytxkQXdKd5s0uiS7q6fcXjtJe26hT1aKt/n20UtssME92vNC
D0pZyRATL1RpNoDA4Tat
=M+me
-----END PGP SIGNATURE-----

--7/IUJOcl5c0tDlVH--
