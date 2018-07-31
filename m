From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Tue, 31 Jul 2018 08:52:43 +0000
Subject: Re: [PATCH] pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
Message-Id: <20180731085243.v3g3vrjrngs4ib3y@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
 <CACRpkdaBM1tvbL9k7ZepEgnSC00_iLOStyb9B2t2=DipVgEW_A@mail.gmail.com>
In-Reply-To: <CACRpkdaBM1tvbL9k7ZepEgnSC00_iLOStyb9B2t2=DipVgEW_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, kernel-janitors@vger.kernel.org, Stefan Agner <stefan@agner.ch>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>

Hello,

On Mon, Jul 30, 2018 at 05:43:43PM +0200, Linus Walleij wrote:
> On Fri, Jul 13, 2018 at 4:55 PM Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>=20
> > The info->groups[] array is allocated in imx1_pinctrl_parse_dt().  It
> > has info->ngroups elements.  Thus the > here should be >=3D to prevent
> > reading one element beyond the end of the array.
> >
> > Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Patch applied.
>=20
> I am not tagging for stable as it is debug code and does not
> affect end users.

Not sure this is a valid reason. Distro kernels usually enable debugfs.
I'd say an out-of-bounds access that can only be triggered by root
should still be fixed. I won't argue but added stable to the addressees
of this mail to at least raise awareness.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
