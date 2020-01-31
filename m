From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Jan 2020 05:03:26 +0000
Subject: [PATCH net] qed: Fix a error code in qed_hw_init()
Message-Id: <20200131050326.n3axoo7axxvzcrv3@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <ariel.elior@marvell.com>, Michal Kalderon <michal.kalderon@marvell.com>
Cc: GR-everest-linux-l2@marvell.com, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

If the qed_fw_overlay_mem_alloc() then we should return -ENOMEM instead
of success.

Fixes: 30d5f85895fa ("qed: FW 8.42.2.0 Add fw overlay feature")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index 7912911337d4..03bdd2e26329 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -3114,6 +3114,7 @@ int qed_hw_init(struct qed_dev *cdev, struct qed_hw_init_params *p_params)
 		if (!p_hwfn->fw_overlay_mem) {
 			DP_NOTICE(p_hwfn,
 				  "Failed to allocate fw overlay memory\n");
+			rc = -ENOMEM;
 			goto load_err;
 		}
 
-- 
2.11.0
