From: Thierry Reding <thierry.reding@gmail.com>
Date: Thu, 10 Jan 2019 11:08:22 +0000
Subject: Re: [PATCH] pwm: imx: Signedness bug in imx_pwm_get_state()
Message-Id: <20190110110822.GA17719@ulmo>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="xHFwDpU9dbj6ez1V"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190109082747.GA5476@kadam>
In-Reply-To: <20190109082747.GA5476@kadam>
To: kernel-janitors@vger.kernel.org


--xHFwDpU9dbj6ez1V
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2019 at 11:18:18AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> On Wed, Jan 09, 2019 at 11:27:47AM +0300, Dan Carpenter wrote:
> > "ret" only holds zero and negative error codes.  It needs to be signed
> > for the error handling to work.
> >=20
> > Fixes: 9f4c8f9607c3 ("pwm: imx: Add ipg clock operation")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> I would have expected a compiler warning but at least for me there is
> none emitted. Hmm.
>=20
> Reviewed-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
>=20
> @Thierry: Given that this is a fix I assume you want to apply this patch
> before my pwm-imx series (which is cleanup only). This will conflict for
> sure with my driver splitting patch. Please tell me if/when I should
> resend my series rebased on top of this patch.

It's fine, I manually applied this on top of the driver split patch.

Thierry

--xHFwDpU9dbj6ez1V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlw3J6YACgkQ3SOs138+
s6FpsBAArtM1IvBCMK3/obcbugb4lMs4wzGpDSU1yNGMGFb2RSvZD1/fjmHL8B0C
k/jhhZuJser/ebVO9lW29NqC8DqdEhj7J6qBhTAlZoq/II6nyuhcrajjVA3SqXpP
nc2kTmT50XyZDL4Q61l0qJszGEBBsESX8fvgVD5YtfbLAQPXzotcl+5w4LLpkd+d
5/5tEbJhEQyV3wuLgedxq6HenW93QhP1C8a708TnB15GWmhxixiKNwueIGxSdeeh
tPiF7ISNyAz8i9lcXFX1qV3x++MU134GGClvD5YaxJarYmMIWIDFn9yWskaxjiPt
sV1s5KCa+kSgOrcAwczziZrdEteILo1RCjbapCfXW9BLegoVNHy0kyaSQzULhnjd
jWbSEacaICGMGJqjHwFr+p0KEBc9Nnbt89J4lHsQkOdcaZ/EcapEJaczME02M7Uw
L7pPWex2D0G/GPTKKtjrTCxJHzcM5DmMNuzIxC9m+5k+OEdqwWjLReSZ73agfSl4
SfQM5OD4PUXBph/8hcdaBHNZcj44BTYI3DlKR+qlrGOPU+xajpJXoHG+Om85nSdt
ss/eaFSpD2943eJDBMKc2LjXUT3iAapwpYxHasCaQl3BKron0suwC1D3cHF+UIPK
7Yuz6hGD4/TZvdDpG70UB0XTd30viRZI1RECQEVYf6lc2+SG0h4=
=qO9H
-----END PGP SIGNATURE-----

--xHFwDpU9dbj6ez1V--
