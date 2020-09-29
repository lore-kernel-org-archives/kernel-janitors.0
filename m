From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:26 +0000
Subject: [PATCH 03/20] media: rtl28xxu: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-4-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antti Palosaari <crope@iki.fi>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
index 91460e4d0c30..3952cc534b4a 100644
--- a/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
+++ b/drivers/media/usb/dvb-usb-v2/rtl28xxu.c
@@ -955,7 +955,7 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			struct mn88472_config mn88472_config = {};
 
 			mn88472_config.fe = &adap->fe[1];
-			mn88472_config.i2c_wr_max = 22,
+			mn88472_config.i2c_wr_max = 22;
 			strscpy(info.type, "mn88472", I2C_NAME_SIZE);
 			mn88472_config.xtal = 20500000;
 			mn88472_config.ts_mode = SERIAL_TS_MODE;
@@ -980,7 +980,7 @@ static int rtl2832u_frontend_attach(struct dvb_usb_adapter *adap)
 			struct mn88473_config mn88473_config = {};
 
 			mn88473_config.fe = &adap->fe[1];
-			mn88473_config.i2c_wr_max = 22,
+			mn88473_config.i2c_wr_max = 22;
 			strscpy(info.type, "mn88473", I2C_NAME_SIZE);
 			info.addr = 0x18;
 			info.platform_data = &mn88473_config;
