From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 26 Oct 2020 10:23:51 +0000
Subject: Re: [PATCH resend] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-Id: <20201026102351.yhiuuklu6q5xba6k@gilmour.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wqc7vvjf6t3frdq3"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191024205306.GA14416@mwanda> <20201026094905.GA1634423@mwanda>
In-Reply-To: <20201026094905.GA1634423@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Anholt <eric@anholt.duckdns.org>, Stephen Rothwell <sfr@canb.auug.org.au>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org


--wqc7vvjf6t3frdq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 12:49:05PM +0300, Dan Carpenter wrote:
> Originally this error path used to leak "bin" but then we accidentally
> applied two separate commits to fix it and ended up with a double free.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Resending a year later because it was confusing at the time who should
> apply this and it fell through the cracks.  For some reason the kbuild
> bot flagged it as a new warning so it showed up on my radar again.

Applied, thanks!
Maxime

--wqc7vvjf6t3frdq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5ajtwAKCRDj7w1vZxhR
xbsOAP9+wXjpnneXqYX/IW1SAYx+BadjnZcNpZ81x9nrkrL2bAEAvKpyfpvc/yGA
RYGsUWFVwQTl/qoRUSzoFkNmeBsYrAg=
=yJd/
-----END PGP SIGNATURE-----

--wqc7vvjf6t3frdq3--
