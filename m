From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Sep 2018 15:51:41 +0000
Subject: [PATCH] qed: fix spelling mistake "toogle" -> "toggle"
Message-Id: <20180924155141.25125-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_VERBOSE message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_rdma.c b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
index be941cfaa2d4..c71391b9c757 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_rdma.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
@@ -228,7 +228,7 @@ static int qed_rdma_alloc(struct qed_hwfn *p_hwfn,
 				 num_cons, "Toggle");
 	if (rc) {
 		DP_VERBOSE(p_hwfn, QED_MSG_RDMA,
-			   "Failed to allocate toogle bits, rc = %d\n", rc);
+			   "Failed to allocate toggle bits, rc = %d\n", rc);
 		goto free_cq_map;
 	}
 
-- 
2.17.1
