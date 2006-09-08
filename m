From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:00:06 +0000
Subject: [KJ] [PATCH 33/72] arm: add KERN_ constants to
Message-Id: <20060908020006.10114.88467.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-rpc/dma.c b/arch/arm/mach-rpc/dma.c
index ac511d4..fdfab5a 100644
--- a/arch/arm/mach-rpc/dma.c
+++ b/arch/arm/mach-rpc/dma.c
@@ -260,7 +260,7 @@ static void floppy_enable_dma(dmach_t ch
 	regs.ARM_fp  = (unsigned long)FLOPPYDMA_BASE;
 
 	if (claim_fiq(&fh)) {
-		printk("floppydma: couldn't claim FIQ.\n");
+		pr_info("floppydma: couldn't claim FIQ\n");
 		return;
 	}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
