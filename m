From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Tue, 08 Mar 2005 14:45:58 +0000
Subject: [KJ] [PATCH] drivers/message/fusion/mptbase.c: Use the DMA_{64,
Message-Id: <20050308144558.GF5311@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94028929565564301=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94028929565564301==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/message/fusion/mptbase.c	2005-03-02 12:50:40.000000000 +0100
+++ linux-2.6.11/drivers/message/fusion/mptbase.c	2005-03-03 11:56:28.000000000 +0100
@@ -1100,7 +1100,7 @@ mptbase_probe(struct pci_dev *pdev, cons
 	if (!pci_set_dma_mask(pdev, mask)) {
 		dprintk((KERN_INFO MYNAM
 			": 64 BIT PCI BUS DMA ADDRESSING SUPPORTED\n"));
-	} else if (pci_set_dma_mask(pdev, (u64) 0xffffffff)) {
+	} else if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING MYNAM ": 32 BIT PCI BUS DMA ADDRESSING NOT SUPPORTED\n");
 		return r;
 	}

--===============94028929565564301==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94028929565564301==--
