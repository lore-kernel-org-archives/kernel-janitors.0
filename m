From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 10:52:36 +0000
Subject: [patch -mainline] qlge: fix a timeout loop in ql_change_rx_buffers()
Message-Id: <20151215105236.GH20848@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harish Patil <harish.patil@qlogic.com>
Cc: Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, Dept-GELinuxNICDev@qlogic.com, linux-driver@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem here is that after the loop we test for "if (!i) " but
because "i--" is a post-op we exit with i set to -1.  I have fixed this
by changing it to a pre-op instead.  I had to change the starting value
from 3 to 4 so that we still iterate 3 times.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qlge/qlge_main.c b/drivers/net/ethernet/qlogic/qlge/qlge_main.c
index 02b7115..9979764 100644
--- a/drivers/net/ethernet/qlogic/qlge/qlge_main.c
+++ b/drivers/net/ethernet/qlogic/qlge/qlge_main.c
@@ -4211,8 +4211,9 @@ static int ql_change_rx_buffers(struct ql_adapter *qdev)
 
 	/* Wait for an outstanding reset to complete. */
 	if (!test_bit(QL_ADAPTER_UP, &qdev->flags)) {
-		int i = 3;
-		while (i-- && !test_bit(QL_ADAPTER_UP, &qdev->flags)) {
+		int i = 4;
+
+		while (--i && !test_bit(QL_ADAPTER_UP, &qdev->flags)) {
 			netif_err(qdev, ifup, qdev->ndev,
 				  "Waiting for adapter UP...\n");
 			ssleep(1);
