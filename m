From: Colin King <colin.king@canonical.com>
Date: Mon, 19 Mar 2018 14:32:59 +0000
Subject: [PATCH] bnx2x: fix spelling mistake: "registeration" -> "registration"
Message-Id: <20180319143259.5796-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <ariel.elior@cavium.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in BNX2X_ERR error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
index 74fc9af4aadb..b8388e93520a 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_main.c
@@ -13913,7 +13913,7 @@ static void bnx2x_register_phc(struct bnx2x *bp)
 	bp->ptp_clock = ptp_clock_register(&bp->ptp_clock_info, &bp->pdev->dev);
 	if (IS_ERR(bp->ptp_clock)) {
 		bp->ptp_clock = NULL;
-		BNX2X_ERR("PTP clock registeration failed\n");
+		BNX2X_ERR("PTP clock registration failed\n");
 	}
 }
 
-- 
2.15.1

