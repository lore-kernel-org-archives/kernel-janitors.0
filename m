From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 13 Mar 2010 02:11:01 +0000
Subject: Re: [PATCH 2/3] drivers/base: init dynamic bin_attribute structures
Message-Id: <20100313021101.GB4034@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="s/l3CgOIzMHHjg/5"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de> <1268377431-11671-3-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1268377431-11671-3-git-send-email-w.sang@pengutronix.de>
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org


--s/l3CgOIzMHHjg/5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2010 at 08:03:50AM +0100, Wolfram Sang wrote:
> Commit 6992f5334995af474c2b58d010d08bc597f0f2fe introduced this requireme=
nt.
> Found with coccinelle, but fixed manually. Compile tested on X86 where
> possible.
>=20
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@suse.de>
> Cc: Eric W. Biederman <ebiederm@xmission.com>

Please drop in favor of http://lkml.org/lkml/2010/3/11/57

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--s/l3CgOIzMHHjg/5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkua9DUACgkQD27XaX1/VRt4EgCcDkrFBx0gQcvMGHD4mpq3zf1K
P8EAn35diMH9RZLuOB6U+QE0/1uoGEQF
=eSd+
-----END PGP SIGNATURE-----

--s/l3CgOIzMHHjg/5--
