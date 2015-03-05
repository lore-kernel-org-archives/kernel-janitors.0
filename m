From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Mar 2015 11:27:00 +0000
Subject: [patch] m68k: remove a superflous KERN_ERR
Message-Id: <20150305112700.GC13378@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, kernel-janitors@vger.kernel.org

pr_err() has a KERN_ERR built in.  Smatch complains about these nowadays.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/m68k/kernel/pcibios.c b/arch/m68k/kernel/pcibios.c
index 931a31f..8520250 100644
--- a/arch/m68k/kernel/pcibios.c
+++ b/arch/m68k/kernel/pcibios.c
@@ -62,7 +62,7 @@ int pcibios_enable_device(struct pci_dev *dev, int mask)
 
 		r = dev->resource + idx;
 		if (!r->start && r->end) {
-			pr_err(KERN_ERR "PCI: Device %s not available because of resource collisions\n",
+			pr_err("PCI: Device %s not available because of resource collisions\n",
 				pci_name(dev));
 			return -EINVAL;
 		}
