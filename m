From: "A.s. Dong" <aisheng.dong@nxp.com>
Date: Mon, 30 Jul 2018 08:47:15 +0000
Subject: RE: [PATCH] pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
Message-Id: <AM0PR04MB4211CA18D80AE7EF50FD7888802F0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081648.o6ug4z3t42mrsmop@mwanda>
In-Reply-To: <20180719081648.o6ug4z3t42mrsmop@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Uwe Kleine-K=F6nig [mailto:u.kleine-koenig@pengutronix.de]
> Sent: Monday, July 30, 2018 2:42 PM
> To: Linus Walleij <linus.walleij@linaro.org>
> Cc: Dan Carpenter <dan.carpenter@oracle.com>; A.s. Dong
> <aisheng.dong@nxp.com>; Fabio Estevam <festevam@gmail.com>; kernel-
> janitors@vger.kernel.org; Stefan Agner <stefan@agner.ch>; open list:GPIO
> SUBSYSTEM <linux-gpio@vger.kernel.org>; Sascha Hauer
> <kernel@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>
> Subject: Re: [PATCH] pinctrl: imx: off by one in
> imx_pinconf_group_dbg_show()
>=20
> On Sun, Jul 29, 2018 at 11:23:36PM +0200, Linus Walleij wrote:
> > On Thu, Jul 19, 2018 at 10:17 AM Dan Carpenter
> <dan.carpenter@oracle.com> wrote:
> >
> > > The > should really be >=3D here.  It's harmless because
> > > pinctrl_generic_get_group() will return a NULL if group is invalid.
> > >
> > > Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core
> > > driver")
> > > Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > Patch applied.
>=20
> I see that you applied the imx_pinconf_group_dbg_show patch, but not the
> one specific to imx1 earlier in this thread. These are orthogonal and so =
both
> should be applied.
>=20

Right.

BTW just let you know, unlike that patch, this one is just a simple improve=
ment=20
and don't have to go to stable tree.

Regards
Dong Aisheng

> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 |
> https://emea01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fww
> w.pengutronix.de%2F&amp;data=3D02%7C01%7Caisheng.dong%40nxp.com%7
> C4d3365909e4347b199f608d5f5e787e5%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C0%7C636685297127964877&amp;sdata=3DRpfBCPK%2Fuom9gUGN
> wPCAY%2FR8nK67S66ryT9z5g3HM1k%3D&amp;reserved=3D0  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
