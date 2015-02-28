From: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 28 Feb 2015 10:02:28 +0000
Subject: [PATCH 5/7] mtd: nand: denali: drop dead code
Message-Id: <1425117750-22298-6-git-send-email-computersforpeace@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425117750-22298-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

TclsRising is always 1.

Caught by Coverity.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 drivers/mtd/nand/denali.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index f44c6061536a..09f51395f2c0 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -225,7 +225,6 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	uint16_t Twhr[6] = {120, 80, 80, 60, 60, 60};
 	uint16_t Tcs[6] = {70, 35, 25, 25, 20, 15};
 
-	uint16_t TclsRising = 1;
 	uint16_t data_invalid_rhoh, data_invalid_rloh, data_invalid;
 	uint16_t dv_window = 0;
 	uint16_t en_lo, en_hi;
@@ -276,8 +275,6 @@ static void nand_onfi_timing_set(struct denali_nand_info *denali,
 	re_2_re = CEIL_DIV(Trhz[mode], CLK_X);
 	we_2_re = CEIL_DIV(Twhr[mode], CLK_X);
 	cs_cnt = CEIL_DIV((Tcs[mode] - Trp[mode]), CLK_X);
-	if (!TclsRising)
-		cs_cnt = CEIL_DIV(Tcs[mode], CLK_X);
 	if (cs_cnt = 0)
 		cs_cnt = 1;
 
-- 
2.1.0

