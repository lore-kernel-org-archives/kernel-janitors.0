From: Mark Brown <broonie@kernel.org>
Date: Tue, 30 Apr 2013 18:06:14 +0000
Subject: Re: [alsa-devel] [patch] ASoC: wm8994: missing break in wm8994_aif3_hw_params()
Message-Id: <20130430180614.GA26160@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="rwEMma7ioTxnRzrJ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430072441.GB7237@elgon.mountain>
In-Reply-To: <20130430072441.GB7237@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2013 at 10:24:41AM +0300, Dan Carpenter wrote:
> The missing break here means that we always return early and the
> function is a no-op.

Applied, thanks.

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRgAgOAAoJELSic+t+oim9hPAQAJfN8O2COBNInCP0wc9rHA8L
qrOYeYZlsQrQmMO2+Un7mOXx8gnbuyD5Bw+5fSGif5uRw34Qm1KI4mAHbzaY118O
uZUBVz7+r75fj6fSGVynWEkYLh8yFGrkyndIvC06nOuBGbMNjdZVWPq3+k1yjGfA
CVDxuGmFaUdQ2J1nZRJsryLLHpoQw+8DyNWz+LvlXGFFea2a4BnBRCvjyH9DEwZD
y5X9W/TpLdnYXckM4Zr1PNMucfaWUXcjrF+1vTL77Jdgo2z9K2dbeNbodsvW/rSi
1E0JcMNXiYbhzNzVTTjauT+Wx3D07arDIZdPuyNcyh+fGg7/igUvoKx6zr2zboiq
XsacwimG0OrsXxnW2/ge5nXU2aNHKCAn0IQfl0G32t61i5P5C03TASuiRBcbvc7N
HSmQ7VbAC7I2zeN9vKhOM3hKyRIrtA6S14mkurmmmYu7ymQFrU/U31ij5j9mA8S6
mKomr7N7JaVKeP648+RQL0HnaPKAp2hdDYpsaoh1tGOlr2cRQwbsyEyAVIttU8Ds
r4opaT+9iWtheIFBn/xi5URZLvhW6cI4jUqK0/ftE5YaA8AYvIHF7dvBfI9hfzm0
IOQRGxzf9VbqvKktycFtzA5B2581cELfbkoulZnzqgD5EXQDSAk1bTYHIAk8p8aC
Rg6t7+HE/vtBTaLxKA9b
=xdI5
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
