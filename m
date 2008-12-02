From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 02 Dec 2008 23:08:18 +0000
Subject: Re: [PATCH linux-next] drivers/macintosh: Add missing of_node_put
Message-Id: <20081203100818.29793232.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Wed__3_Dec_2008_10_08_18_+1100_D_By.6Mrt0gQ0Cs5"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812021436.44286.npalix@diku.dk>
In-Reply-To: <200812021436.44286.npalix@diku.dk>
To: Nicolas Palix <npalix@diku.dk>
Cc: Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>

--Signature=_Wed__3_Dec_2008_10_08_18_+1100_D_By.6Mrt0gQ0Cs5
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Dec 2008 14:36:44 +0100 Nicolas Palix <npalix@diku.dk> wrote:
>
> of_node_put is needed before discarding a value received from
> of_find_node_by_name, eg in error handling code or when the device
> node is no longer used.
>=20
> Signed-off-by: Nicolas Palix <npalix@diku.dk>
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__3_Dec_2008_10_08_18_+1100_D_By.6Mrt0gQ0Cs5
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk1v+IACgkQjjKRsyhoI8w+xgCdE6ylniCLtXz/tuGlFnURN4Qg
BtUAn2geCSpb8NyGBQ6k5uHgzpBlmBLx
=Sc/m
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Dec_2008_10_08_18_+1100_D_By.6Mrt0gQ0Cs5--
