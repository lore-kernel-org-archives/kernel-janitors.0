From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Jan 2014 22:45:05 +0000
Subject: [PATCH 3/3] smsc9420: use named constants for pci_power_t values
Message-Id: <1388706031-22180-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Glendinning <steve.glendinning@shawell.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2;
@@

pci_enable_wake(e1,
- 0
+ PCI_D0
,e2)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/ethernet/smsc/smsc9420.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/smsc/smsc9420.c b/drivers/net/ethernet/smsc/smsc9420.c
index 9d6effe..d3b967a 100644
--- a/drivers/net/ethernet/smsc/smsc9420.c
+++ b/drivers/net/ethernet/smsc/smsc9420.c
@@ -1540,7 +1540,7 @@ static int smsc9420_resume(struct pci_dev *pdev)
 
 	pci_set_master(pdev);
 
-	err = pci_enable_wake(pdev, 0, 0);
+	err = pci_enable_wake(pdev, PCI_D0, 0);
 	if (err)
 		netif_warn(pd, ifup, pd->dev, "pci_enable_wake failed: %d\n",
 			   err);

