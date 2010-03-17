From: Eric Anholt <eric@anholt.net>
Date: Wed, 17 Mar 2010 20:30:50 +0000
Subject: Re: [patch] i915: fix small leak on error path
Message-Id: <87k4tak7wl.fsf@pollan.anholt.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-=-="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100306110539.GD4958@bicker>
	<20100306115054.GA3462@viiv.ffwll.ch>
In-Reply-To: <20100306115054.GA3462@viiv.ffwll.ch>
To: Daniel Vetter <daniel@ffwll.ch>, Dan Carpenter <error27@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, maximlevitsky@gmail.com, Chris Wilson <chris@chris-wilson.co.uk>, Luca Barbieri <luca@luca-barbieri.com>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

--=-=-=
Content-Transfer-Encoding: quoted-printable

On Sat, 6 Mar 2010 12:50:54 +0100, Daniel Vetter <daniel@ffwll.ch> wrote:
> Oh, dang. Thanks for catching this. Eric, please merge.
>=20
> Cc: stable@kernel.org (for .33)
> Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
>=20
> On Sat, Mar 06, 2010 at 02:05:39PM +0300, Dan Carpenter wrote:
> > We should free "params" before returning.
> >=20
> > Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.  Thanks!

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuhO/oACgkQHUdvYGzw6vfNQQCfd9iu1hzTfEypRak0IiZ1IQce
eY8AmwcR1UWFehBnP3jmvCjpe8+TKZyA
=XICB
-----END PGP SIGNATURE-----
--=-=-=--
