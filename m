From: Mark Brown <broonie@kernel.org>
Date: Wed, 14 Aug 2013 19:10:28 +0000
Subject: Re: [PATCH 1/16 v2] sound/soc/pxa/mioa701_wm9713.c: Avoid using ARRAY_AND_SIZE(e) as a function argu
Message-Id: <20130814191028.GP2401@sirena.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="D8QxnvyRlKGQJxl7"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376340564-7975-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376340564-7975-1-git-send-email-Julia.Lawall@lip6.fr>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Eric Miao <eric.y.miao@gmail.com>, robert.jarzmik@free.fr, kernel-janitors@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Haojian Zhuang <haojian.zhuang@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org


--D8QxnvyRlKGQJxl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 10:49:24PM +0200, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> Replace ARRAY_AND_SIZE(e) in function argument position to avoid hiding t=
he
> arity of the called function.

Applied the incremental bit of this, thanks.

--D8QxnvyRlKGQJxl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJSC9YhAAoJELSic+t+oim9ymEP+wSn7S9g6F/pfcebCIbtMVpb
VbbfHhzp2OMv+o3ukEblE9BP+HT07QgQomhTBUUFSrhTu9owcDVePbzr6boG5XMh
UN5AZOvPR0wEMdnYEtOXnJoi1Cr0nDMXigZjg5OHL2jwa7hJiV2hKQCMXQsZqcWY
nthplxPqPgaot1c4L18LvTfS1hiiH6+mSUv7gDbe+VOQYYTt6uFv4I3JLQL0v3Wg
qtJL4YsZM7gfMsCwuED8fkLTYJlOBRgYuQrdkgvO667fX7GdZTEJEPeClh1XFRRy
TBL8Jc35FqvbBIW07xP3++QvagbL5Eh2ohz0LzXftbXpjI5QAvT2sQmjJT3agfRU
9lgZ3GSGcM/D5oBJxGOdKRLz6Ul0hTHcpHhTfSgyuAosi38h+GhvioIqIPyx48GW
jOR0+MfSyFsUZUktTVw3H+SRZWhoMVAOYdEyDX/OhfxOHR76sA97yB2qfYNmN/CZ
XdVGL7HzcqhJkGlGLcyW9sHila6nqdcrhigTnjkvoOqBk09/Q2F28tQVnT30LxO6
IkydCSjJ0704jD4VAnJG5MFx7mGnlvk3nE/TyX0R7zh7CRwWjR76g8CpHCtNvSNO
prbAPsFEHWPevoW+O0Cb+oVnH/HSJM7GifBtjHIdILangYPXMDMgojqIsnVAVMCj
ip/gyyc37ghppezt0S+T
=55Gx
-----END PGP SIGNATURE-----

--D8QxnvyRlKGQJxl7--
