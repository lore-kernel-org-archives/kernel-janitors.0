From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 14:17:01 +0000
Subject: [PATCH 1/2] mfd: smsc-ece1099: Delete an unnecessary variable initialisation in smsc_i2c_probe()
Message-Id: <568295DD.3090809@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5682957F.5000604@users.sourceforge.net>
In-Reply-To: <5682957F.5000604@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 29 Dec 2015 14:47:40 +0100

The variable "ret" will be set to an appropriate value a bit later.
Thus let us omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mfd/smsc-ece1099.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/smsc-ece1099.c b/drivers/mfd/smsc-ece1099.c
index a4c0df7..bcac488 100644
--- a/drivers/mfd/smsc-ece1099.c
+++ b/drivers/mfd/smsc-ece1099.c
@@ -36,7 +36,7 @@ static int smsc_i2c_probe(struct i2c_client *i2c,
 {
 	struct smsc *smsc;
 	int devid, rev, venid_l, venid_h;
-	int ret = 0;
+	int ret;
 
 	smsc = devm_kzalloc(&i2c->dev, sizeof(struct smsc),
 				GFP_KERNEL);
-- 
2.6.3

