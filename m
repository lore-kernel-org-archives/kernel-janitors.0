From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 19 May 2014 06:31:45 +0000
Subject: Re: [PATCH 1/2 v4] ARM: imx: fix error handling in ipu device registration
Message-Id: <20140519063145.GF16662@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400446261-27085-1-git-send-email-emilgoode@gmail.com>
 <1400446261-27085-2-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1400446261-27085-2-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Sun, May 18, 2014 at 10:50:59PM +0200, Emil Goode wrote:
> If we fail to allocate struct platform_device pdev we
> dereference it after the goto label err.
>=20
> This bug was found using coccinelle.
>=20
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Shawn, is it already to late for 3.15?

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
