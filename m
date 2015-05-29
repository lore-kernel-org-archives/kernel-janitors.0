From: Mark Brown <broonie@kernel.org>
Date: Fri, 29 May 2015 09:37:11 +0000
Subject: Re: [PATCH 9/9] regmap: drop unneeded goto
Message-Id: <20150529093711.GJ21577@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="hXQ6vCYkRASBxN6g"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432846944-7122-1-git-send-email-Julia.Lawall@lip6.fr>
 <1432846944-7122-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1432846944-7122-10-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org


--hXQ6vCYkRASBxN6g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2015 at 11:02:24PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Delete jump to a label on the next line, when that label is not
> used elsewhere.

Applied, thanks.

--hXQ6vCYkRASBxN6g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEbBAEBCAAGBQJVaDNGAAoJECTWi3JdVIfQjKQH9isiKkkbAJHj6eqCznskU76G
SSwsJaEOajv5zSlvN0dckzABz1bg6ecKGk03f2COBkrnZPwwhobvxFerQeogdBw3
QX3kSvV2+rhvkZqu2LuDEybrrbY33eCA5+WRAz+0T+qDSf4uTQ+MoMuK2gSogVAF
c8wGbbsRJzlSdVsyGecV5wizpKZMKSgUKRAYBBnUKndf600F2x6L9FsDNv5jgx23
aHN0tTGezwNUqXMv21YunEZnecgg9hjuX18GIx18XfR2NJTMzbGwiaORawRV4W96
aXUcpiG4YPx69OJF2/74UiGM7zPGCtMpmHhhA81gXTWHjlPLe218u/JbBhBPTw==
=MXat
-----END PGP SIGNATURE-----

--hXQ6vCYkRASBxN6g--
