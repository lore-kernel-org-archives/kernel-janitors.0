From: "A.s. Dong" <aisheng.dong@nxp.com>
Date: Sat, 14 Jul 2018 08:14:41 +0000
Subject: RE: [PATCH] pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
Message-Id: <AM0PR04MB4211C8FA0F3188625D07C2F9805F0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
In-Reply-To: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Copy linux-imx@nxp.com

> -----Original Message-----
> From: A.s. Dong
> Sent: Saturday, July 14, 2018 4:13 PM
> To: 'Dan Carpenter' <dan.carpenter@oracle.com>; Markus Pargmann
> <mpa@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>; Shawn Guo
> <shawnguo@kernel.org>; Stefan Agner <stefan@agner.ch>; Pengutronix
> Kernel Team <kernel@pengutronix.de>; Linus Walleij
> <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: RE: [PATCH] pinctrl: freescale: off by one in
> imx1_pinconf_group_dbg_show()
> 
> > -----Original Message-----
> > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > Sent: Friday, July 13, 2018 10:55 PM
> > To: A.s. Dong <aisheng.dong@nxp.com>; Markus Pargmann
> > <mpa@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>; Shawn Guo
> > <shawnguo@kernel.org>; Stefan Agner <stefan@agner.ch>; Pengutronix
> > Kernel Team <kernel@pengutronix.de>; Linus Walleij
> > <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; kernel-
> > janitors@vger.kernel.org
> > Subject: [PATCH] pinctrl: freescale: off by one in
> > imx1_pinconf_group_dbg_show()
> >
> > The info->groups[] array is allocated in imx1_pinctrl_parse_dt().  It
> > has info-
> > >ngroups elements.  Thus the > here should be >= to prevent reading
> > >one
> > element beyond the end of the array.
> >
> > Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>
> 
> BTW It seems pinctrl-imx.c has the same issue although it won't trigger real
> error because the second check causes the return. But the fix still applies. So
> would you send anther fix for pinctrl-imx as well?
> 
> Regards
> Dong Aisheng
> 
> >
> > diff --git a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> > b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> > index c3bdd90b1422..deb7870b3d1a 100644
> > --- a/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> > +++ b/drivers/pinctrl/freescale/pinctrl-imx1-core.c
> > @@ -429,7 +429,7 @@ static void imx1_pinconf_group_dbg_show(struct
> > pinctrl_dev *pctldev,
> >  	const char *name;
> >  	int i, ret;
> >
> > -	if (group > info->ngroups)
> > +	if (group >= info->ngroups)
> >  		return;
> >
> >  	seq_puts(s, "\n");
