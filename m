From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 30 Jun 2006 09:43:37 +0000
Subject: [KJ] entry in TODO List
Message-Id: <20060630094337.GD12178@rotomalug.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

Sorry if it is a mistake: but do we must do the same work on 
- Use dev_set_drvdata to set dev->driver_data
  ...
as :
- Use pci_set_drvdata() to set dev->driver_data, likewise use
  pci_get_drvdata()
  instead of reading directly.
  -   dev->driver_data = pcigame;
  +   pci_set_drvdata(dev, pcigame);

Few words more act... Does this patch is correct ?


Index: linux-2.6.17.2/drivers/net/tulip/de4x5.c
=================================--- linux-2.6.17.2.orig/drivers/net/tulip/de4x5.c	2006-06-30 11:41:37.000000000 +0200
+++ linux-2.6.17.2/drivers/net/tulip/de4x5.c	2006-06-30 11:42:38.000000000 +0200
@@ -1090,7 +1090,7 @@
     struct pci_dev *pdev = NULL;
     int i, status=0;
 
-    gendev->driver_data = dev;
+    dev_set_drvdata(gendev, dev);
 
     /* Ensure we're not sleeping */
     if (lp->bus = EISA) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
