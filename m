From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 30 Jul 2018 06:41:47 +0000
Subject: Re: [PATCH] pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
Message-Id: <20180730064147.27xsfou5bbqndxt7@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081648.o6ug4z3t42mrsmop@mwanda>
In-Reply-To: <20180719081648.o6ug4z3t42mrsmop@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Jul 29, 2018 at 11:23:36PM +0200, Linus Walleij wrote:
> On Thu, Jul 19, 2018 at 10:17 AM Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>=20
> > The > should really be >=3D here.  It's harmless because
> > pinctrl_generic_get_group() will return a NULL if group is invalid.
> >
> > Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core driver=
")
> > Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Patch applied.

I see that you applied the imx_pinconf_group_dbg_show patch, but not the
one specific to imx1 earlier in this thread. These are orthogonal and so
both should be applied.

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
