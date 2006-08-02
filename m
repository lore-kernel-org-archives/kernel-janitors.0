From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 02 Aug 2006 03:54:42 +0000
Subject: Re: [KJ] [PATCH] apm: clean up module initalization
Message-Id: <20060802135442.76e95fa9.sfr@canb.auug.org.au>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2118666747=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060801214545.GA6827@martell.zuzino.mipt.ru>
In-Reply-To: <20060801214545.GA6827@martell.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============2118666747==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar"

--Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Aug 2006 22:21:52 -0400 Neil Horman <nhorman@tuxdriver.com> wrote:
>
> Copy all that.  New patch attached, with corrected cleanups for dangling =
proc
> entry on kernel_thread failure, and logged warning on failure to register
> misc_device.
>=20
> Regards
> Neil
>=20
> Signed-off-by: Neil Horman <nhorman@tuxdriver.com>

Acked-by: Stephen Rothwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFE0CICFdBgD/zoJvwRAjvyAJoCAt1cURdLI2+pMMWiNLFf+M2wGwCeMzNw
xuaifrPq+xiuJ3URGmpOfrY=
=h8yS
-----END PGP SIGNATURE-----

--Signature=_Wed__2_Aug_2006_13_54_42_+1000_h5aefeONG.g_mYar--

--===============2118666747==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2118666747==--
