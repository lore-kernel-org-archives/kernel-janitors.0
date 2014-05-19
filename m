From: Shawn Guo <shawn.guo@freescale.com>
Date: Mon, 19 May 2014 06:47:02 +0000
Subject: Re: [PATCH 1/2 v4] ARM: imx: fix error handling in ipu device registration
Message-Id: <20140519064701.GK10685@dragon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400446261-27085-1-git-send-email-emilgoode@gmail.com>
 <1400446261-27085-2-git-send-email-emilgoode@gmail.com>
 <20140519063145.GF16662@pengutronix.de>
In-Reply-To: <20140519063145.GF16662@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Mon, May 19, 2014 at 08:31:45AM +0200, Uwe Kleine-K=F6nig wrote:
> On Sun, May 18, 2014 at 10:50:59PM +0200, Emil Goode wrote:
> > If we fail to allocate struct platform_device pdev we
> > dereference it after the goto label err.
> >=20
> > This bug was found using coccinelle.
> >=20
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Shawn, is it already to late for 3.15?

Let me try to see.

Shawn
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
