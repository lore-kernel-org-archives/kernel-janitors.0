From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 08 Mar 2005 13:33:58 +0000
Subject: [KJ] [PATCH] drivers/ide/cs5520.c : Use the DMA_{64,
Message-Id: <20050308133358.GA5311@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26488565553873311=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-ide@vger.kernel.org, B.Zolnierkiewicz@elka.pw.edu.pl

--===============26488565553873311==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/ide/pci/cs5520.c	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/ide/pci/cs5520.c	2005-03-03 11:46:46.000000000 +0100
@@ -227,7 +227,7 @@ static int __devinit cs5520_init_one(str
 		return 1;
 	}
 	pci_set_master(dev);
-	if (pci_set_dma_mask(dev, 0xFFFFFFFF)) {
+	if (pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "cs5520: No suitable DMA available.\n");
 		return -ENODEV;
 	}

--===============26488565553873311==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26488565553873311==--
