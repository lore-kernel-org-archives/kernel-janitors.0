From: Christophe Lucas <c.lucas@ifrance.com>
Date: Mon, 14 Feb 2005 14:57:17 +0000
Subject: [KJ] [PATCH] drivers/block/* : pci_request_regions
Message-Id: <20050214145717.GG20620@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="2hMgfIw2X+zgXrFs"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

description:
If PCI request regions fails, then someone else is using the
hardware we wish to use. For that one case, calling
pci_disable_device() is rather rude.
See : http://www.ussg.iu.edu/hypermail/linux/kernel/0502.1/1061.html

Signed-off-by: Christophe Lucas <c.lucas@ifrance.com>

--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="pci_disable-linux-2.6.11-rc4_drivers_block.patch"

diff -urpN -X /work/users/dontdiff linux-2.6.11-rc4-vanilla/drivers/block/sx8.c linux-2.6.11-rc4/drivers/block/sx8.c
--- linux-2.6.11-rc4-vanilla/drivers/block/sx8.c	2005-02-14 09:03:40.000000000 +0100
+++ linux-2.6.11-rc4/drivers/block/sx8.c	2005-02-14 09:43:27.000000000 +0100
@@ -1569,6 +1569,7 @@ static int carm_init_one (struct pci_dev
 	int rc;
 	request_queue_t *q;
 	unsigned int i;
+	int pci_dev_busy = 0 ;
 
 	if (!printed_version++)
 		printk(KERN_DEBUG DRV_NAME " version " DRV_VERSION "\n");
@@ -1578,8 +1579,10 @@ static int carm_init_one (struct pci_dev
 		return rc;
 
 	rc = pci_request_regions(pdev, DRV_NAME);
-	if (rc)
+	if (rc) {
+		pci_dev_busy = 1 ;
 		goto err_out;
+	}
 
 #if IF_64BIT_DMA_IS_POSSIBLE /* grrrr... */
 	rc = pci_set_dma_mask(pdev, 0xffffffffffffffffULL);
@@ -1717,7 +1720,8 @@ err_out_kfree:
 err_out_regions:
 	pci_release_regions(pdev);
 err_out:
-	pci_disable_device(pdev);
+	if(!pci_dev_busy)
+		pci_disable_device(pdev);
 	return rc;
 }
 

--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--2hMgfIw2X+zgXrFs--
