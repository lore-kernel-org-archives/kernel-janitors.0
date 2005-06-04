From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 04 Jun 2005 15:00:39 +0000
Subject: [KJ] [PATCH -mm] drivers/net/wireless/ipw2200: Use the
Message-Id: <20050604150039.GC1432@mail.nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76507100296941288=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050604145926.GB1432@mail.nuerscht.ch>
In-Reply-To: <20050604145926.GB1432@mail.nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============76507100296941288==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN -X dontdiff linux-2.6.12-rc5-mm2/drivers/net/wireless/ipw2200.c linux-2.6.12-rc5-mm2~dma_mask/drivers/net/wireless/ipw2200.c
--- linux-2.6.12-rc5-mm2/drivers/net/wireless/ipw2200.c	2005-06-02 21:04:32.000000000 +0200
+++ linux-2.6.12-rc5-mm2~dma_mask/drivers/net/wireless/ipw2200.c	2005-06-02 21:20:13.000000000 +0200
@@ -6993,10 +6993,9 @@ static int ipw_pci_probe(struct pci_dev 
 
 	pci_set_master(pdev);
 
-#define PCI_DMA_32BIT 0x00000000ffffffffULL
-	err = pci_set_dma_mask(pdev, PCI_DMA_32BIT);
+	err = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (!err) 
-		err = pci_set_consistent_dma_mask(pdev, PCI_DMA_32BIT);
+		err = pci_set_consistent_dma_mask(pdev, DMA_32BIT_MASK);
 	if (err) {
 		printk(KERN_WARNING DRV_NAME ": No suitable DMA available.\n");
 		goto out_pci_disable_device;

--===============76507100296941288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76507100296941288==--
