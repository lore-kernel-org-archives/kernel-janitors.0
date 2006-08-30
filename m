From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:35 +0000
Subject: [KJ] [PATCH] 19/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214735.15055.6401.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index c468e31..4d828bb 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -79,9 +79,9 @@ #ifdef CONFIG_DISCONTIGMEM
         if (!NODE_DATA(nid) ||
             (NULL = (arena = alloc_bootmem_node(NODE_DATA(nid),
                                                  sizeof(*arena))))) {
-                printk("%s: couldn't allocate arena from node %d\n"
-                       "    falling back to system-wide allocation\n",
+                printk(KERN_WARNING "%s: couldn't allocate arena from node %d\n",
                        __FUNCTION__, nid);
+                printk(KERN_WARNING "    falling back to system-wide allocation\n");
                 arena = alloc_bootmem(sizeof(*arena));
         }
 
@@ -90,9 +90,9 @@ #ifdef CONFIG_DISCONTIGMEM
                                                          mem_size,
                                                          align,
                                                          0)))) {
-                printk("%s: couldn't allocate arena ptes from node %d\n"
-                       "    falling back to system-wide allocation\n",
+                printk(KERN_WARNING "%s: couldn't allocate arena ptes from node %d\n",
                        __FUNCTION__, nid);
+                printk(KERN_WARNING "    falling back to system-wide allocation\n");
                 arena->ptes = __alloc_bootmem(mem_size, align, 0);
         }
 
@@ -402,8 +402,8 @@ pci_alloc_consistent(struct pci_dev *pde
 try_again:
 	cpu_addr = (void *)__get_free_pages(gfp, order);
 	if (! cpu_addr) {
-		printk(KERN_INFO "pci_alloc_consistent: "
-		       "get_free_pages failed from %p\n",
+		printk(KERN_WARNING "pci_alloc_consistent: "
+			"get_free_pages failed from %p\n",
 			__builtin_return_address(0));
 		/* ??? Really atomic allocation?  Otherwise we could play
 		   with vmalloc and sg if we can't find contiguous memory.  */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
