From: Colin King <colin.king@canonical.com>
Date: Fri, 06 Sep 2019 12:49:44 +0000
Subject: [PATCH] phy: xgene: make array serdes_reg static const, makes object smaller
Message-Id: <20190906124944.1574-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array serdes_reg on the stack but instead make it
static const. Makes the object code smaller by 228 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  23875	   6232	     64	  30171	   75db	drivers/phy/phy-xgene.o

After:
   text	   data	    bss	    dec	    hex	filename
  23551	   6328	     64	  29943	   74f7	drivers/phy/phy-xgene.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/phy-xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-xgene.c b/drivers/phy/phy-xgene.c
index 3c9189473407..7a33ec12f71b 100644
--- a/drivers/phy/phy-xgene.c
+++ b/drivers/phy/phy-xgene.c
@@ -1342,7 +1342,7 @@ static int xgene_phy_hw_initialize(struct xgene_phy_ctx *ctx,
 static void xgene_phy_force_lat_summer_cal(struct xgene_phy_ctx *ctx, int lane)
 {
 	int i;
-	struct {
+	static const struct {
 		u32 reg;
 		u32 val;
 	} serdes_reg[] = {
-- 
2.20.1
