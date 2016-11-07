From: Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 07 Nov 2016 12:07:11 +0000
Subject: Re: [PATCH] drm/tegra: gem: Remove some dead code
Message-Id: <20161107120711.GH28616@ulmo.ba.sec>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xHbokkKX1kTiQeDC"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030155029.17036-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030155029.17036-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gnurou@gmail.com, swarren@wwwdotorg.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org


--xHbokkKX1kTiQeDC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 04:50:29PM +0100, Christophe JAILLET wrote:
> 'dma_buf_map_attachment()' can not return NULL, so there is no need to
> check for it.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/tegra/gem.c | 5 -----
>  1 file changed, 5 deletions(-)

Applied, thanks.

Thierry

--xHbokkKX1kTiQeDC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYIG5uAAoJEN0jrNd/PrOheDgQALWfUuisCHqnOc+WEDHq7g2D
w4ixNgIFFXxqVYTUa/kWP6ITwjuvVbjhv8U7IFY+YGLREh6p5J0oaA0QSoay9XM1
2P2dEj990mG864ta3pLukFFq8dCfocHSgzpx0Qu2ZcNp6AccWI/QFQjk9J7BAEtw
rwiGlEt5NzYpViw54RZTWo1JZm5UxfSVmKq9CS1nlcrLlnQCb/UQNvGV1qjk17AN
LT5astk4/NOxosQcRJZm1vrqpLKST96yZA0HtCnKYM4wfjOuNNqnJYJY2y0dQhIz
DENx8gjGaDsg3pXKIpwsIGmMUJl759tZ+CBhpp2FYXELZxiPQwYoK9VR1nVi8g/w
7AB1gQzqwXsH1R2jzxP8OOUsNGrNiHSNU8LkUqn3F70cBkRPF4QknHWl0/eVKzz8
ok1LfCzxMrSMItYs0Iz55BR0HUwbDkqcUPcWfciCBRGQSnEQRFc0wpFxF1hYWkdb
aC+NqfMK9yjs/6y/iChLHyBEt6FdFeCWeyIrkYKMLbLPzDC4AikL7kKnCZfySqQj
NHcr+Z7BWjHip7eL1bf4d9cNbXEXITSoPnpvR9m+1BDo71S7d6sDezcIcTho3aRV
WtdbEPLOIFeDrqIxiSNjW6DpW9o5dEHHNcQ2Yx5El3Ke5bnwq8xIRxrz3vFxAQVB
N6WrAS9AhjWLh8sHG+9G
=z8DY
-----END PGP SIGNATURE-----

--xHbokkKX1kTiQeDC--
