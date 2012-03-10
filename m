From: Wolfram Sang <w.sang@pengutronix.de>
Date: Sat, 10 Mar 2012 18:13:15 +0000
Subject: Re: [PATCH] drivers/ata/pata_mpc52xx.c: add missing kfree
Message-Id: <20120310181315.GA4139@pengutronix.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331402199-8000-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1331402199-8000-1-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jeff Garzik <jgarzik@pobox.com>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org


--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 10, 2012 at 06:56:39PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> There is no need to call the devm cleanup functions on failure of a probe
> or remove function.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Right. Only the subject is bogus and the maintainer for MPC5xxx is Anatolij
meanwhile :)

Other than that:

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--mP3DRpeJDSE+ciuQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9bmbsACgkQD27XaX1/VRufugCfUO9je0DnU1nSAfF+PY5LsvwG
4R0An2Aqo4Kuj3RH0it4yKh6syKdlDn9
=B1sM
-----END PGP SIGNATURE-----

--mP3DRpeJDSE+ciuQ--
