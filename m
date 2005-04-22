From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 22 Apr 2005 08:43:19 +0000
Subject: [KJ] [PATCH] drivers/net/tlan.c : Use the DMA_{32|64}_MASK constant
Message-Id: <20050422084319.GC31439@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="MW5yreqqjyrRcusr"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details


Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--MW5yreqqjyrRcusr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="linux-2.6.12-rc3_drivers_net_tlan.c.patch"

diff -urpNX dontdiff a/drivers/net/tlan.c b/drivers/net/tlan.c
--- a/drivers/net/tlan.c	2005-04-21 02:03:14.000000000 +0200
+++ b/drivers/net/tlan.c	2005-04-22 10:27:36.726073696 +0200
@@ -177,6 +177,7 @@
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/mii.h>
+#include <linux/dma-mapping.h>
 
 #include "tlan.h"
 
@@ -555,7 +556,7 @@ static int __devinit TLan_probe1(struct 
 
 		priv->adapter = &board_info[ent->driver_data];
 
-		rc = pci_set_dma_mask(pdev, 0xFFFFFFFF);
+		rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR "TLAN: No suitable PCI mapping available.\n");
 			goto err_out_free_dev;

--MW5yreqqjyrRcusr
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--MW5yreqqjyrRcusr--
