From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Sun, 17 Jun 2012 19:49:03 +0000
Subject: Re: [patch] ASoC: Ux500: unlock on an error path
Message-Id: <20120617194903.GF4267@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vA66WO2vHvL/CRSR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120616131927.GB17980@elgon.mountain>
In-Reply-To: <20120616131927.GB17980@elgon.mountain>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ola Lilja <ola.o.lilja@stericsson.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Linus Walleij <linus.walleij@linaro.org>, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@ti.com>


--vA66WO2vHvL/CRSR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 16, 2012 at 04:19:27PM +0300, Dan Carpenter wrote:
> There is a missing mutex_unlock() here.  The cleanup path also has more
> debug output.

Applied, thanks.

--vA66WO2vHvL/CRSR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP3jSoAAoJEBus8iNuMP3dgwIP/2zh5PCc2aKbOLC8OJ23f+ed
+sD9kNOeyYzo2zSxs2zBf7S61fIj32UsGXs5UI5a3gQdo1RjidzOeLnPLsP+mGVM
DfQf31TxqAzmS8qjl7TrDo1tI8yPbU3E/7WR+ImbHAyW64TTyOJg9f2ZQQ4ud0i7
siqB8Lzlihua4+skN/+Nv3+VvHkVYZR/PORLV8B96p5n9hiJN4DT9sXepXzPgu8c
no800GYgN3WV+kuSrvl1dC0pYvO2uccEzR7sAgKzEHKnaTfASmDpljgm8Al/GTUx
ZqfMel96cWEHKbJ3+DwshBi/+kj0qBlPL0bu7JR4Cib3oo/GhTJstuPq5mkLA3iI
nS4f3yccqwLhSRGrW4H0O6AM+V3iF+p4Vx3lBmSEUIvtADO2pJrnYPaTQkkqdwTW
AnQZj8FqJ3AGfTG2NnABQrxporJyb+Y20wH1f5kAJJ2wetUkKvFb47/QLQi78jIk
FXJGdje74rZlgay6hR6AH6bGXmNBo62yobeNBMRBtKGPmTcSb3IF98rQNuxh6opr
qdQeeSStnbG4r2wG3BwJtEPF/7rYoyJ+wGWzg+ZKd+rTSZW2jwW+VY17qdSJsmZn
foqBfjvlKUBlPdPL7N3LJwFVMAN40YCsxvPqi8FjnXT7f+DbJCa5CZdYuvB2w64b
2R2ZicDR3N1ALc2qx4kV
=cGch
-----END PGP SIGNATURE-----

--vA66WO2vHvL/CRSR--
