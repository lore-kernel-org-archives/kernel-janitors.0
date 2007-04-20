From: Borislav Petkov <bbpetkov@yahoo.de>
Date: Fri, 20 Apr 2007 06:52:32 +0000
Subject: [KJ] [PATCH] Olympic (IBM PCI tokenring): handle return codes of
Message-Id: <20070420065232.GA5165@zmei.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tr@linuxtr.net, netdev@vger.kernel.org
Cc: kernel-janitors@lists.osdl.org

Handle return codes of register_netdev().

Signed-off-by: Borislav Petkov <bbpetkov@yahoo.de>


Index: 21-rc7/drivers/net/tokenring/olympic.c
=================================--- 21-rc7.orig/drivers/net/tokenring/olympic.c
+++ 21-rc7/drivers/net/tokenring/olympic.c
@@ -264,7 +264,10 @@ static int __devinit olympic_probe(struc
 	SET_NETDEV_DEV(dev, &pdev->dev);
 
 	pci_set_drvdata(pdev,dev) ; 
-	register_netdev(dev) ; 
+
+	if (register_netdev(dev))
+		goto op_free_iomap;
+
 	printk("Olympic: %s registered as: %s\n",olympic_priv->olympic_card_name,dev->name);
 	if (olympic_priv->olympic_network_monitor) { /* Must go after register_netdev as we need the device name */ 
 		char proc_name[20] ; 
@@ -281,7 +284,8 @@ op_free_iomap:
 	if (olympic_priv->olympic_lap)
 		iounmap(olympic_priv->olympic_lap);
 
-	free_netdev(dev);
+	if (dev)
+		free_netdev(dev);
 op_release_dev:
 	pci_release_regions(pdev); 
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
