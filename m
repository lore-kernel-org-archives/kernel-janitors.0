From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 23 Sep 2005 08:46:00 +0000
Subject: [KJ] printk : arch/alpha/kernel/pci_iommu.c
Message-Id: <20050923084600.GD10553@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0022051433577265911=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0022051433577265911==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



Index: linux-2.6.14-rc2/arch/alpha/kernel/pci_iommu.c
===================================================================
--- linux-2.6.14-rc2.orig/arch/alpha/kernel/pci_iommu.c
+++ linux-2.6.14-rc2/arch/alpha/kernel/pci_iommu.c
@@ -79,7 +79,7 @@ iommu_arena_new_node(int nid, struct pci
         if (!NODE_DATA(nid) ||
             (NULL == (arena = alloc_bootmem_node(NODE_DATA(nid),
                                                  sizeof(*arena))))) {
-                printk("%s: couldn't allocate arena from node %d\n"
+                printk(KERN_WARNING "%s: couldn't allocate arena from node %d\n"
                        "    falling back to system-wide allocation\n",
                        __FUNCTION__, nid);
                 arena = alloc_bootmem(sizeof(*arena));
@@ -90,7 +90,7 @@ iommu_arena_new_node(int nid, struct pci
                                                          mem_size,
                                                          align,
                                                          0)))) {
-                printk("%s: couldn't allocate arena ptes from node %d\n"
+                printk(KERN_WARNING "%s: couldn't allocate arena ptes from node %d\n"
                        "    falling back to system-wide allocation\n",
                        __FUNCTION__, nid);
                 arena->ptes = __alloc_bootmem(mem_size, align, 0);


--===============0022051433577265911==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0022051433577265911==--
