From: Tilman Schmidt <tilman@imap.cc>
Date: Tue, 16 Mar 2010 16:59:22 +0000
Subject: Re: bug list: range checking issues 2.6.34-rc1
Message-Id: <4B9FB8EA.1070008@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enigC06588C43BF4AA4B531041EE"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100315083008.GK18181@bicker>
In-Reply-To: <20100315083008.GK18181@bicker>
To: Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigC06588C43BF4AA4B531041EE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 15.03.2010 09:30 schrieb Dan Carpenter:
> drivers/isdn/gigaset/capi.c +1305 do_connect_req() 'cip2bchlc' 29 <=3D =
29

You're right. That's a bug. Thanks for catching it. I'll prepare a patch
right away.


--=20
Tilman Schmidt                    E-Mail: tilman@imap.cc
Bonn, Germany
Diese Nachricht besteht zu 100% aus wiederverwerteten Bits.
Unge=F6ffnet mindestens haltbar bis: (siehe R=FCckseite)


--------------enigC06588C43BF4AA4B531041EE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.12 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkufuPYACgkQQ3+did9BuFvbrwCaAnI35LSk5uKL+uliZ3lr1j2c
e18An25l1qUwv1f/SvRmy2n9lPLW5qTP
=8keU
-----END PGP SIGNATURE-----

--------------enigC06588C43BF4AA4B531041EE--
