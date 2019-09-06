From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 13:06:32 +0000
Subject: [PATCH] regulator: lp8788-ldo: make array en_mask static const, makes object smaller
Message-Id: <20190906130632.6709-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Milo Kim <milo.kim@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array en_mask on the stack but instead make it
static const. Makes the object code smaller by 87 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  12967	   3408	      0	  16375	   3ff7	drivers/regulator/lp8788-ldo.o

After:
   text	   data	    bss	    dec	    hex	filename
  12816	   3472	      0	  16288	   3fa0	drivers/regulator/lp8788-ldo.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/regulator/lp8788-ldo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/lp8788-ldo.c b/drivers/regulator/lp8788-ldo.c
index 1b00f3638996..00e9bb92c326 100644
--- a/drivers/regulator/lp8788-ldo.c
+++ b/drivers/regulator/lp8788-ldo.c
@@ -464,7 +464,7 @@ static int lp8788_config_ldo_enable_mode(struct platform_device *pdev,
 {
 	struct lp8788 *lp = ldo->lp;
 	enum lp8788_ext_ldo_en_id enable_id;
-	u8 en_mask[] = {
+	static const u8 en_mask[] = {
 		[EN_ALDO1]   = LP8788_EN_SEL_ALDO1_M,
 		[EN_ALDO234] = LP8788_EN_SEL_ALDO234_M,
 		[EN_ALDO5]   = LP8788_EN_SEL_ALDO5_M,
-- 
2.20.1
