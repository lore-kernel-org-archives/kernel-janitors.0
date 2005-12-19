From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 19 Dec 2005 00:27:44 +0000
Subject: [KJ] [Patch 6/5] Cleanup LINUX_VERSION_CODE in drivers/net
Message-Id: <1134952064.8352.4.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============087740800861641599=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============087740800861641599==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

> attached is an updated patch for vlsi_ir.h which also removes
> the PCIDE_NAME macro, i will reply to this mail with a patch to change
> the vlsi_ir.c 

here is the cleanup to vlsi_ir.c

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.c.orig	2005-12-19 01:19:01.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/net/irda/vlsi_ir.c	2005-12-19 01:20:42.000000000 +0100
@@ -167,7 +167,7 @@ static void vlsi_proc_pdev(struct seq_fi
 	unsigned i;
 
 	seq_printf(seq, "\n%s (vid/did: %04x/%04x)\n",
-		   PCIDEV_NAME(pdev), (int)pdev->vendor, (int)pdev->device);
+		   pci_name(pdev), (int)pdev->vendor, (int)pdev->device);
 	seq_printf(seq, "pci-power-state: %u\n", (unsigned) pdev->current_state);
 	seq_printf(seq, "resources: irq=%u / io=0x%04x / dma_mask=0x%016Lx\n",
 		   pdev->irq, (unsigned)pci_resource_start(pdev, 0), (unsigned long long)pdev->dma_mask);
@@ -1402,7 +1402,7 @@ static void vlsi_tx_timeout(struct net_d
 
 	if (vlsi_start_hw(idev))
 		IRDA_ERROR("%s: failed to restart hw - %s(%s) unusable!\n",
-			   __FUNCTION__, PCIDEV_NAME(idev->pdev), ndev->name);
+			   __FUNCTION__, pci_name(idev->pdev), ndev->name);
 	else
 		netif_start_queue(ndev);
 }
@@ -1645,7 +1645,7 @@ vlsi_irda_probe(struct pci_dev *pdev, co
 		pdev->current_state = 0; /* hw must be running now */
 
 	IRDA_MESSAGE("%s: IrDA PCI controller %s detected\n",
-		     drivername, PCIDEV_NAME(pdev));
+		     drivername, pci_name(pdev));
 
 	if ( !pci_resource_start(pdev,0)
 	     || !(pci_resource_flags(pdev,0) & IORESOURCE_IO) ) {
@@ -1730,7 +1730,7 @@ static void __devexit vlsi_irda_remove(s
 
 	pci_set_drvdata(pdev, NULL);
 
-	IRDA_MESSAGE("%s: %s removed\n", drivername, PCIDEV_NAME(pdev));
+	IRDA_MESSAGE("%s: %s removed\n", drivername, pci_name(pdev));
 }
 
 #ifdef CONFIG_PM
@@ -1750,7 +1750,7 @@ static int vlsi_irda_suspend(struct pci_
 
 	if (!ndev) {
 		IRDA_ERROR("%s - %s: no netdevice \n",
-			   __FUNCTION__, PCIDEV_NAME(pdev));
+			   __FUNCTION__, pci_name(pdev));
 		return 0;
 	}
 	idev = ndev->priv;	
@@ -1761,7 +1761,7 @@ static int vlsi_irda_suspend(struct pci_
 			pdev->current_state = state.event;
 		}
 		else
-			IRDA_ERROR("%s - %s: invalid suspend request %u -> %u\n", __FUNCTION__, PCIDEV_NAME(pdev), pdev->current_state, state.event);
+			IRDA_ERROR("%s - %s: invalid suspend request %u -> %u\n", __FUNCTION__, pci_name(pdev), pdev->current_state, state.event);
 		up(&idev->sem);
 		return 0;
 	}
@@ -1789,7 +1789,7 @@ static int vlsi_irda_resume(struct pci_d
 
 	if (!ndev) {
 		IRDA_ERROR("%s - %s: no netdevice \n",
-			   __FUNCTION__, PCIDEV_NAME(pdev));
+			   __FUNCTION__, pci_name(pdev));
 		return 0;
 	}
 	idev = ndev->priv;	
@@ -1797,7 +1797,7 @@ static int vlsi_irda_resume(struct pci_d
 	if (pdev->current_state == 0) {
 		up(&idev->sem);
 		IRDA_WARNING("%s - %s: already resumed\n",
-			     __FUNCTION__, PCIDEV_NAME(pdev));
+			     __FUNCTION__, pci_name(pdev));
 		return 0;
 	}
 	



--===============087740800861641599==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============087740800861641599==--
