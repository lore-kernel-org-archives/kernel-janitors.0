From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 13:29:11 +0000
Subject: [patch -next] qlogic: qed: fix a test for MODE_MF_SI
Message-Id: <20151104132911.GE20966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@qlogic.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

MODE_MF_SI is 9.  We should be testing bit 9 instead of AND 0x9.

Fixes: fe56b9e6a8d9 ('qed: Add module with basic common support')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qed/qed_dev.c b/drivers/net/ethernet/qlogic/qed/qed_dev.c
index b9b7b7e..774b223 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_dev.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_dev.c
@@ -562,7 +562,7 @@ static int qed_hw_init_pf(struct qed_hwfn *p_hwfn,
 	}
 
 	/* Enable classification by MAC if needed */
-	if (hw_mode & MODE_MF_SI) {
+	if (hw_mode & (1 << MODE_MF_SI)) {
 		DP_VERBOSE(p_hwfn, NETIF_MSG_HW,
 			   "Configuring TAGMAC_CLS_TYPE\n");
 		STORE_RT_REG(p_hwfn,
