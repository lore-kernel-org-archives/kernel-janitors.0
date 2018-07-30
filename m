From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 30 Jul 2018 09:25:20 +0000
Subject: Re: [PATCH] pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
Message-Id: <20180730092520.gwww3wfq2qggs3mt@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081648.o6ug4z3t42mrsmop@mwanda>
In-Reply-To: <20180719081648.o6ug4z3t42mrsmop@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jul 30, 2018 at 08:47:15AM +0000, A.s. Dong wrote:
> > -----Original Message-----
> > From: Uwe Kleine-K=F6nig [mailto:u.kleine-koenig@pengutronix.de]
> > Sent: Monday, July 30, 2018 2:42 PM
> > To: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>; A.s. Dong
> > <aisheng.dong@nxp.com>; Fabio Estevam <festevam@gmail.com>; kernel-
> > janitors@vger.kernel.org; Stefan Agner <stefan@agner.ch>; open list:GPIO
> > SUBSYSTEM <linux-gpio@vger.kernel.org>; Sascha Hauer
> > <kernel@pengutronix.de>; Shawn Guo <shawnguo@kernel.org>
> > Subject: Re: [PATCH] pinctrl: imx: off by one in
> > imx_pinconf_group_dbg_show()
> >=20
> > On Sun, Jul 29, 2018 at 11:23:36PM +0200, Linus Walleij wrote:
> > > On Thu, Jul 19, 2018 at 10:17 AM Dan Carpenter
> > <dan.carpenter@oracle.com> wrote:
> > >
> > > > The > should really be >=3D here.  It's harmless because
> > > > pinctrl_generic_get_group() will return a NULL if group is invalid.
> > > >
> > > > Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core
> > > > driver")
> > > > Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > Patch applied.
> >=20
> > I see that you applied the imx_pinconf_group_dbg_show patch, but not the
> > one specific to imx1 earlier in this thread. These are orthogonal and s=
o both
> > should be applied.
> >=20
>=20
> Right.
>=20
> BTW just let you know, unlike that patch, this one is just a simple impro=
vement=20
> and don't have to go to stable tree.

To clearify: the imx1 change (ie. the one currently missed) is the
critical one as it fixes an out-of-bounds access.
imx_pinconf_group_dbg_show was harmless, the only change is that with it
applied there is one "\n" less in the output.

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
