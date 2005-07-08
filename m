From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 13:30:21 +0000
Subject: [KJ] [patch 2.6.13-rc1 13/23][RESEND] Audit return code of
Message-Id: <20050708133021.GU4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76016206121324725=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76016206121324725==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

Index: 2.6.13-rc1/arch/sh/drivers/dma/dma-api.c
===================================================================
--- 2.6.13-rc1.orig/arch/sh/drivers/dma/dma-api.c
+++ 2.6.13-rc1/arch/sh/drivers/dma/dma-api.c
@@ -265,10 +265,13 @@ void __exit unregister_dmac(struct dma_i
 
 static int __init dma_api_init(void)
 {
-	printk("DMA: Registering DMA API.\n");
+	struct proc_dir_entry *ent;
+	printk(KERN_INFO "DMA: Registering DMA API.\n");
 
 #ifdef CONFIG_PROC_FS
-	create_proc_read_entry("dma", 0, 0, dma_read_proc, 0);
+	ent = create_proc_read_entry("dma", 0, 0, dma_read_proc, 0);
+	if (!ent)
+		printk(KERN_WARNING "dma: Unable to create /proc entry.\n");
 #endif
 
 	return 0;

--===============76016206121324725==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76016206121324725==--
