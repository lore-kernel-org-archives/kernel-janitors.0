From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:41 +0000
Subject: [PATCH 18/20] media: rtl2832: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-19-git-send-email-Julia.Lawall@inria.fr>
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
 drivers/media/dvb-frontends/rtl2832.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index e5bffaaeed38..01dcc7f1b9b2 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -1056,13 +1056,13 @@ static int rtl2832_probe(struct i2c_client *client,
 	dev->sleeping = true;
 	INIT_DELAYED_WORK(&dev->i2c_gate_work, rtl2832_i2c_gate_work);
 	/* create regmap */
-	dev->regmap_config.reg_bits =  8,
-	dev->regmap_config.val_bits =  8,
-	dev->regmap_config.volatile_reg = rtl2832_volatile_reg,
-	dev->regmap_config.max_register = 5 * 0x100,
-	dev->regmap_config.ranges = regmap_range_cfg,
-	dev->regmap_config.num_ranges = ARRAY_SIZE(regmap_range_cfg),
-	dev->regmap_config.cache_type = REGCACHE_NONE,
+	dev->regmap_config.reg_bits =  8;
+	dev->regmap_config.val_bits =  8;
+	dev->regmap_config.volatile_reg = rtl2832_volatile_reg;
+	dev->regmap_config.max_register = 5 * 0x100;
+	dev->regmap_config.ranges = regmap_range_cfg;
+	dev->regmap_config.num_ranges = ARRAY_SIZE(regmap_range_cfg);
+	dev->regmap_config.cache_type = REGCACHE_NONE;
 	dev->regmap = regmap_init_i2c(client, &dev->regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
