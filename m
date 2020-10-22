From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2020 07:04:51 +0000
Subject: [PATCH] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
Message-Id: <20201022070451.GA2817669@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

These functions should return zero on success.  Non-zero returns are
treated as error.  On some paths, this doesn't matter but in
nvmem_cell_read() a non-zero return would be passed to ERR_PTR() and
lead to an Oops.

Fixes: d6c3029f32f7 ("rtc: pcf2127: add support for accessing internal static RAM")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rtc/rtc-pcf2127.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 07a5630ec841..4d9711d51f8f 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -243,10 +243,8 @@ static int pcf2127_nvmem_read(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
-			       val, bytes);
-
-	return ret ?: bytes;
+	return regmap_bulk_read(pcf2127->regmap, PCF2127_REG_RAM_RD_CMD,
+				val, bytes);
 }
 
 static int pcf2127_nvmem_write(void *priv, unsigned int offset,
@@ -261,10 +259,8 @@ static int pcf2127_nvmem_write(void *priv, unsigned int offset,
 	if (ret)
 		return ret;
 
-	ret = regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
-				val, bytes);
-
-	return ret ?: bytes;
+	return regmap_bulk_write(pcf2127->regmap, PCF2127_REG_RAM_WRT_CMD,
+				 val, bytes);
 }
 
 /* watchdog driver */
-- 
2.28.0
