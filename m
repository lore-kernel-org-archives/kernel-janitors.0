From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 15:08:15 +0000
Subject: [KJ] [PATCH] drivers/net/* : pci_request_regions
Message-Id: <20050214150815.GJ20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="cfJ13FhsvNR/yOpm"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>


--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_net.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/amd8111e.c linux-2.6.11-rc4/drivers/net/amd8111e.c
--- linux-2.6.11-rc4-vanilla/drivers/net/amd8111e.c	2005-02-14 09:03:50.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/amd8111e.c	2005-02-14 15:27:05.000000000 +0100
@@ -1967,6 +1967,7 @@ static int __devinit amd8111e_probe_one(
 	unsigned long reg_addr,reg_len;
 	struct amd8111e_priv* lp;
 	struct net_device* dev;
+	int pci_dev_busy = 0 ;
 
 	err = pci_enable_device(pdev);
 	if(err){
@@ -1986,6 +1987,7 @@ static int __devinit amd8111e_probe_one(
 	if(err){
 		printk(KERN_ERR "amd8111e: Cannot obtain PCI resources, "
 		       "exiting.\n");
+		pci_dev_busy = 1 ;
 		goto err_disable_pdev;
 	}
 
@@ -2135,7 +2137,8 @@ err_free_reg:
 	pci_release_regions(pdev);
 
 err_disable_pdev:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy) 
+		pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 	return err;
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/b44.c linux-2.6.11-rc4/drivers/net/b44.c
--- linux-2.6.11-rc4-vanilla/drivers/net/b44.c	2004-12-24 22:34:32.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/b44.c	2005-02-14 15:26:04.000000000 +0100
@@ -1737,6 +1737,7 @@ static int __devinit b44_init_one(struct
 	struct net_device *dev;
 	struct b44 *bp;
 	int err, i;
+	int pci_dev_busy = 0 ;
 
 	if (b44_version_printed++ == 0)
 		printk(KERN_INFO "%s", version);
@@ -1759,6 +1760,7 @@ static int __devinit b44_init_one(struct
 	if (err) {
 		printk(KERN_ERR PFX "Cannot obtain PCI resources, "
 		       "aborting.\n");
+		pci_dev_busy = 1 ;
 		goto err_out_disable_pdev;
 	}
 
@@ -1882,7 +1884,8 @@ err_out_free_res:
 	pci_release_regions(pdev);
 
 err_out_disable_pdev:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy) 
+		pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 	return err;
 }
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/dl2k.c linux-2.6.11-rc4/drivers/net/dl2k.c
--- linux-2.6.11-rc4-vanilla/drivers/net/dl2k.c	2005-02-14 09:03:51.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/dl2k.c	2005-02-14 13:32:04.000000000 +0100
@@ -135,6 +135,7 @@ rio_probe1 (struct pci_dev *pdev, const 
 	static int version_printed;
 	void *ring_space;
 	dma_addr_t ring_dma;
+	int pci_dev_busy = 0 ;
 
 	if (!version_printed++)
 		printk ("%s", version);
@@ -145,8 +146,10 @@ rio_probe1 (struct pci_dev *pdev, const 
 
 	irq = pdev->irq;
 	err = pci_request_regions (pdev, "dl2k");
-	if (err)
+	if (err) {
+		pci_dev_busy = 1 ;
 		goto err_out_disable;
+	}
 
 	pci_set_master (pdev);
 	dev = alloc_etherdev (sizeof (*np));
@@ -327,7 +330,8 @@ rio_probe1 (struct pci_dev *pdev, const 
 	pci_release_regions (pdev);
 
       err_out_disable:
-	pci_disable_device (pdev);
+	if(!pci_dev_busy) 
+		pci_disable_device (pdev);
 	return err;
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/e100.c linux-2.6.11-rc4/drivers/net/e100.c
--- linux-2.6.11-rc4-vanilla/drivers/net/e100.c	2005-02-14 09:03:51.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/e100.c	2005-02-14 15:25:28.000000000 +0100
@@ -2153,6 +2153,7 @@ static int __devinit e100_probe(struct p
 	struct net_device *netdev;
 	struct nic *nic;
 	int err;
+	int pci_dev_busy = 0 ;
 
 	if(!(netdev = alloc_etherdev(sizeof(struct nic)))) {
 		if(((1 << debug) - 1) & NETIF_MSG_PROBE)
@@ -2198,6 +2199,7 @@ static int __devinit e100_probe(struct p
 
 	if((err = pci_request_regions(pdev, DRV_NAME))) {
 		DPRINTK(PROBE, ERR, "Cannot obtain PCI resources, aborting.\n");
+		pci_dev_busy = 1 ;
 		goto err_out_disable_pdev;
 	}
 
@@ -2286,7 +2288,8 @@ err_out_iounmap:
 err_out_free_res:
 	pci_release_regions(pdev);
 err_out_disable_pdev:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 err_out_free_dev:
 	pci_set_drvdata(pdev, NULL);
 	free_netdev(netdev);
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/epic100.c linux-2.6.11-rc4/drivers/net/epic100.c
--- linux-2.6.11-rc4-vanilla/drivers/net/epic100.c	2005-02-14 09:03:51.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/epic100.c	2005-02-14 14:30:11.000000000 +0100
@@ -384,7 +384,8 @@ static int __devinit epic_init_one (stru
 	int i, ret, option = 0, duplex = 0;
 	void *ring_space;
 	dma_addr_t ring_dma;
-
+	int pci_dev_busy = 0 ;
+	
 /* when built into the kernel, we only print version if device is found */
 #ifndef MODULE
 	static int printed_version;
