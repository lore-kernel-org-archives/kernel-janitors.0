From: Miklos Vajna <vmiklos@frugalware.org>
Date: Wed, 22 Dec 2010 21:11:51 +0000
Subject: Re: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <20101222211151.GB10557@genesis.frugalware.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="kM/PxlMMHsUUNZZW"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101219020313.GJ31750@genesis.frugalware.org>
 <20101222002248.GP10557@genesis.frugalware.org>
 <1293006589.2170.41.camel@laptop>
 <1293007311.11370.172.camel@marge.simson.net>
 <1293008842.2170.70.camel@laptop>
 <20101222133154.GS10557@genesis.frugalware.org>
 <1293026422.2170.136.camel@laptop>
 <1293027112.2170.140.camel@laptop>
 <20101222151434.GW10557@genesis.frugalware.org>
 <1293037718.2170.155.camel@laptop>
In-Reply-To: <1293037718.2170.155.camel@laptop>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mike Galbraith <efault@gmx.de>, shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, Greg KH <greg@kroah.com>


--kM/PxlMMHsUUNZZW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2010 at 06:08:38PM +0100, Peter Zijlstra <peterz@infradead.=
org> wrote:
> On Wed, 2010-12-22 at 16:14 +0100, Miklos Vajna wrote:
> > kernel-build is a git build using the config I already sent and after a
> > 'git checkout v2.6.36'. I can try to build master as well, so far what I
> > saw is that the bug occurs there as well, but less frequently, so maybe
> > that's a bit harder to debug.=20
>=20
> Right, so I've got v2.6.36 exploding, current -git and -tip won't
> explode for me, tried both about 20 times. So I'll try and figure out
> wth makes .36 explode and then see if further kernel still suffer that
> problem.

I reported the issue as I tested 2.6.36 and 2.6.37-rc6 and both failed.
Now I tried current -git and indeed I can't reproduce the issue there.

I'm now bisecting between master and rc6 to see which commit fixes the
problem - just to make sure it's not something irrelevant and the bug is
still hidden somewhere.

--kM/PxlMMHsUUNZZW
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk0SaZcACgkQe81tAgORUJbdKwCeNBk8NYZeCTjzu0Zoq7e8k1Q2
/60AoJL8d4v1NWcNso5D4T8bEg+L0BDp
=uSLB
-----END PGP SIGNATURE-----

--kM/PxlMMHsUUNZZW--
