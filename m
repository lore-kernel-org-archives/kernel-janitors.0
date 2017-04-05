From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Apr 2017 12:35:44 +0000
Subject: [PATCH] qed: fix missing break in OOO_LB_TC case
Message-Id: <20170405123544.18648-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@cavium.com>, Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There seems to be a missing break on the OOO_LB_TC case, pq_id
is being assigned and then re-assigned on the fall through default
case and that seems suspect.

Detected by CoverityScan, CID#1424402 ("Missing break in switch")

Fixes: b5a9ee7cf3be1 ("qed: Revise QM cofiguration")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_ll2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_ll2.c b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
index 708c601e8ccf..13e65d446ab3 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_ll2.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
@@ -1132,6 +1132,7 @@ static int qed_sp_ll2_tx_queue_start(struct qed_hwfn *p_hwfn,
 		break;
 	case OOO_LB_TC:
 		pq_id = qed_get_cm_pq_idx(p_hwfn, PQ_FLAGS_OOO);
+		break;
 	default:
 		pq_id = qed_get_cm_pq_idx(p_hwfn, PQ_FLAGS_OFLD);
 		break;
-- 
2.11.0

