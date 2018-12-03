From: Colin King <colin.king@canonical.com>
Date: Mon, 03 Dec 2018 17:13:31 +0000
Subject: [PATCH][next] qed: fix spelling mistake "Dispalying" -> "Displaying"
Message-Id: <20181203171331.29869-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a DP_NOTICE message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index a817b6632eb2..8f6551421945 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -285,7 +285,7 @@ void qed_db_recovery_dp(struct qed_hwfn *p_hwfn)
 	struct qed_db_recovery_entry *db_entry = NULL;
 
 	DP_NOTICE(p_hwfn,
-		  "Dispalying doorbell recovery database. Counter was %d\n",
+		  "Displaying doorbell recovery database. Counter was %d\n",
 		  p_hwfn->db_recovery_info.db_recovery_counter);
 
 	/* Protect the list */
-- 
2.19.1
