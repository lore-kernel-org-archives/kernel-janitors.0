From: "A.s. Dong" <aisheng.dong@nxp.com>
Date: Sat, 14 Jul 2018 11:37:54 +0000
Subject: RE: [PATCH] pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
Message-Id: <AM0PR04MB42116D6214FE3700F6707471805F0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
In-Reply-To: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Saturday, July 14, 2018 7:03 PM
> To: A.s. Dong <aisheng.dong@nxp.com>
> Cc: Markus Pargmann <mpa@pengutronix.de>; dl-linux-imx <linux-
> imx@nxp.com>; Fabio Estevam <festevam@gmail.com>; Shawn Guo
> <shawnguo@kernel.org>; Stefan Agner <stefan@agner.ch>; Pengutronix
> Kernel Team <kernel@pengutronix.de>; Linus Walleij
> <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: Re: [PATCH] pinctrl: freescale: off by one in
> imx1_pinconf_group_dbg_show()
> 
> On Sat, Jul 14, 2018 at 08:14:41AM +0000, A.s. Dong wrote:
> > Copy linux-imx@nxp.com
> >
> > > -----Original Message-----
> > > From: A.s. Dong
> > > Sent: Saturday, July 14, 2018 4:13 PM
> > > To: 'Dan Carpenter' <dan.carpenter@oracle.com>; Markus Pargmann
> > > <mpa@pengutronix.de>
> > > Cc: Fabio Estevam <festevam@gmail.com>; Shawn Guo
> > > <shawnguo@kernel.org>; Stefan Agner <stefan@agner.ch>; Pengutronix
> > > Kernel Team <kernel@pengutronix.de>; Linus Walleij
> > > <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; kernel-
> > > janitors@vger.kernel.org
> > > Subject: RE: [PATCH] pinctrl: freescale: off by one in
> > > imx1_pinconf_group_dbg_show()
> > >
> > > > -----Original Message-----
> > > > From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> > > > Sent: Friday, July 13, 2018 10:55 PM
> > > > To: A.s. Dong <aisheng.dong@nxp.com>; Markus Pargmann
> > > > <mpa@pengutronix.de>
> > > > Cc: Fabio Estevam <festevam@gmail.com>; Shawn Guo
> > > > <shawnguo@kernel.org>; Stefan Agner <stefan@agner.ch>;
> Pengutronix
> > > > Kernel Team <kernel@pengutronix.de>; Linus Walleij
> > > > <linus.walleij@linaro.org>; linux-gpio@vger.kernel.org; kernel-
> > > > janitors@vger.kernel.org
> > > > Subject: [PATCH] pinctrl: freescale: off by one in
> > > > imx1_pinconf_group_dbg_show()
> > > >
> > > > The info->groups[] array is allocated in imx1_pinctrl_parse_dt().
> > > > It has info-
> > > > >ngroups elements.  Thus the > here should be >= to prevent
> > > > >reading one
> > > > element beyond the end of the array.
> > > >
> > > > Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > >
> > > Acked-by: Dong Aisheng <Aisheng.dong@nxp.com>
> > >
> > > BTW It seems pinctrl-imx.c has the same issue although it won't
> > > trigger real error because the second check causes the return. But
> > > the fix still applies. So would you send anther fix for pinctrl-imx as well?
> 
> I don't know which function you are talking about.  I'm looking at
> drivers/pinctrl/freescale/pinctrl-imx.c but I haven't seen a bug.
> 

I mean the same issue you fixed in this patch.
See:
drivers/pinctrl/freescale/pinctrl-imx.c: imx_pinconf_group_dbg_show()

Shoud it be the same fix like below?
        if (group >= pctldev->num_groups)
                return;

Regards
Dong Aisheng

> regards,
> dan carpenter

