From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Oct 2018 21:47:10 +0000
Subject: [PATCH] qed: fix spelling mistake "transcevier" -> "transceiver"
Message-Id: <20181018214710.10260-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_INFO message.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_mcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_mcp.c b/drivers/net/ethernet/qlogic/qed/qed_mcp.c
index 554d57ac1629..386ee5410237 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_mcp.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_mcp.c
@@ -2035,7 +2035,7 @@ int qed_mcp_trans_speed_mask(struct qed_hwfn *p_hwfn,
 		    NVM_CFG1_PORT_DRV_SPEED_CAPABILITY_MASK_1G;
 		break;
 	default:
-		DP_INFO(p_hwfn, "Unknown transcevier type 0x%x\n",
+		DP_INFO(p_hwfn, "Unknown transceiver type 0x%x\n",
 			transceiver_type);
 		*p_speed_mask = 0xff;
 		break;
-- 
2.19.1
