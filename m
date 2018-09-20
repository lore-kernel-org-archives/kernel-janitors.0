From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Thu, 20 Sep 2018 07:19:57 +0000
Subject: Re: [PATCH -next] serial: imx: remove set but not used variable 'rtsirq'
Message-Id: <20180920071957.xnwni4lqb5kgncfc@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537408725-196364-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537408725-196364-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 20, 2018 at 01:58:45AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>=20
> drivers/tty/serial/imx.c: In function 'imx_uart_probe':
> drivers/tty/serial/imx.c:2198:20: warning:
>  variable 'rtsirq' set but not used [-Wunused-but-set-variable]
>=20
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Wow, this variable is write-only since=20

	afe9cbb1a6ad ("serial: imx: drop support for IRDA")

which is over three years old. The last hunk of this patch is wrong
however, which means that nobody uses handshaking on imx1 with a kernel
newer than 4.1-rc1. (Well, or they fixed it and didn't made the effort
to tell.)

I suggest to break rx and tx on imx1, too, and if nobody reports a
regression within the next three years, we rip out imx1 support
completely. :-)

Otherwise we need:

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 4e853570ea80..554a69db1bca 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2350,6 +2350,14 @@ static int imx_uart_probe(struct platform_device *pd=
ev)
 				ret);
 			return ret;
 		}
+
+		ret =3D devm_request_irq(&pdev->dev, rtsirq, imx_uart_rtsint, 0,
+				       dev_name(&pdev->dev), sport);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to request rts irq: %d\n",
+				ret);
+			return ret;
+		}
 	} else {
 		ret =3D devm_request_irq(&pdev->dev, rxirq, imx_uart_int, 0,
 				       dev_name(&pdev->dev), sport);

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
