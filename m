From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 01 Nov 2016 06:49:05 +0000
Subject: [PATCH] mfd: bcm590xx: Simplify a test
Message-Id: <20161101064905.11961-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'i2c_new_dummy()' does not return an error pointer, so the test can be
simplified to be more consistent.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mfd/bcm590xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
index 0d76d690176b..c572a35a9341 100644
--- a/drivers/mfd/bcm590xx.c
+++ b/drivers/mfd/bcm590xx.c
@@ -67,7 +67,7 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri,
 	/* Secondary I2C slave address is the base address with A(2) asserted */
 	bcm590xx->i2c_sec = i2c_new_dummy(i2c_pri->adapter,
 					  i2c_pri->addr | BIT(2));
-	if (IS_ERR_OR_NULL(bcm590xx->i2c_sec)) {
+	if (!bcm590xx->i2c_sec) {
 		dev_err(&i2c_pri->dev, "failed to add secondary I2C device\n");
 		return -ENODEV;
 	}
-- 
2.9.3

