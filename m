From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 30 Jul 2018 09:21:11 +0000
Subject: Re: [PATCH] pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
Message-Id: <20180730092111.2rfygpnw7selup25@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081648.o6ug4z3t42mrsmop@mwanda>
In-Reply-To: <20180719081648.o6ug4z3t42mrsmop@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jul 30, 2018 at 11:04:59AM +0200, Linus Walleij wrote:
> On Mon, Jul 30, 2018 at 8:41 AM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Sun, Jul 29, 2018 at 11:23:36PM +0200, Linus Walleij wrote:
> > > On Thu, Jul 19, 2018 at 10:17 AM Dan Carpenter <dan.carpenter@oracle.=
com> wrote:
> > >
> > > > The > should really be >=3D here.  It's harmless because
> > > > pinctrl_generic_get_group() will return a NULL if group is invalid.
> > > >
> > > > Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core dr=
iver")
> > > > Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > Patch applied.
> >
> > I see that you applied the imx_pinconf_group_dbg_show patch, but not the
> > one specific to imx1 earlier in this thread. These are orthogonal and so
> > both should be applied.
>=20
> Oh I'm sorry if I missed something... which subject does the missing
> patch have?

The subject is:

pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()=20

(Note it only differs by s/imx/imx1/ from the patch you already took.)

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
