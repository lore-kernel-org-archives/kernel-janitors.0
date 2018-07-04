From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 12:06:26 +0000
Subject: [PATCH] qed: remove redundant pointer 'name'
Message-Id: <20180704120626.8701-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, everest-linux-l2@cavium.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'name' is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'name' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_dcbx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dcbx.c b/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
index e0680ce91328..12b4c2ab5796 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
@@ -221,7 +221,6 @@ qed_dcbx_update_app_info(struct qed_dcbx_results *p_data,
 	struct qed_hw_info *p_info = &p_hwfn->hw_info;
 	enum qed_pci_personality personality;
 	enum dcbx_protocol_type id;
-	char *name;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(qed_dcbx_app_update); i++) {
@@ -231,7 +230,6 @@ qed_dcbx_update_app_info(struct qed_dcbx_results *p_data,
 			continue;
 
 		personality = qed_dcbx_app_update[i].personality;
-		name = qed_dcbx_app_update[i].name;
 
 		qed_dcbx_set_params(p_data, p_info, enable,
 				    prio, tc, type, personality);
-- 
2.17.1

