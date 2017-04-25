From: Pavel Machek <pavel@ucw.cz>
Date: Tue, 25 Apr 2017 11:54:46 +0000
Subject: Re: [PATCH 3/3] HSI: omap_ssi: Delete an error message for a failed memory allocation in ssi_add_con
Message-Id: <20170425115446.GC7926@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="1SQmhf2mF2YjsYvc"
List-Id: <kernel-janitors.vger.kernel.org>
References: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
 <e6102bce-0b27-68e6-8247-f87851f7f9b9@users.sourceforge.net>
In-Reply-To: <e6102bce-0b27-68e6-8247-f87851f7f9b9@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--1SQmhf2mF2YjsYvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2017-04-25 13:18:31, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 25 Apr 2017 12:42:14 +0200
>=20
> The script "checkpatch.pl" pointed information out like the following.
>=20
> WARNING: Possible unnecessary 'out of memory' message
>=20
> Thus remove such a statement here.

Any reason to believe it is good idea besides program telling you it
_might_ be?
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--1SQmhf2mF2YjsYvc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlj/OQYACgkQMOfwapXb+vIXmQCeMoGSc52o2isav2ncswTZ7L4/
1YwAoLEllV0JNoMZgcXcDZbhGSMKsVd3
=MVUh
-----END PGP SIGNATURE-----

--1SQmhf2mF2YjsYvc--
