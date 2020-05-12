From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Tue, 12 May 2020 13:08:03 +0000
Subject: Re: [PATCH] i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pinctrl_probe()'
Message-Id: <20200512130802.GC13516@ninjato>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nmemrqcdn5VTmUEE"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506192100.194821-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200506192100.194821-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: peda@axentia.se, robh@kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--nmemrqcdn5VTmUEE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2020 at 09:21:00PM +0200, Christophe JAILLET wrote:
> A call to 'i2c_demux_deactivate_master()' is missing in the error handling
> path, as already done in the remove function.
>=20
> Fixes: 50a5ba876908 ("i2c: mux: demux-pinctrl: add driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to for-current, thanks! Peter, I hope you are okay with me
applying patches for my strange driver directly.


--nmemrqcdn5VTmUEE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl66n7IACgkQFA3kzBSg
KbYd7w//QfbfCkh7Qi2tx9ZYq6DwTGtz92vvLnKEiVAe684hJqfbIT58KB6Y+xxs
hvLU37hPtQHEylKHPjZKP4reKet/qhMBwa+izmicml37AYk/WT+bISP7bDz/cZm6
9gR9FGV/236CcswGGLcru8Us9PnxWnajXTq/Zgfb0/WcGfD+cV5zc3EDlR4iTAs/
wwJH7sLUoC6HTLWtEHDX9wRc35Baq1TqrHrecknGPctQgj2HNxickJrHJNclkEJ7
ZqTs//75b7SXWE4eE2WG4PYY2m12NkAuzTwkWLTJdmuuINBtbfEpJsfuONd1CX1j
PP/y25ssXKY5W0Qxq8/iR/Vb5rla2NtvOowCMjlWCTQmOkoaR1/wWJ12fDx4XOuj
Ut+zNMSg6OnnnW56rMe8pe54PjYszVuC9wwZk9skcuFWRYOVU5Vi0zfTIXnO5WHO
pBR6+BSHd04tndfm14qwNGIUa7DY4XwL07VlZVVHJ7vuzk8WyM65O2YuyfNh12O2
6zOMrG+FLYnDH4yiusAgQVEE3utwknrxUm5y0YI7SMLOnhHpbc7UAnhWk0H+AKeW
3jooXGPRT7BOSMLlRc6tvW3EEDJpjB6iUN8CNkc0yFSEFpGXS32YC1hTMcuNvcbG
NXvY6NpeIWHNfXoWZgcrJzMwqcXxhR79oWSyEdn2E69AFUMPmOs=
=Nlce
-----END PGP SIGNATURE-----

--nmemrqcdn5VTmUEE--
