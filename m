From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 08:19:32 +0000
Subject: [PATCH 2/2] mfd: smsc-ece1099: Improve a size determination in smsc_i2c_probe()
Message-Id: <721383c6-7d82-7911-989d-fb230038a52b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <978023d9-01f2-3a16-5eba-e06b8359cfc0@users.sourceforge.net>
In-Reply-To: <978023d9-01f2-3a16-5eba-e06b8359cfc0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 16 Jan 2018 08:58:26 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/smsc-ece1099.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
index b9d96651cc0d..6681205dd2c0 100644
--- a/drivers/mfd/smsc-ece1099.c
+++ b/drivers/mfd/smsc-ece1099.c
@@ -33,12 +33,10 @@ static const struct regmap_config smsc_regmap_config = {
 static int smsc_i2c_probe(struct i2c_client *i2c,
 			const struct i2c_device_id *id)
 {
-	struct smsc *smsc;
 	int devid, rev, venid_l, venid_h;
 	int ret;
+	struct smsc *smsc = devm_kzalloc(&i2c->dev, sizeof(*smsc), GFP_KERNEL);
 
-	smsc = devm_kzalloc(&i2c->dev, sizeof(struct smsc),
-				GFP_KERNEL);
 	if (!smsc)
 		return -ENOMEM;
 
-- 
2.15.1

