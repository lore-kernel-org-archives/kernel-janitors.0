From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 16 Feb 2005 23:02:17 +0000
Subject: [KJ] [PATCH] drivers/atm/lanai.c: Use the DMA_{64,
Message-Id: <20050216230217.GA17891@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91176520281283246=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91176520281283246==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/atm/lanai.c	2005-02-13 17:13:08.000000000 +0100
+++ linux-2.6.11-rc4/drivers/atm/lanai.c	2005-02-16 20:49:53.286372056 +0100
@@ -1964,7 +1964,7 @@ static int __init lanai_pci_start(struct
 		return -ENXIO;
 	}
 	pci_set_master(pci);
-	if (pci_set_dma_mask(pci, 0xFFFFFFFF) != 0) {
+	if (pci_set_dma_mask(pci, DMA_32BIT_MASK) != 0) {
 		printk(KERN_WARNING DEV_LABEL
 		    "(itf %d): No suitable DMA available.\n", lanai->number);
 		return -EBUSY;

--===============91176520281283246==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91176520281283246==--
