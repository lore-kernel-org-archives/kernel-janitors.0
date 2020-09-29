From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:34 +0000
Subject: [PATCH 11/20] media: ts2020: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-12-git-send-email-Julia.Lawall@inria.fr>
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
 drivers/media/dvb-frontends/ts2020.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
index 234607b02edb..3e383912bcfd 100644
--- a/drivers/media/dvb-frontends/ts2020.c
+++ b/drivers/media/dvb-frontends/ts2020.c
@@ -569,11 +569,11 @@ static int ts2020_probe(struct i2c_client *client,
 
 	/* create regmap */
 	mutex_init(&dev->regmap_mutex);
-	dev->regmap_config.reg_bits = 8,
-	dev->regmap_config.val_bits = 8,
-	dev->regmap_config.lock = ts2020_regmap_lock,
-	dev->regmap_config.unlock = ts2020_regmap_unlock,
-	dev->regmap_config.lock_arg = dev,
+	dev->regmap_config.reg_bits = 8;
+	dev->regmap_config.val_bits = 8;
+	dev->regmap_config.lock = ts2020_regmap_lock;
+	dev->regmap_config.unlock = ts2020_regmap_unlock;
+	dev->regmap_config.lock_arg = dev;
 	dev->regmap = regmap_init_i2c(client, &dev->regmap_config);
 	if (IS_ERR(dev->regmap)) {
 		ret = PTR_ERR(dev->regmap);
