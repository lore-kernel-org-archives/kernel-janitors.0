From: Pavel Machek <pavel@ucw.cz>
Date: Mon, 28 Aug 2017 10:18:40 +0000
Subject: Re: [PATCH] leds-PowerNV: Delete an error message for a failed memory allocation in powernv_led_crea
Message-Id: <20170828101840.GD18012@amd>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DrWhICOqskFTAXiy"
List-Id: <kernel-janitors.vger.kernel.org>
References: <019499e0-68d8-b89d-f5d6-6aefd9cbaf04@users.sourceforge.net>
In-Reply-To: <019499e0-68d8-b89d-f5d6-6aefd9cbaf04@users.sourceforge.net>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-leds@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Richard Purdie <rpurdie@rpsys.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


--DrWhICOqskFTAXiy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2017-08-27 22:10:08, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 27 Aug 2017 22:00:22 +0200
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DrWhICOqskFTAXiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlmj7gAACgkQMOfwapXb+vIpqwCgmGVD09OHXJj/l/3GSX771ol5
8jAAnAydJgZfNq8MiQ24WhPQXbUaAJIs
=pfpz
-----END PGP SIGNATURE-----

--DrWhICOqskFTAXiy--
