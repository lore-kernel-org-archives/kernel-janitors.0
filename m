From: Wolfram Sang <wsa@kernel.org>
Date: Wed, 05 Aug 2020 22:08:42 +0000
Subject: Re: [PATCH] macintosh: windfarm: fix spelling mistake "detatch" -> "detach"
Message-Id: <20200805220842.GC2182@kunai>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Fig2xvG2VGoz8o/s"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805104337.16104-1-colin.king@canonical.com>
In-Reply-To: <20200805104337.16104-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org


--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 05, 2020 at 11:43:37AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> There are spelling mistakes in DBG messages. Fix them.
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

These comments can go entirely. i2c_detach is long history. And for
remove, we have debugging output in the driver core meanwhile.


--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8rLeoACgkQFA3kzBSg
Kbbf3A//dxQuXCMIP+fM3FpsD9xa0D6BvZJ9uye6lcytP3aB4nYwiyQH1Xa2chW4
DJPf0EYPgesQtRj6/VeAwrjt3I/a4TJcsPrTEPh42f+5lnBtdrjRPWI71ng37Ex8
PftsLWt0XWcveo/b1dfw3v33xLSGDq/+Ivz3perRsQjbW1+YdMXIy3WnfyxkLJDr
ZapgqtZAjIuJNGMym3RYIe6JYzHVJHzBXyNOB5IA99IdG5CvCu0IEMsX+35bCMhD
iCnA9Vnltejf73dv+ELfn5HjBCU2h813GxhZ/Wejl4E5sdgh+a0P+35ML6zOiq2O
wggmD98tGLXgshqnhJE/zEukOZY5b1rLWGvE9kWT6IMn8Z80pbgUloiF7RvddnP7
4LsG8z+soDJh0hZxDcWBZOgEg4xb97MF+7+0vS3miv8SYLqS8fwAjsJgOG/slaiC
aRCd68ndJIC4z25jkkjDIMBbY9yDI2vxUjG4igilXMUJEIEsDFGvf81uuXyZ496I
RBci3lH9ERyT5KW7xkd8WTfR/JxxHp39kOdD3g4NTh52J47YT5c8Io2StwQj+fxQ
NdQGiGR9d1oXVOXHcO/k/T8qoTUMctb5uOc8rfSUYycw0v2TgMb+AwgISq4ovw6L
2t+THEjAWKxIcej9U6b69Bj+DskSo3zoRHZZf4AukUr8awGp1NA=
=luwO
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