@@ -409,8 +410,10 @@ static int __devinit epic_init_one (stru
 	pci_set_master(pdev);
 
 	ret = pci_request_regions(pdev, DRV_NAME);
-	if (ret < 0)
+	if (ret < 0 ) {
+		pci_dev_busy = 1 ;
 		goto err_out_disable;
+	}
 
 	ret = -ENOMEM;
 
@@ -584,7 +587,8 @@ err_out_free_netdev:
 err_out_free_res:
 	pci_release_regions(pdev);
 err_out_disable:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy ) 
+		pci_disable_device(pdev);
 	goto out;
 }
 
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/forcedeth.c linux-2.6.11-rc4/drivers/net/forcedeth.c
--- linux-2.6.11-rc4-vanilla/drivers/net/forcedeth.c	2005-02-14 09:03:51.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/forcedeth.c	2005-02-14 14:32:32.000000000 +0100
@@ -1885,6 +1885,7 @@ static int __devinit nv_probe(struct pci
 	unsigned long addr;
 	u8 __iomem *base;
 	int err, i;
+	int pci_dev_busy = 0 ;
 
 	dev = alloc_etherdev(sizeof(struct fe_priv));
 	err = -ENOMEM;
@@ -1914,8 +1915,10 @@ static int __devinit nv_probe(struct pci
 	pci_set_master(pci_dev);
 
 	err = pci_request_regions(pci_dev, DRV_NAME);
-	if (err < 0)
+	if (err < 0) {
+		pci_dev_busy = 1 ;
 		goto out_disable;
+	}
 
 	err = -EINVAL;
 	addr = 0;
@@ -2089,7 +2092,8 @@ out_unmap:
 out_relreg:
 	pci_release_regions(pci_dev);
 out_disable:
-	pci_disable_device(pci_dev);
+	if(!pci_dev_busy)
+		pci_disable_device(pci_dev);
 out_free:
 	free_netdev(dev);
 out:
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/saa9730.c linux-2.6.11-rc4/drivers/net/saa9730.c
--- linux-2.6.11-rc4-vanilla/drivers/net/saa9730.c	2004-12-24 22:34:58.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/saa9730.c	2005-02-14 14:40:22.000000000 +0100
@@ -1107,6 +1107,7 @@ static int __devinit saa9730_init_one(st
 	struct net_device *dev;
 	unsigned int pci_ioaddr;
 	int err;
+	int pci_dev_busy = 0 ;
 
 	if (lan_saa9730_debug > 1)
 		printk("saa9730.c: PCI bios is present, checking for devices...\n");
@@ -1127,6 +1128,7 @@ static int __devinit saa9730_init_one(st
 	err = pci_request_regions(pdev, DRV_MODULE_NAME);
 	if (err) {
 		printk(KERN_ERR "Cannot obtain PCI resources, aborting.\n");
+		pci_dev_busy = 1 ;
 		goto out2;
 	}
 
@@ -1150,7 +1152,8 @@ static int __devinit saa9730_init_one(st
 	return 0;
 	
 out2:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 out1:
 	free_netdev(dev);
 out:
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/tg3.c linux-2.6.11-rc4/drivers/net/tg3.c
--- linux-2.6.11-rc4-vanilla/drivers/net/tg3.c	2005-02-14 09:03:54.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/tg3.c	2005-02-14 15:27:36.000000000 +0100
@@ -8610,6 +8610,7 @@ static int __devinit tg3_init_one(struct
 	struct net_device *dev;
 	struct tg3 *tp;
 	int i, err, pci_using_dac, pm_cap;
+	int pci_dev_busy = 0 ;
 
 	if (tg3_version_printed++ == 0)
 		printk(KERN_INFO "%s", version);
@@ -8632,6 +8633,7 @@ static int __devinit tg3_init_one(struct
 	if (err) {
 		printk(KERN_ERR PFX "Cannot obtain PCI resources, "
 		       "aborting.\n");
+		pci_dev_busy = 1;
 		goto err_out_disable_pdev;
 	}
 
@@ -8903,7 +8905,8 @@ err_out_free_res:
 	pci_release_regions(pdev);
 
 err_out_disable_pdev:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy) 
+		pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
 	return err;
 }
diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/net/via-velocity.c linux-2.6.11-rc4/drivers/net/via-velocity.c
--- linux-2.6.11-rc4-vanilla/drivers/net/via-velocity.c	2005-02-14 09:03:54.000000000 +0100
+++ linux-2.6.11-rc4/drivers/net/via-velocity.c	2005-02-14 14:50:32.000000000 +0100
@@ -692,6 +692,7 @@ static int __devinit velocity_found1(str
 	struct velocity_info *vptr;
 	struct mac_regs __iomem * regs;
 	int ret = -ENOMEM;
+	int pci_dev_busy = 0 ;
 
 	if (velocity_nics >= MAX_UNITS) {
 		printk(KERN_NOTICE VELOCITY_NAME ": already found %d NICs.\n", 
@@ -740,6 +741,7 @@ static int __devinit velocity_found1(str
 	ret = pci_request_regions(pdev, VELOCITY_NAME);
 	if (ret < 0) {
 		printk(KERN_ERR VELOCITY_NAME ": Failed to find PCI device.\n");
+		pci_dev_busy = 1 ;
 		goto err_disable;
 	}
 
@@ -823,7 +825,8 @@ err_iounmap:
 err_release_res:
 	pci_release_regions(pdev);
 err_disable:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 err_free_dev:
 	free_netdev(dev);
 	goto out;

--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--cfJ13FhsvNR/yOpm--
