From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 31 Mar 2010 01:52:25 +0000
Subject: Re: [PATCH 1/12] arch/powerpc/kernel: Add missing unlock
Message-Id: <20100331125225.3714c9f6.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Wed__31_Mar_2010_12_52_25_+1100_6WvQH3F2B.u.+QJk"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1003291733150.21896@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1003291733150.21896@ask.diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org

--Signature=_Wed__31_Mar_2010_12_52_25_+1100_6WvQH3F2B.u.+QJk
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Julia,

On Mon, 29 Mar 2010 17:33:34 +0200 (CEST) Julia Lawall <julia@diku.dk> wrot=
e:
>
> From: Julia Lawall <julia@diku.dk>
>=20
> Add an unlock before exiting the function.

Thanks for this.

> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__31_Mar_2010_12_52_25_+1100_6WvQH3F2B.u.+QJk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuyqtkACgkQjjKRsyhoI8wchQCeO0mO1cTe2HbjLlJ0XKe7lA7z
Uc4AmgM1Ki+gVC52iFCoEMNOVkFAUsGO
=hDu/
-----END PGP SIGNATURE-----

--Signature=_Wed__31_Mar_2010_12_52_25_+1100_6WvQH3F2B.u.+QJk--
