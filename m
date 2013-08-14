From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Aug 2013 18:14:55 +0000
Subject: Re: [PATCH 12/29] sound/soc/samsung/ac97.c: simplify use of devm_ioremap_resource
Message-Id: <20130814181455.GH2401@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="FK65GREB+Evh/hTL"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376471493-22215-1-git-send-email-Julia.Lawall@lip6.fr>
 <1376471493-22215-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376471493-22215-13-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org


--FK65GREB+Evh/hTL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2013 at 11:11:16AM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Remove unneeded error handling on the result of a call to
> platform_get_resource when the value is passed to devm_ioremap_resource.

Applied, thanks.

--FK65GREB+Evh/hTL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC8kcAAoJELSic+t+oim9VPoP/2AtXDR4sUam3Yv71XQ8x5Yc
Wj2NqbV2IewRM4CLzfouBfaOiKM9DrquVSNy3/QTXiQ1aCtt1vWqnkoxffoW62cj
NUwTJfAgZ2xb5lidFYnQzkBOXMlIEcxgDh4nLODwFSvrdRHVBoZZlxWNjK60bJcq
mOdwe/iYONf6iu2vz3Lbire4lQZXlz7H553EeeZ+xdk+xxuOW7jI2lCdpfZ5qm8c
vxUzv3v4CtGNJf6oT8czFN8kIILZlzR7q3XI2s8gJNMKR9pNURd1O0kTHEl9wXGK
4geOMZ2Th0K+fCR2Fo3ekEbs5MGlXipqgg3RI5IfHdnOXkpO6W6Ifca1M9g3TcRB
JjdKyeoF1CKbMyJrd2kBccMoOspZaLBLQmgGhtQSULsGAgf8zaLrW44ayZsyoBRd
IKmCE3OKRrXAJ5IDLFoBteYVnMT7HbzyjbZekPAzUFnkTg2Z+ncLIsxg9L+TvXZR
5hZgbWsS70nR3xKvuAD0nyemRPq9bnuE8KVcVbpGjIknU89rDG4vA9GKhaOEdEXU
VrUHvH8OWFq/6lsMPefpWEBuG9Il3BtiZD7Rx9MWua6A6+MMRHZRrBuZiZZJhg3w
r8h44z87huOfnYomNR2fDgLaoCNoqLoF8bymhsB5SANdTC8D2I3hvUWEfHvZP7El
7kO+8Fk+B+1CcR3UgzR3
=DU1Y
-----END PGP SIGNATURE-----

--FK65GREB+Evh/hTL--
