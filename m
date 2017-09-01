From: Colin King <colin.king@canonical.com>
Date: Fri, 01 Sep 2017 16:00:06 +0000
Subject: [PATCH] phy: xgene: make array serdes_reg static const
Message-Id: <20170901160006.25136-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array serdes_reg on the stack, instead make it
static const. Makes the object code smaller by 150 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  21890	   6432	     64	  28386	   6ee2	drivers/phy/phy-xgene.o

After:
   text	   data	    bss	    dec	    hex	filename
  21644	   6528	     64	  28236	   6e4c	drivers/phy/phy-xgene.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/phy-xgene.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-xgene.c b/drivers/phy/phy-xgene.c
index ae266e0c8368..06a53abfec61 100644
--- a/drivers/phy/phy-xgene.c
+++ b/drivers/phy/phy-xgene.c
@@ -1354,7 +1354,7 @@ static int xgene_phy_hw_initialize(struct xgene_phy_ctx *ctx,
 static void xgene_phy_force_lat_summer_cal(struct xgene_phy_ctx *ctx, int lane)
 {
 	int i;
-	struct {
+	static const struct {
 		u32 reg;
 		u32 val;
 	} serdes_reg[] = {
-- 
2.14.1

