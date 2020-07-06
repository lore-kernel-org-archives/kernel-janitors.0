From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Jul 2020 12:12:40 +0000
Subject: [PATCH][next] bnx2x: fix spelling mistake "occurd" -> "occurred"
Message-Id: <20200706121240.486132-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in various literal strings. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_self_test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_self_test.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_self_test.c
index 48f63ef2e6ea..3f8bdad3351c 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_self_test.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_self_test.c
@@ -2218,31 +2218,31 @@ static struct st_record st_database[ST_DB_LINES] = {
 /*line 352*/{(0x1E), 1, MISC_REG_AEU_SYS_KILL_OCCURRED,
 	NA, NA, NA, pneq,
 	NA, IDLE_CHK_ERROR,
-	"MISC: system kill occurd;",
+	"MISC: system kill occurred;",
 	{NA, NA, 0, NA, NA, NA} },
 
 /*line 353*/{(0x1E), 1, MISC_REG_AEU_SYS_KILL_STATUS_0,
 	NA, NA, NA, pneq,
 	NA, IDLE_CHK_ERROR,
-	"MISC: system kill occurd; status_0 register",
+	"MISC: system kill occurred; status_0 register",
 	{NA, NA, 0, NA, NA, NA} },
 
 /*line 354*/{(0x1E), 1, MISC_REG_AEU_SYS_KILL_STATUS_1,
 	NA, NA, NA, pneq,
 	NA, IDLE_CHK_ERROR,
-	"MISC: system kill occurd; status_1 register",
+	"MISC: system kill occurred; status_1 register",
 	{NA, NA, 0, NA, NA, NA} },
 
 /*line 355*/{(0x1E), 1, MISC_REG_AEU_SYS_KILL_STATUS_2,
 	NA, NA, NA, pneq,
 	NA, IDLE_CHK_ERROR,
-	"MISC: system kill occurd; status_2 register",
+	"MISC: system kill occurred; status_2 register",
 	{NA, NA, 0, NA, NA, NA} },
 
 /*line 356*/{(0x1E), 1, MISC_REG_AEU_SYS_KILL_STATUS_3,
 	NA, NA, NA, pneq,
 	NA, IDLE_CHK_ERROR,
-	"MISC: system kill occurd; status_3 register",
+	"MISC: system kill occurred; status_3 register",
 	{NA, NA, 0, NA, NA, NA} },
 
 /*line 357*/{(0x1E), 1, MISC_REG_PCIE_HOT_RESET,
-- 
2.27.0
