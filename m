From: Colin King <colin.king@canonical.com>
Date: Thu, 03 May 2018 15:19:32 +0000
Subject: [PATCH] qed: fix spelling mistake: "offloded" -> "offloaded"
Message-Id: <20180503151932.22458-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in DP_NOTICE message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_roce.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_roce.c b/drivers/net/ethernet/qlogic/qed/qed_roce.c
index fb7c2d1562ae..6acfd43c1a4f 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_roce.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_roce.c
@@ -848,7 +848,7 @@ int qed_roce_query_qp(struct qed_hwfn *p_hwfn,
 
 	if (!(qp->resp_offloaded)) {
 		DP_NOTICE(p_hwfn,
-			  "The responder's qp should be offloded before requester's\n");
+			  "The responder's qp should be offloaded before requester's\n");
 		return -EINVAL;
 	}
 
-- 
2.17.0

