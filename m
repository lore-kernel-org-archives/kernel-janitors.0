From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Fri, 13 Jul 2018 18:13:25 +0000
Subject: Re: [PATCH] pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
Message-Id: <20180713181325.5xg4oof5g6hep24h@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
In-Reply-To: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Fri, Jul 13, 2018 at 05:55:15PM +0300, Dan Carpenter wrote:
> The info->groups[] array is allocated in imx1_pinctrl_parse_dt().  It
> has info->ngroups elements.  Thus the > here should be >=3D to prevent
> reading one element beyond the end of the array.
>=20
> Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-k=F6nig@pengutronix.de>

I suggest to backport this to stable.

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
