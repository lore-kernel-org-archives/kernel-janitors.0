From: Colin King <colin.king@canonical.com>
Date: Wed, 30 Oct 2019 07:59:22 +0000
Subject: [PATCH] qed: fix spelling mistake "queuess" -> "queues"
Message-Id: <20191030075922.11047-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling misake in a DP_NOTICE message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_sriov.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_sriov.c b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
index 78f77b712b10..dcb5c917f373 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_sriov.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_sriov.c
@@ -2005,7 +2005,7 @@ static void qed_iov_vf_mbx_stop_vport(struct qed_hwfn *p_hwfn,
 	    (qed_iov_validate_active_txq(p_hwfn, vf))) {
 		vf->b_malicious = true;
 		DP_NOTICE(p_hwfn,
-			  "VF [%02x] - considered malicious; Unable to stop RX/TX queuess\n",
+			  "VF [%02x] - considered malicious; Unable to stop RX/TX queues\n",
 			  vf->abs_vf_id);
 		status = PFVF_STATUS_MALICIOUS;
 		goto out;
-- 
2.20.1
