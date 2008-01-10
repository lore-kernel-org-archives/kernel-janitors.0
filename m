From: Rolf Eike Beer <eike-kernel@sf-tec.de>
Date: Thu, 10 Jan 2008 10:02:11 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <200801101102.16971.eike-kernel@sf-tec.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="nextPart1917247.SFkLrUkPMR"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <200801100952.55039.eike-kernel@sf-tec.de> <20080110092528.GA25076@one.firstfloor.org>
In-Reply-To: <20080110092528.GA25076@one.firstfloor.org>
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com

--nextPart1917247.SFkLrUkPMR
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Andi Kleen wrote:
> > Can you explain the rationale behind that running on the BKL? What type
> > of
>
> It used to always run with the BKL because everything used to
> and originally nobody wanted to review all ioctl handlers in tree to see =
if
> they can run with more fine grained locking. A lot probably can though.
>
> > things needs to be protected so that this huge hammer is needed? What
> > would be an earlier point to release the BKL?
>
> That depends on the driver. A lot don't need BKL at all and
> in others it can be easily eliminated. But it needs case-by-case
> review of the locking situation.
>
> The goal of the proposal here is just to make it more visible.

So if I write my own driver and have never heard of ioctls running on BKL=20
before I can rather be sure that I just can change the interface of the ioc=
tl=20
function, put it in unlocked_ioctl and are fine? Cool.

Eike

--nextPart1917247.SFkLrUkPMR
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.4-svn0 (GNU/Linux)

iD8DBQBHhe0oXKSJPmm5/E4RAq3uAJsFlnx+08+XJY9BBJtHkg4VexHQ+ACeLPrG
U5WoilQvBD9/qfJ9EF+K0w0=
=e7EC
-----END PGP SIGNATURE-----

--nextPart1917247.SFkLrUkPMR--
