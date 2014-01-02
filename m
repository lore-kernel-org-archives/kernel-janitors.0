From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Jan 2014 15:33:06 +0000
Subject: [PATCH] net: tulip: delete useless tests on netdev_priv
Message-Id: <1388680129-13661-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Grundler <grundler@parisc-linux.org>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Netdev_priv performs an addition, not a pointer dereference, so it seems
quit unlikely that its result would ever be NULL.

A semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
statement S;
@@

- if (!netdev_priv(...)) S
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/dec/tulip/uli526x.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/ethernet/dec/tulip/uli526x.c b/drivers/net/ethernet/dec/tulip/uli526x.c
index a5397b1..aa4ee38 100644
--- a/drivers/net/ethernet/dec/tulip/uli526x.c
+++ b/drivers/net/ethernet/dec/tulip/uli526x.c
@@ -1192,9 +1192,6 @@ static int uli526x_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	ULI526X_DBUG(0, "uli526x_suspend", 0);
 
-	if (!netdev_priv(dev))
-		return 0;
-
 	pci_save_state(pdev);
 
 	if (!netif_running(dev))
@@ -1228,9 +1225,6 @@ static int uli526x_resume(struct pci_dev *pdev)
 
 	ULI526X_DBUG(0, "uli526x_resume", 0);
 
-	if (!netdev_priv(dev))
-		return 0;
-
 	pci_restore_state(pdev);
 
 	if (!netif_running(dev))

