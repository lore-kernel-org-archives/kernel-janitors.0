From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:52 +0000
Subject: [KJ] [patch 2.6.13-rc1 18/23] Audit return code of create_proc_*
Message-Id: <20050707154643.692435000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74532843178385288=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74532843178385288==
Content-Disposition: inline;
	filename=proc_create_arch_parisc_kernel_pci-dma.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/parisc/kernel/pci-dma.c 2.6.13-rc1/arch/parisc/kernel/pci-dma.c
--- 2.6.13-rc1.orig/arch/parisc/kernel/pci-dma.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/parisc/kernel/pci-dma.c	2005-07-05 11:17:45.999904208 +0200
@@ -333,18 +333,28 @@ pcxl_free_range(unsigned long vaddr, siz
 static int __init
 pcxl_dma_init(void)
 {
-    if (pcxl_dma_start == 0)
-	return 0;
+	if (pcxl_dma_start == 0)
+		return 0;
 
-    spin_lock_init(&pcxl_res_lock);
-    pcxl_res_size = PCXL_DMA_MAP_SIZE >> (PAGE_SHIFT + 3);
-    pcxl_res_hint = 0;
-    pcxl_res_map = (char *)__get_free_pages(GFP_KERNEL,
+	spin_lock_init(&pcxl_res_lock);
+	pcxl_res_size = PCXL_DMA_MAP_SIZE >> (PAGE_SHIFT + 3);
+	pcxl_res_hint = 0;
+	pcxl_res_map = (char *)__get_free_pages(GFP_KERNEL,
 					    get_order(pcxl_res_size));
-    memset(pcxl_res_map, 0, pcxl_res_size);
-    proc_gsc_root = proc_mkdir("gsc", 0);
-    create_proc_info_entry("dino", 0, proc_gsc_root, pcxl_proc_info);
-    return 0;
+	memset(pcxl_res_map, 0, pcxl_res_size);
+	proc_gsc_root = proc_mkdir("gsc", 0);
+	if (!proc_gsc_root)
+    		printk(KERN_WARNING 
+			"pcxl_dma_init: Unable to create gsc /proc dir entry\n");
+	else {
+		struct proc_dir_entry* ent;
+		ent = create_proc_info_entry("dino", 0, 
+				proc_gsc_root, pcxl_proc_info);
+		if (!ent)
+			printk(KERN_WARNING 
+				"pci-dma.c: Unable to create dino /proc entry.\n");
+
+	return 0;
 }
 
 __initcall(pcxl_dma_init);

--

--===============74532843178385288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74532843178385288==--
