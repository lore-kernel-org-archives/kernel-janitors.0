From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Aug 2018 11:18:30 +0000
Subject: [PATCH] qed: fix spelling mistake "comparsion" -> "comparison"
Message-Id: <20180824111830.8657-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_ERR error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_init_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_init_ops.c b/drivers/net/ethernet/qlogic/qed/qed_init_ops.c
index d9ab5add27a8..34193c2f1699 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_init_ops.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_init_ops.c
@@ -407,7 +407,7 @@ static void qed_init_cmd_rd(struct qed_hwfn *p_hwfn,
 
 	if (i = QED_INIT_MAX_POLL_COUNT) {
 		DP_ERR(p_hwfn,
-		       "Timeout when polling reg: 0x%08x [ Waiting-for: %08x Got: %08x (comparsion %08x)]\n",
+		       "Timeout when polling reg: 0x%08x [ Waiting-for: %08x Got: %08x (comparison %08x)]\n",
 		       addr, le32_to_cpu(cmd->expected_val),
 		       val, le32_to_cpu(cmd->op_data));
 	}
-- 
2.17.1
