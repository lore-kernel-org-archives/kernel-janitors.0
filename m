From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 May 2016 10:19:35 +0000
Subject: [patch] qed: signedness bug in qed_dcbx_process_tlv()
Message-Id: <20160523101935.GA10712@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@qlogic.com>, Sudarsana Reddy Kalluru <sudarsana.kalluru@qlogic.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"priority" needs to be signed for the error handling to work.

Fixes: 39651abd2814 ('qed: add support for dcbx.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to the main net tree.

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dcbx.c b/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
index cbf58e1..a06d19a 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dcbx.c
@@ -192,9 +192,10 @@ qed_dcbx_process_tlv(struct qed_hwfn *p_hwfn,
 		     struct dcbx_app_priority_entry *p_tbl,
 		     u32 pri_tc_tbl, int count, bool dcbx_enabled)
 {
-	u8 tc, priority, priority_map;
+	u8 tc, priority_map;
 	enum dcbx_protocol_type type;
 	u16 protocol_id;
+	int priority;
 	bool enable;
 	int i;
 
