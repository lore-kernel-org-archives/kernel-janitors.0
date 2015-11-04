From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Nov 2015 13:27:16 +0000
Subject: [patch -next] qlogic/qed: remove bogus NULL check
Message-Id: <20151104132716.GD20966@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yuval Mintz <Yuval.Mintz@qlogic.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We check if "p_hwfn" is NULL and then dereference it in the error
handling code.  I read the code and it isn't NULL so let's remove the
check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qed/qed_int.c b/drivers/net/ethernet/qlogic/qed/qed_int.c
index 2e399b6..de50e84 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_int.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_int.c
@@ -251,11 +251,6 @@ void qed_int_sp_dpc(unsigned long hwfn_cookie)
 	int arr_size;
 	u16 rc = 0;
 
-	if (!p_hwfn) {
-		DP_ERR(p_hwfn->cdev, "DPC called - no hwfn!\n");
-		return;
-	}
-
 	if (!p_hwfn->p_sp_sb) {
 		DP_ERR(p_hwfn->cdev, "DPC called - no p_sp_sb\n");
 		return;
