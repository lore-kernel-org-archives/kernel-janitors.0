From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 13:13:20 +0000
Subject: [KJ] [UPDATE PATCH 14/19] drivers/scsi/megaraid/megaraid_mbox: Use
Message-Id: <20050320131320.GN3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47535038386642953=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050220170849.GO14375@helium.tklauser.home>
In-Reply-To: <20050220170849.GO14375@helium.tklauser.home>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============47535038386642953==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/scsi/megaraid/megaraid_mbox.c	2005-03-02 12:50:37.000000000 +0100
+++ linux-2.6.11/drivers/scsi/megaraid/megaraid_mbox.c	2005-03-20 13:27:54.000000000 +0100
@@ -69,6 +69,7 @@
  * For history of changes, see Documentation/ChangeLog.megaraid
  */
 
+#include <linux/dma-mapping.h>
 #include "megaraid_mbox.h"
 
 static int megaraid_init(void);
@@ -619,7 +620,7 @@ megaraid_probe_one(struct pci_dev *pdev,
 
 	// Setup the default DMA mask. This would be changed later on
 	// depending on hardware capabilities
-	if (pci_set_dma_mask(adapter->pdev, 0xFFFFFFFF) != 0) {
+	if (pci_set_dma_mask(adapter->pdev, DMA_32BIT_MASK) != 0) {
 
 		con_log(CL_ANN, (KERN_WARNING
 			"megaraid: pci_set_dma_mask failed:%d\n", __LINE__));
@@ -1031,7 +1032,7 @@ megaraid_init_mbox(adapter_t *adapter)
 
 	// Set the DMA mask to 64-bit. All supported controllers as capable of
 	// DMA in this range
-	if (pci_set_dma_mask(adapter->pdev, 0xFFFFFFFFFFFFFFFFULL) != 0) {
+	if (pci_set_dma_mask(adapter->pdev, DMA_64BIT_MASK) != 0) {
 
 		con_log(CL_ANN, (KERN_WARNING
 			"megaraid: could not set DMA mask for 64-bit.\n"));

--===============47535038386642953==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47535038386642953==--
