From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 13:05:14 +0000
Subject: [kj] is_power_of_2 in drivers/pci/pci.c
Message-Id: <1187009594.7273.4.camel@merlin.linuxcoe.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-pci@atrey.karlin.mff.cuni.cz, Kernel Janitors List <kernel-janitors@lists.osdl.org>

Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
---
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 37c00f6..19a64a3 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/log2.h>
 #include <asm/dma.h>	/* isa_dma_bridge_buggy */
 #include "pci.h"
 
@@ -1454,7 +1455,7 @@ int pcix_set_mmrbc(struct pci_dev *dev, int mmrbc)
 	int cap, err = -EINVAL;
 	u32 stat, cmd, v, o;
 
-	if (mmrbc < 512 || mmrbc > 4096 || (mmrbc & (mmrbc-1)))
+	if (mmrbc < 512 || mmrbc > 4096 || !is_power_of_2(mmrbc))
 		goto out;
 
 	v = ffs(mmrbc) - 10;
@@ -1526,7 +1527,7 @@ int pcie_set_readrq(struct pci_dev *dev, int rq)
 	int cap, err = -EINVAL;
 	u16 ctl, v;
 
-	if (rq < 128 || rq > 4096 || (rq & (rq-1)))
+	if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
 		goto out;
 
 	v = (ffs(rq) - 8) << 12;

-- 
Vignesh Babu BM 
_____________________________________________________________ 
"Why is it that every time I'm with you, makes me believe in magic?"

_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
