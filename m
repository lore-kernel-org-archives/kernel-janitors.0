From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:14:09 +0000
Subject: [KJ] [PATCH] drivers/net/tulip/* : pci_request_regions
Message-Id: <20050214151409.GN20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="dpynvXbW/eW9Tpc3"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--dpynvXbW/eW9Tpc3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>



--dpynvXbW/eW9Tpc3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_net_tulip.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/tulip/de2104x.c linux-2.6.11-rc4/drivers/net/tulip/de2104x.c
--- linux-2.6.11-rc4-vanilla/drivers/net/tulip/de2104x.c	2005-02-14 09:03:54.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tulip/de2104x.c	2005-02-14 14:48:07.000000000 +0100
@@ -1936,6 +1936,7 @@ static int __devinit de_init_one (struct
 	void __iomem *regs;
 	long pciaddr;
 	static int board_idx = -1;
+	int pci_dev_busy = 0 ;
 
 	board_idx++;
 
@@ -1986,8 +1987,10 @@ static int __devinit de_init_one (struct
 
 	/* reserve PCI resources to ensure driver atomicity */
 	rc = pci_request_regions(pdev, DRV_NAME);
-	if (rc)
+	if (rc) {
+		pci_dev_busy = 1 ;
 		goto err_out_disable;
+	}
 
 	/* check for invalid IRQ value */
 	if (pdev->irq < 2) {
@@ -2077,7 +2080,8 @@ err_out_iomap:
 err_out_res:
 	pci_release_regions(pdev);
 err_out_disable:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 err_out_free:
 	free_netdev(dev);
 	return rc;
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/tulip/dmfe.c linux-2.6.11-rc4/drivers/net/tulip/dmfe.c
--- linux-2.6.11-rc4-vanilla/drivers/net/tulip/dmfe.c	2005-02-14 09:03:54.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tulip/dmfe.c	2005-02-14 14:49:03.000000000 +0100
@@ -341,6 +341,7 @@ static int __devinit dmfe_init_one (stru
 	struct net_device *dev;
 	u32 dev_rev, pci_pmr;
 	int i, err;
+	int pci_dev_busy=0;
 
 	DMFE_DBUG(0, "dmfe_init_one()", 0);
 
@@ -392,6 +393,7 @@ static int __devinit dmfe_init_one (stru
 	if (pci_request_regions(pdev, DRV_NAME)) {
 		printk(KERN_ERR DRV_NAME ": Failed to request PCI regions\n");
 		err = -ENODEV;
+		pci_dev_busy = 1 ;
 		goto err_out_disable;
 	}
 
@@ -461,7 +463,8 @@ static int __devinit dmfe_init_one (stru
 err_out_res:
 	pci_release_regions(pdev);
 err_out_disable:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 err_out_free:
 	pci_set_drvdata(pdev, NULL);
 	free_netdev(dev);

--dpynvXbW/eW9Tpc3
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--dpynvXbW/eW9Tpc3--
