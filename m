From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 04 Jun 2005 14:59:26 +0000
Subject: [KJ] [PATCH -mm] drivers/net/wireless/ipw2100: Use the
Message-Id: <20050604145926.GB1432@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67973267038679253=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67973267038679253==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc5-mm2/drivers/net/wireless/ipw2100.c linux-2.6.12-rc5-mm2~dma_mask/drivers/net/wireless/ipw2100.c
--- linux-2.6.12-rc5-mm2/drivers/net/wireless/ipw2100.c	2005-06-02 21:04:32.000000000 +0200
+++ linux-2.6.12-rc5-mm2~dma_mask/drivers/net/wireless/ipw2100.c	2005-06-02 21:17:37.000000000 +0200
@@ -146,6 +146,7 @@ that only one external action is invoked
 #include <linux/netdevice.h>
 #include <linux/ethtool.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/proc_fs.h>
 #include <linux/skbuff.h>
 #include <asm/uaccess.h>
@@ -6440,10 +6441,6 @@ static struct net_device *ipw2100_alloc_
 	return dev;
 }
 
-
-
-#define PCI_DMA_32BIT   0x00000000ffffffffULL
-
 static int ipw2100_pci_init_one(struct pci_dev *pci_dev,
 				const struct pci_device_id *ent)
 {
@@ -6497,7 +6494,7 @@ static int ipw2100_pci_init_one(struct p
 	pci_set_master(pci_dev);
 	pci_set_drvdata(pci_dev, priv);
 
-	err = pci_set_dma_mask(pci_dev, PCI_DMA_32BIT);
+	err = pci_set_dma_mask(pci_dev, DMA_32BIT_MASK);
 	if (err) {
 		printk(KERN_WARNING DRV_NAME
 		       "Error calling pci_set_dma_mask.\n");

--===============67973267038679253==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67973267038679253==--
