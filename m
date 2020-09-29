From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:39 +0000
Subject: [PATCH 16/20] media: dvbsky: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-17-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/media/usb/dvb-usb-v2/dvbsky.c |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/dvbsky.c b/drivers/media/usb/dvb-usb-v2/dvbsky.c
index 0d9657f7f29d..689829f1b52a 100644
--- a/drivers/media/usb/dvb-usb-v2/dvbsky.c
+++ b/drivers/media/usb/dvb-usb-v2/dvbsky.c
@@ -287,8 +287,8 @@ static int dvbsky_s960_attach(struct dvb_usb_adapter *adap)
 	m88ds3103_pdata.ts_clk = 16000;
 	m88ds3103_pdata.ts_clk_pol = 0;
 	m88ds3103_pdata.agc = 0x99;
-	m88ds3103_pdata.lnb_hv_pol = 1,
-	m88ds3103_pdata.lnb_en_pol = 1,
+	m88ds3103_pdata.lnb_hv_pol = 1;
+	m88ds3103_pdata.lnb_en_pol = 1;
 
 	state->i2c_client_demod = dvb_module_probe("m88ds3103", NULL,
 						   &d->i2c_adap,
@@ -383,15 +383,15 @@ static int dvbsky_s960c_attach(struct dvb_usb_adapter *adap)
 	struct sp2_config sp2_config = {};
 
 	/* attach demod */
-	m88ds3103_pdata.clk = 27000000,
-	m88ds3103_pdata.i2c_wr_max = 33,
-	m88ds3103_pdata.clk_out = 0,
-	m88ds3103_pdata.ts_mode = M88DS3103_TS_CI,
-	m88ds3103_pdata.ts_clk = 10000,
-	m88ds3103_pdata.ts_clk_pol = 1,
-	m88ds3103_pdata.agc = 0x99,
-	m88ds3103_pdata.lnb_hv_pol = 0,
-	m88ds3103_pdata.lnb_en_pol = 1,
+	m88ds3103_pdata.clk = 27000000;
+	m88ds3103_pdata.i2c_wr_max = 33;
+	m88ds3103_pdata.clk_out = 0;
+	m88ds3103_pdata.ts_mode = M88DS3103_TS_CI;
+	m88ds3103_pdata.ts_clk = 10000;
+	m88ds3103_pdata.ts_clk_pol = 1;
+	m88ds3103_pdata.agc = 0x99;
+	m88ds3103_pdata.lnb_hv_pol = 0;
+	m88ds3103_pdata.lnb_en_pol = 1;
 
 	state->i2c_client_demod = dvb_module_probe("m88ds3103", NULL,
 						   &d->i2c_adap,
