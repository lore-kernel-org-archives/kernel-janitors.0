From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 03 Aug 2005 15:34:19 +0000
Subject: [KJ] [PATCH] sh : Clean up prink calls
Message-Id: <20050803153419.GL12040@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64800845423513054=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64800845423513054==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.13-rc4-mm1/arch/sh/drivers/dma/dma-api.c
===================================================================
--- linux-2.6.13-rc4-mm1.orig/arch/sh/drivers/dma/dma-api.c
+++ linux-2.6.13-rc4-mm1/arch/sh/drivers/dma/dma-api.c
@@ -265,7 +265,7 @@ void __exit unregister_dmac(struct dma_i
 
 static int __init dma_api_init(void)
 {
-	printk("DMA: Registering DMA API.\n");
+	printk(KERN_INFO "DMA: Registering DMA API.\n");
 
 #ifdef CONFIG_PROC_FS
 	create_proc_read_entry("dma", 0, 0, dma_read_proc, 0);

--===============64800845423513054==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64800845423513054==--
