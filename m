From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Apr 2016 09:40:55 +0000
Subject: [patch] mfd: wm8400-core: signedness bug in wm8400_reg_read()
Message-Id: <20160414094055.GC16891@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is harmless because the function is not called, but we're trying to
return negative error codes so the function needs to return an int
instead of a u16.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/include/linux/mfd/wm8400-private.h b/include/linux/mfd/wm8400-private.h
index 2de565b..53b2021 100644
--- a/include/linux/mfd/wm8400-private.h
+++ b/include/linux/mfd/wm8400-private.h
@@ -923,7 +923,7 @@ struct wm8400 {
 #define WM8400_LINE_CMP_VTHD_SHIFT                   0  /* LINE_CMP_VTHD - [3:0] */
 #define WM8400_LINE_CMP_VTHD_WIDTH                   4  /* LINE_CMP_VTHD - [3:0] */
 
-u16 wm8400_reg_read(struct wm8400 *wm8400, u8 reg);
+int wm8400_reg_read(struct wm8400 *wm8400, u8 reg);
 int wm8400_block_read(struct wm8400 *wm8400, u8 reg, int count, u16 *data);
 
 static inline int wm8400_set_bits(struct wm8400 *wm8400, u8 reg,
diff --git a/drivers/mfd/wm8400-core.c b/drivers/mfd/wm8400-core.c
index 3bd44a4..8fe2aa9 100644
--- a/drivers/mfd/wm8400-core.c
+++ b/drivers/mfd/wm8400-core.c
@@ -43,7 +43,7 @@ static bool wm8400_volatile(struct device *dev, unsigned int reg)
  *
  * @return  Read value
  */
-u16 wm8400_reg_read(struct wm8400 *wm8400, u8 reg)
+int wm8400_reg_read(struct wm8400 *wm8400, u8 reg)
 {
 	unsigned int val;
 	int ret;
