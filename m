From: Mark Brown <broonie@kernel.org>
Date: Thu, 15 Jun 2017 19:12:53 +0000
Subject: Re: Applied "ASoC: rockchip: Fix an error handling in 'rockchip_i2s_probe'" to the asoc tree
Message-Id: <20170615191253.ffuz3jay2fothn37@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vog7pfzldkgzzr5q"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170615055311.8049-1-christophe.jaillet@wanadoo.fr>
 <E1dLYRz-0001l4-SZ@debutante>
 <77af69fd-3135-36d6-385b-82d044c32f44@wanadoo.fr>
In-Reply-To: <77af69fd-3135-36d6-385b-82d044c32f44@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org


--vog7pfzldkgzzr5q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2017 at 07:32:53PM +0200, Christophe JAILLET wrote:
> Le 15/06/2017 =E0 19:20, Mark Brown a =E9crit :

> > -	memcpy(soc_dai, &rockchip_i2s_dai, sizeof(*soc_dai));
> >   	if (!of_property_read_u32(node, "rockchip,playback-channels", &val))=
 {
> >   		if (val >=3D 2 && val <=3D 8)
> >   			soc_dai->playback.channels_max =3D val;

> Thanks for taking the patch, but there is a typo in it. A comma is missing
> as spotted by the kbuild test robot.

> I hope that you have seen it and fixed it before applying.

Ugh, no.  Like the mail says this is the patch that got applied.  The
kbuild tests were against the rockchip tree not mine so i thought this
was something else...

--vog7pfzldkgzzr5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllC3DQACgkQJNaLcl1U
h9CEAAf+JeKfeUzWeooD/sYPVbAGraHT7va/JFA3hMaF/CNQMQoMMZ1U8LbwNaVZ
XeBa4i2LIS6rNQZp5IGSw167610FjftjPYpAZwQtWWU/Pkf1YpXITVV/4I2ZAFRD
K+WM9cvjusa4XQDe16h9soImHQ6yih/qELttpJrslm6aMOJcrS15EDI2lFAnVSum
DQAl70cXTss0KlkHuVcbCWSwu8CvcecXviVkYZeb37yOuLQvyw4rrgEp+M+LQHDL
Gs4og9YkIzpsf6EPZV6NuhgWYV+OaXXrCUQj8ippJrHrwKweVroeSG+1knYEAs+S
iqlTS5YEZx0HSh4bF2vyv6kDjrUf3g==
=q0W7
-----END PGP SIGNATURE-----

--vog7pfzldkgzzr5q--
