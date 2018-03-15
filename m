From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Mar 2018 14:05:20 +0000
Subject: [PATCH] cxgb4/cudbg_lib: Use common error handling code in cudbg_collect_tid()
Message-Id: <caaea20d-7f22-a315-4fa0-9370a9743a2f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Ganesh Goudar <ganeshgr@chelsio.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Rahul Lakkireddy <rahul.lakkireddy@chelsio.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 15 Mar 2018 14:56:10 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c b/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c
index 9da6f57901a9..d5b5b6221d1f 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.c
@@ -1660,11 +1660,9 @@ int cudbg_collect_tid(struct cudbg_init *pdbg_init,
 	para[0] = FW_PARAM_PFVF_A(ETHOFLD_START);
 	para[1] = FW_PARAM_PFVF_A(ETHOFLD_END);
 	rc = t4_query_params(padap, padap->mbox, padap->pf, 0, 2, para, val);
-	if (rc <  0) {
-		cudbg_err->sys_err = rc;
-		cudbg_put_buff(pdbg_init, &temp_buff);
-		return rc;
-	}
+	if (rc < 0)
+		goto put_buffer;
+
 	tid->uotid_base = val[0];
 	tid->nuotids = val[1] - val[0] + 1;
 
@@ -1679,11 +1677,9 @@ int cudbg_collect_tid(struct cudbg_init *pdbg_init,
 		para[1] = FW_PARAM_PFVF_A(HPFILTER_END);
 		rc = t4_query_params(padap, padap->mbox, padap->pf, 0, 2,
 				     para, val);
-		if (rc < 0) {
-			cudbg_err->sys_err = rc;
-			cudbg_put_buff(pdbg_init, &temp_buff);
-			return rc;
-		}
+		if (rc < 0)
+			goto put_buffer;
+
 		tid->hpftid_base = val[0];
 		tid->nhpftids = val[1] - val[0] + 1;
 	}
@@ -1711,6 +1707,11 @@ int cudbg_collect_tid(struct cudbg_init *pdbg_init,
 	tid->ipv6_users = t4_read_reg(padap, LE_DB_ACT_CNT_IPV6_A);
 
 	return cudbg_write_and_release_buff(pdbg_init, &temp_buff, dbg_buff);
+
+put_buffer:
+	cudbg_put_buff(pdbg_init, &temp_buff);
+	cudbg_err->sys_err = rc;
+	return rc;
 }
 
 int cudbg_collect_pcie_config(struct cudbg_init *pdbg_init,
-- 
2.16.2

