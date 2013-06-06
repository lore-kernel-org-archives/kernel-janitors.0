From: Solomon Peachy <pizza@shaftnet.org>
Date: Thu, 06 Jun 2013 10:55:39 +0000
Subject: Re: [patch] cw1200: remove an unreachable goto
Message-Id: <20130606105538.GA6302@shaftnet.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="zhXaljGHf11kAtnf"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130606105145.GC12953@debian>
In-Reply-To: <20130606105145.GC12953@debian>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2013 at 03:51:45AM -0700, Dan Carpenter wrote:
> The "return" is correct and the unreachable "goto" line is wrong.
> I have deleted it.

A patch for this was posted earlier by Joe Perches.  It's in my tree=20
now, awaiting merging.

 - Solomon
--=20
Solomon Peachy        		       pizza at shaftnet dot org	=20
Delray Beach, FL                          ^^ (email/xmpp) ^^
Quidquid latine dictum sit, altum viditur.

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iD8DBQFRsGqqPuLgii2759ARAoblAKCkhxFHuWE0yqltP41WOMDYtY/PiQCfVDVH
s6eMr9j8F1eWgzz0l5K5ihA=
=19T3
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
