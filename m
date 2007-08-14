From: <gregkh@suse.de>
Date: Tue, 14 Aug 2007 22:46:56 +0000
Subject: [KJ] patch pci-is_power_of_2-in-drivers-pci-pci.c.patch added to
Message-Id: <20070814230247.D11BF14458DB@imap.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


This is a note to let you know that I've just added the patch titled

     Subject: PCI: is_power_of_2 in drivers/pci/pci.c

to my gregkh-2.6 tree.  Its filename is

     pci-is_power_of_2-in-drivers-pci-pci.c.patch

This tree can be found at 
    http://www.kernel.org/pub/linux/kernel/people/gregkh/gregkh-2.6/patches/


From vignesh.babu@wipro.com  Tue Aug 14 15:26:37 2007
From: vignesh babu <vignesh.babu@wipro.com>
Date: Mon, 13 Aug 2007 18:23:14 +0530
Subject: PCI: is_power_of_2 in drivers/pci/pci.c
To: gregkh@suse.de
Cc: linux-pci@atrey.karlin.mff.cuni.cz, Kernel Janitors List <kernel-janitors@lists.osdl.org>
Message-ID: <1187009594.7273.4.camel@merlin.linuxcoe.com>


Replacing n & (n - 1) for power of 2 check by is_power_of_2(n)

Signed-off-by: vignesh babu <vignesh.babu@wipro.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

---
 drivers/pci/pci.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/log2.h>
 #include <asm/dma.h>	/* isa_dma_bridge_buggy */
 #include "pci.h"
 
@@ -1454,7 +1455,7 @@ int pcix_set_mmrbc(struct pci_dev *dev, 
 	int cap, err = -EINVAL;
 	u32 stat, cmd, v, o;
 
-	if (mmrbc < 512 || mmrbc > 4096 || (mmrbc & (mmrbc-1)))
+	if (mmrbc < 512 || mmrbc > 4096 || !is_power_of_2(mmrbc))
 		goto out;
 
 	v = ffs(mmrbc) - 10;
@@ -1526,7 +1527,7 @@ int pcie_set_readrq(struct pci_dev *dev,
 	int cap, err = -EINVAL;
 	u16 ctl, v;
 
-	if (rq < 128 || rq > 4096 || (rq & (rq-1)))
+	if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
 		goto out;
 
 	v = (ffs(rq) - 8) << 12;


Patches currently in gregkh-2.6 which might be from vignesh.babu@wipro.com are

pci/pci-is_power_of_2-in-drivers-pci-pci.c.patch
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
