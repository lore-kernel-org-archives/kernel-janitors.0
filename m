From: Samuel Iglesias =?ISO-8859-1?Q?Gons=E1lvez?=  <siglesias@igalia.com>
Date: Mon, 22 Oct 2012 07:38:17 +0000
Subject: Re: [staging:staging-next 15/18] drivers/staging/ipack/carriers/tpci200.c:190:2: error: implicit dec
Message-Id: <1350891497.5065.9.camel@fourier.local.igalia.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="=-Q3olqbLXW8JufDdLAmwn"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121020110833.GF5714@localhost>
In-Reply-To: <20121020110833.GF5714@localhost>
To: kernel-janitors@vger.kernel.org


--=-Q3olqbLXW8JufDdLAmwn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Fengguang,

On Sat, 2012-10-20 at 19:08 +0800, Fengguang Wu wrote:
> Hi Jens,
>=20
> FYI, kernel build failed on
>=20
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
staging-next
> head:   1bc7c1c71d7f84baff254868222312bf14915128
> commit: 052c4cfc92f5ce6334fdaf6926e7c177bc1cc099 [15/18] staging: ipack: =
Rename bridges to carriers.
> config: parisc-allyesconfig # make ARCH=3Dparisc allyesconfig
>=20
> Probably need a
>=20
>         #include <linux/slab.h>

Thanks for your report. I sent a fix for this issue.

Best regards,

Sam

--=-Q3olqbLXW8JufDdLAmwn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEABECAAYFAlCE9+kACgkQWrfbyfmd9eJvAgCdEjes9GwbzsmN+GO3RLDlAA3S
ackAn1r0tbQs15c3Zg2Ab91ezIesECO9
=Pwge
-----END PGP SIGNATURE-----

--=-Q3olqbLXW8JufDdLAmwn--

