From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Apr 2016 14:44:18 +0000
Subject: [patch v2] mfd: wm8400-core: delete wm8400_reg_read()
Message-Id: <20160415144418.GA8953@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160414100135.GS31814@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

There was a static checker warning in wm8400_reg_read() because we were
returning u16 and that can't hold the negative error codes.  The
function isn't used, so let's just delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: just delete the function

diff --git a/include/linux/mfd/wm8400-private.h b/include/linux/mfd/wm8400-private.h
index 2de565b..4ee908f 100644
--- a/include/linux/mfd/wm8400-private.h
+++ b/include/linux/mfd/wm8400-private.h
@@ -923,7 +923,6 @@ struct wm8400 {
 #define WM8400_LINE_CMP_VTHD_SHIFT                   0  /* LINE_CMP_VTHD - [3:0] */
 #define WM8400_LINE_CMP_VTHD_WIDTH                   4  /* LINE_CMP_VTHD - [3:0] */
 
-u16 wm8400_reg_read(struct wm8400 *wm8400, u8 reg);
 int wm8400_block_read(struct wm8400 *wm8400, u8 reg, int count, u16 *data);
 
 static inline int wm8400_set_bits(struct wm8400 *wm8400, u8 reg,
diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
index 3bd44a4..c1adfc1 100644
--- a/drivers/mfd/wm8400-core.c
+++ b/drivers/mfd/wm8400-core.c
@@ -35,27 +35,6 @@ static bool wm8400_volatile(struct device *dev, unsigned int reg)
 	}
 }
 
-/**
- * wm8400_reg_read - Single register read
- *
- * @wm8400: Pointer to wm8400 control structure
- * @reg:    Register to read
- *
- * @return  Read value
- */
-u16 wm8400_reg_read(struct wm8400 *wm8400, u8 reg)
-{
-	unsigned int val;
-	int ret;
-
-	ret = regmap_read(wm8400->regmap, reg, &val);
-	if (ret < 0)
-		return ret;
-
-	return val;
-}
-EXPORT_SYMBOL_GPL(wm8400_reg_read);
-
 int wm8400_block_read(struct wm8400 *wm8400, u8 reg, int count, u16 *data)
 {
 	return regmap_bulk_read(wm8400->regmap, reg, data, count);
