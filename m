From: Colin King <colin.king@canonical.com>
Date: Fri, 22 Nov 2019 23:38:39 +0000
Subject: [PATCH] qed: remove redundant assignments to rc
Message-Id: <20191122233839.110620-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is assigned with a value that is never read and
it is re-assigned a new value later on.  The assignment is redundant
and can be removed.  Clean up multiple occurrances of this pattern.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_sp_commands.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c b/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
index 7e0b795230b2..12fc5f3b5cb4 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_sp_commands.c
@@ -331,7 +331,7 @@ int qed_sp_pf_start(struct qed_hwfn *p_hwfn,
 	u8 sb_index = p_hwfn->p_eq->eq_sb_index;
 	struct qed_spq_entry *p_ent = NULL;
 	struct qed_sp_init_data init_data;
-	int rc = -EINVAL;
+	int rc;
 	u8 page_cnt, i;
 
 	/* update initial eq producer */
@@ -447,7 +447,7 @@ int qed_sp_pf_update(struct qed_hwfn *p_hwfn)
 {
 	struct qed_spq_entry *p_ent = NULL;
 	struct qed_sp_init_data init_data;
-	int rc = -EINVAL;
+	int rc;
 
 	/* Get SPQ entry */
 	memset(&init_data, 0, sizeof(init_data));
@@ -471,7 +471,7 @@ int qed_sp_pf_update_ufp(struct qed_hwfn *p_hwfn)
 {
 	struct qed_spq_entry *p_ent = NULL;
 	struct qed_sp_init_data init_data;
-	int rc = -EOPNOTSUPP;
+	int rc;
 
 	if (p_hwfn->ufp_info.pri_type = QED_UFP_PRI_UNKNOWN) {
 		DP_INFO(p_hwfn, "Invalid priority type %d\n",
@@ -509,7 +509,7 @@ int qed_sp_pf_update_tunn_cfg(struct qed_hwfn *p_hwfn,
 {
 	struct qed_spq_entry *p_ent = NULL;
 	struct qed_sp_init_data init_data;
-	int rc = -EINVAL;
+	int rc;
 
 	if (IS_VF(p_hwfn->cdev))
 		return qed_vf_pf_tunnel_param_update(p_hwfn, p_tunn);
@@ -546,7 +546,7 @@ int qed_sp_pf_stop(struct qed_hwfn *p_hwfn)
 {
 	struct qed_spq_entry *p_ent = NULL;
 	struct qed_sp_init_data init_data;
-	int rc = -EINVAL;
+	int rc;
 
 	/* Get SPQ entry */
 	memset(&init_data, 0, sizeof(init_data));
-- 
2.24.0
