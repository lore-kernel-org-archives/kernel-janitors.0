From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 09:50:20 +0000
Subject: [PATCH] PA-RISC-inventory: Use kmalloc_array() in add_system_map_addresses()
Message-Id: <c4e387d2-2be0-737f-b22e-f4e358f4f2ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>, "James E. J. Bottomley" <jejb@parisc-linux.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 28 Aug 2016 11:40:53 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/parisc/kernel/inventory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/parisc/kernel/inventory.c b/arch/parisc/kernel/inventory.c
index f0b6722..545f9d2 100644
--- a/arch/parisc/kernel/inventory.c
+++ b/arch/parisc/kernel/inventory.c
@@ -506,7 +506,7 @@ add_system_map_addresses(struct parisc_device *dev, int num_addrs,
 	long status;
 	struct pdc_system_map_addr_info addr_result;
 
-	dev->addr = kmalloc(num_addrs * sizeof(unsigned long), GFP_KERNEL);
+	dev->addr = kmalloc_array(num_addrs, sizeof(*dev->addr), GFP_KERNEL);
 	if(!dev->addr) {
 		printk(KERN_ERR "%s %s(): memory allocation failure\n",
 		       __FILE__, __func__);
-- 
2.9.3

