From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 31 Mar 2005 14:58:36 +0000
Subject: [KJ] [PATCH 2/2] atm/he: Use the DMA_32BIT_MASK constant
Message-Id: <20050331145836.GB19882@argon.bioc.unizh.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60993990780730778=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============60993990780730778==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/atm/he.h linux-2.6.11/drivers/atm/he.h
--- linux-2.6.11.orig/drivers/atm/he.h	2005-03-02 12:50:39.000000000 +0100
+++ linux-2.6.11/drivers/atm/he.h	2005-03-30 14:36:53.000000000 +0200
@@ -380,8 +380,6 @@ struct he_vcc
 #define PCI_VENDOR_ID_FORE	0x1127
 #define PCI_DEVICE_ID_FORE_HE	0x400
 
-#define HE_DMA_MASK		0xffffffff
-
 #define GEN_CNTL_0				0x40
 #define  INT_PROC_ENBL		(1<<25)
 #define  SLAVE_ENDIAN_MODE	(1<<16)

--===============60993990780730778==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60993990780730778==--
