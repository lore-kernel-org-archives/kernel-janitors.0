From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Tue, 22 Nov 2016 15:49:01 +0000
Subject: Re: [PATCH] drm/sun4i: Fix a return value in case of error
Message-Id: <20161122154901.3bccughk6q6miu6w@lukather>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3e655cg6hvdio2dt"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161118181847.8436-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161118181847.8436-1-christophe.jaillet@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org, linux-arm-kernel@lists.infradead.org


--3e655cg6hvdio2dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 07:18:47PM +0100, Christophe JAILLET wrote:
> If 'sun4i_backend_drm_format_to_layer()' does not return 0, then 'val' is
> left unmodified.
> As it is not initialized either, the return value can be anything.
>=20
> It is likely that returning the error code was expected here.
>=20
> As the only caller of 'sun4i_backend_update_layer_formats()' does not che=
ck
> the return value, this fix is purely theorical.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3e655cg6hvdio2dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYNGjlAAoJEBx+YmzsjxAgvoEP/R6MpGtNLX59wtAY26djOih8
3P0ZS+zNsDn/oNKNYwYJQhl+hDOj1D2bj5yoIK2hi0kdhKULiJgeo6cD/MxV0BYj
TQ4xvbcrJQMeL4YNhCPuCsueNfU+W8mkcgV/wDx573rFo+5rAOsyltN2JCnP+ZPz
gxLW8Xua1GjyvUwFSvqUZPEIn76xMMTWRrntB21BeX/9MjCzEZ8PdhCkquNigJPb
v3VyZjQdQ/H3GNHQtdZdatjmtQWoqOgpUo2ULpQMG/HbTYhyqQkyxaB9RfTDVkLj
pSxGACb8vWSImC7Oot0Oz4bkb7WAntUjUhWroRn43moLJGbcL2RcZLj31PAUJgCr
jZ/q23LSwhhPDQ3uWiihV8kk6UGtMTQdgvWtXL4S/B5QE1c2DCauN0hZL1j1tdGU
NufLL/KaYs4H71g7oRK3A5FOA/bUi3NU+WXuCQHVtnHOnG0+FhuGtf0G2mk+4H68
g0pMxvgnDUFINp1gmMcyLxRlxiDUWXnXZaMDNXZVO5o6/kI2ipT6GWGmHx2UlTi+
mkIOG7pY2mwwYSySnCdq02kGBnCiNma8DM7PE8hQdUSg7nOD/R+9eW1h+m93QpHI
TJMXKw/r3gVyU8QJQgW204R1zdffzPyiF154h7U0/Sb3evWe4VtC1gxcmTm3bnSj
0QD3LVas9VjNyGaJLuNA
=HX80
-----END PGP SIGNATURE-----

--3e655cg6hvdio2dt--
