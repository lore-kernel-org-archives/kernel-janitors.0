From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 02 Dec 2008 23:12:10 +0000
Subject: Re: [PATCH linux-next] drivers/hvc: Add missing of_node_put
Message-Id: <20081203101210.01e5afab.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Wed__3_Dec_2008_10_12_10_+1100_gFO3uuU0vpljGhti"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200812021438.56071.npalix@diku.dk>
In-Reply-To: <200812021438.56071.npalix@diku.dk>
To: Nicolas Palix <npalix@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, Julia Lawall <julia@diku.dk>, Paul Mackerras <paulus@samba.org>

--Signature=_Wed__3_Dec_2008_10_12_10_+1100_gFO3uuU0vpljGhti
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Dec 2008 14:38:55 +0100 Nicolas Palix <npalix@diku.dk> wrote:
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

--Signature=_Wed__3_Dec_2008_10_12_10_+1100_gFO3uuU0vpljGhti
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk1wMoACgkQjjKRsyhoI8wocgCbBRRR++quM8rPQ8ALskadujgI
c3gAnjUNkQRwlDZ/aAbsdpdGCnaEslfQ
=8UdU
-----END PGP SIGNATURE-----

--Signature=_Wed__3_Dec_2008_10_12_10_+1100_gFO3uuU0vpljGhti--
