From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 09 May 2004 12:10:14 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.6-rc3 0/16] remove old kernel ifdefs
Message-Id: <200405091410.18445.arnd@arndb.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55559486015296033=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040508233813.GA1636@masina>
In-Reply-To: <20040508233813.GA1636@masina>
To: kernel-janitors@vger.kernel.org


--===============55559486015296033==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_q+hnAZljCoM684R";
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


--Boundary-02=_q+hnAZljCoM684R
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 09 May 2004 01:38, Domen Puncer wrote:
> Patches to remove some old ifdefs

Did you to run Randy's scripts/checkversion.pl script over the changed
files? I'd guess that you can remove most of the #include <linux/version.h>
from them as well.

	Arnd <><

--Boundary-02=_q+hnAZljCoM684R
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAnh+q5t5GS2LDRf4RAkORAJ0ZbKKF7XjxgojLSRp3axx2e5OufgCfb11B
WA/4syFpGvEYrMYjek4c28I=
=GeRC
-----END PGP SIGNATURE-----

--Boundary-02=_q+hnAZljCoM684R--

--===============55559486015296033==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55559486015296033==--
