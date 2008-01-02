From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 02 Jan 2008 00:18:08 +0000
Subject: Re: [PATCH 1/3] arch/powerpc/platforms/pseries: Add missing
Message-Id: <20080102111808.3e358093.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Signature=_Wed__2_Jan_2008_11_18_08_+1100_Gb_ViJ98z6KoLqW6"
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0801012202040.19803@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0801012202040.19803@ask.diku.dk>
To: Julia Lawall <julia@diku.dk>
Cc: paulus@au.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--Signature=_Wed__2_Jan_2008_11_18_08_+1100_Gb_ViJ98z6KoLqW6
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Jan 2008 22:02:49 +0100 (CET) Julia Lawall <julia@diku.dk> wrote:
>
> From: Julia Lawall <julia@diku.dk>
>=20
> Of_get_parent and of_find_compatible_node do an of_node_get, and thus a
> corresponding of_code_put is needed in the error case.

Thanks for these.

In the future, any patch that touches arch/powerpc (or
include/asm-powerpc) should be (at least) cc'd to linuxppc-dev@ozlabs.org
(where the PowerPC developers lurk).  That way they will also be saved in
Patchwork (http://patchwork.ozlabs.org/) and not lost.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Jan_2008_11_18_08_+1100_Gb_ViJ98z6KoLqW6
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHethFTgG2atn1QN8RAgpXAJ0bbZQvWovvFZrZF89BttepRaRk7QCeM6yH
vRuwKIsu7m8XW8N5BuFLbxY=
=6KpH
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Jan_2008_11_18_08_+1100_Gb_ViJ98z6KoLqW6--
