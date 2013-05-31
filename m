From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 May 2013 10:07:19 +0000
Subject: [patch -next] bnx2x: fix a power state test
Message-Id: <20130531075840.GA28370@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eilon Greenstein <eilong@broadcom.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

PCI_D0 is zero so the original test is never true.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have the hardware to test this, and I'm not positive on it.
Buyer beware!

diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
index 263950c..a9a1609 100644
--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
+++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_ethtool.c
@@ -1391,7 +1391,7 @@ static bool bnx2x_is_nvm_accessible(struct bnx2x *bp)
 		rc = pci_read_config_word(bp->pdev,
 					  bp->pm_cap + PCI_PM_CTRL, &pm);
 
-	if ((rc && !netif_running(dev)) || (!rc && ((pm & PCI_D0) != PCI_D0)))
+	if ((rc && !netif_running(dev)) || (!rc && pm != PCI_D0))
 		return false;
 
 	return true;
