From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Thu, 20 Sep 2018 12:11:17 +0000
Subject: [PATCH] serial: imx: restore handshaking irq for imx1
Message-Id: <20180920121117.19041-1-u.kleine-koenig@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180920071957.xnwni4lqb5kgncfc@pengutronix.de>
In-Reply-To: <20180920071957.xnwni4lqb5kgncfc@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-serial@vger.kernel.org, kernel@pengutronix.de, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Leonard Crestez <leonard.crestez@nxp.com>, Andy Duan <fugang.duan@nxp.com>

Back in 2015 when irda was dropped from the driver imx1 was broken. This
change reintroduces the support for the third interrupt of the UART.

Fixes: afe9cbb1a6ad ("serial: imx: drop support for IRDA")
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 drivers/tty/serial/imx.c | 8 ++++++++
 1 file changed, 8 insertions(+)

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
--=20
2.18.0
