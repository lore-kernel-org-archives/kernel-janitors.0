From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Aug 2013 16:49:08 +0000
Subject: Re: [PATCH 5/29] spi/spi-{bcm63xx.c,bfin-v3.c}: simplify use of devm_ioremap_resource
Message-Id: <20130814164908.GA2401@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="5mCyUwZo2JvN/JJP"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376471493-22215-6-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-6-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 11:11:09AM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.

Applied, thanks.

--5mCyUwZo2JvN/JJP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC7T9AAoJELSic+t+oim9RUgP/iGWJ9ojjBPTSuLz9V0StxOK
ARqaFHRNJgYvs6Nkor8p2IAvmOYqwBKInyUjgb1G2M92qxVs6C1Z9TR1WZchaLzk
Pas9h5EAaRmIsuD2+IGUoXaKpEJ8NO4nvaydypjVaOhYdYOKszXTzLAd2jkW3fYe
K7sI55VSzW7zpkMt6NC9Nw6AkVJItACmESwS12zE1Hy9pVlgy1HBYRpH2p4EF2kA
uLyVoMkqtfviwKtnZs1UY7XXFcUCVvd//jpD9XJHSBltdufT3pzkdOfxzl81B6YI
XiWHNq0jiwQJuGk/ovYnV2K00Kw5itmUnMGesUtb1EQIDCgvdcj1mwHN4gWt9tY6
1tvYP0ZvqEiZ4fRra49piXbp2EzMQt77c8GP5jf6GerHWwWOSfOGo/OrXdNbTnmU
l0HTkbab3FDaggSrSjGbgInyZoTEcWQvBNPnyEZR6q42KxfRVlA6eJ4q0oawXbak
s0dcrhwwxIRPPAX2awzbN28goMjRZS3g3XlR2Z+yOlroBVDkPmEkncaxhV1R9IFM
ctNyctCcgSAT59MiOppXzIZAm++DT+W8waagOi6ZXslYqBuWo/NPYPI4mLAa4jEs
4uhsmnjIJrlfBqlS9oUwuJFY7vgdapYnWA96PZ9vnBU2BEnLU6vygHuH/iaE25ba
tFnmsXm+lwyewezfNGu0
=k3Jx
-----END PGP SIGNATURE-----

--5mCyUwZo2JvN/JJP--
