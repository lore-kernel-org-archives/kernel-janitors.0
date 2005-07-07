From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:47 +0000
Subject: [KJ] [patch 2.6.13-rc1 13/23] Audit return code of create_proc_*
Message-Id: <20050707154617.229835000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97549926720191182=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97549926720191182==
Content-Disposition: inline;
	filename=proc_create_arch_sh_drivers_dma_dma-api.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/arch/sh/drivers/dma/dma-api.c 2.6.13-rc1/arch/sh/drivers/dma/dma-api.c
--- 2.6.13-rc1.orig/arch/sh/drivers/dma/dma-api.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/arch/sh/drivers/dma/dma-api.c	2005-07-05 10:21:34.485452312 +0200
@@ -265,10 +265,13 @@ void __exit unregister_dmac(struct dma_i
 
 static int __init dma_api_init(void)
 {
-	printk("DMA: Registering DMA API.\n");
+	struct proc_dir_entry* ent;
+	printk(KERN_INFO "DMA: Registering DMA API.\n");
 
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("dma", 0, 0, dma_read_proc, 0);
+	ent = create_proc_read_entry("dma", 0, 0, dma_read_proc, 0);
+	if (!ent)
+		printk(KERN_WARNING "dma: Unable to create /proc entry.\n");
 #endif
 
 	return 0;

--

--===============97549926720191182==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97549926720191182==--
