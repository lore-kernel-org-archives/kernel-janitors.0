From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 12 Jan 2012 09:55:16 +0000
Subject: [PATCH 14/15] drivers/pci/hotplug/ibmphp_ebda.c: add missing iounmap
Message-Id: <1326362117-29371-14-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesse Barnes <jbarnes@virtuousgeek.org>
Cc: kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add missing iounmap in error handling code, in a case where the function
already preforms iounmap on some other execution path.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
statement S,S1;
int ret;
@@
e = \(ioremap\|ioremap_nocache\)(...)
... when != iounmap(e)
if (<+...e...+>) S
... when any
    when != iounmap(e)
*if (...)
   { ... when != iounmap(e)
     return ...; }
... when any
iounmap(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/pci/hotplug/ibmphp_ebda.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/ibmphp_ebda.c b/drivers/pci/hotplug/ibmphp_ebda.c
index 2850e64..714ca5c 100644
--- a/drivers/pci/hotplug/ibmphp_ebda.c
+++ b/drivers/pci/hotplug/ibmphp_ebda.c
@@ -368,8 +368,10 @@ int __init ibmphp_access_ebda (void)
 			debug ("rio blk id: %x\n", blk_id);
 
 			rio_table_ptr = kzalloc(sizeof(struct rio_table_hdr), GFP_KERNEL);
-			if (!rio_table_ptr)
-				return -ENOMEM; 
+			if (!rio_table_ptr) {
+				rc = -ENOMEM;
+				goto out;
+			}
 			rio_table_ptr->ver_num = readb (io_mem + offset);
 			rio_table_ptr->scal_count = readb (io_mem + offset + 1);
 			rio_table_ptr->riodev_count = readb (io_mem + offset + 2);

