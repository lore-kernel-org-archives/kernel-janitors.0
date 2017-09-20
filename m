From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Sep 2017 21:45:30 +0000
Subject: [PATCH] rtc: rv3029: Clean up error handling in rv3029_eeprom_write()
Message-Id: <20170920214530.jusyjbnvkopsumrr@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't need both "ret" and "err" when they do the same thing.  All the
functions called here return zero on success or negative error codes.
It's more clear to return a literal zero at the end instead of
"return ret;"

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rtc/rtc-rv3029c2.c b/drivers/rtc/rtc-rv3029c2.c
index aa09771de04f..f4f957ab5fe6 100644
--- a/drivers/rtc/rtc-rv3029c2.c
+++ b/drivers/rtc/rtc-rv3029c2.c
@@ -282,13 +282,13 @@ static int rv3029_eeprom_read(struct device *dev, u8 reg,
 static int rv3029_eeprom_write(struct device *dev, u8 reg,
 			       u8 const buf[], size_t len)
 {
-	int ret, err;
+	int ret;
 	size_t i;
 	u8 tmp;
 
-	err = rv3029_eeprom_enter(dev);
-	if (err < 0)
-		return err;
+	ret = rv3029_eeprom_enter(dev);
+	if (ret < 0)
+		return ret;
 
 	for (i = 0; i < len; i++, reg++) {
 		ret = rv3029_read_regs(dev, reg, &tmp, 1);
@@ -304,11 +304,11 @@ static int rv3029_eeprom_write(struct device *dev, u8 reg,
 			break;
 	}
 
-	err = rv3029_eeprom_exit(dev);
-	if (err < 0)
-		return err;
+	ret = rv3029_eeprom_exit(dev);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static int rv3029_eeprom_update_bits(struct device *dev,
