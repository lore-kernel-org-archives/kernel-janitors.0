From: Colin King <colin.king@canonical.com>
Date: Mon, 08 Oct 2018 14:17:03 +0000
Subject: [PATCH] qed: fix memory leak of pent on error exit paths
Message-Id: <20181008141703.21159-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently, calls to qed_sp_init_request can leak pent on -EINVAL errors.
Fix this by adding the allocated pent back to the p_hwfn free_pool
on these error exits so it can be re-used later and hence fixes the
leak.

Detected by CoverityScan, CID#1411643 ("Resource leak")

Fixes: fe56b9e6a8d9 ("qed: Add module with basic common support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 .../net/ethernet/qlogic/qed/qed_sp_commands.c    | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c b/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
index 77b6248ad3b9..810475a6522a 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
@@ -79,8 +79,10 @@ int qed_sp_init_request(struct qed_hwfn *p_hwfn,
 		break;
 
 	case QED_SPQ_MODE_BLOCK:
-		if (!p_data->p_comp_data)
-			return -EINVAL;
+		if (!p_data->p_comp_data) {
+			rc = -EINVAL;
+			goto err;
+		}
 
 		p_ent->comp_cb.cookie = p_data->p_comp_data->cookie;
 		break;
@@ -95,7 +97,8 @@ int qed_sp_init_request(struct qed_hwfn *p_hwfn,
 	default:
 		DP_NOTICE(p_hwfn, "Unknown SPQE completion mode %d\n",
 			  p_ent->comp_mode);
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err;
 	}
 
 	DP_VERBOSE(p_hwfn, QED_MSG_SPQ,
@@ -109,6 +112,13 @@ int qed_sp_init_request(struct qed_hwfn *p_hwfn,
 	memset(&p_ent->ramrod, 0, sizeof(p_ent->ramrod));
 
 	return 0;
+
+err:
+	qed_spq_return_entry(p_hwfn, *pp_ent);
+	*pp_ent = NULL;
+
+	return rc;
+
 }
 
 static enum tunnel_clss qed_tunn_clss_to_fw_clss(u8 type)
-- 
2.17.1
