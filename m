From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:38 +0000
Subject: [KJ] [PATCH] 28/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214838.15055.20538.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_eb64p.c b/arch/alpha/kernel/sys_eb64p.c
index ed108b6..0ad63e6 100644
--- a/arch/alpha/kernel/sys_eb64p.c
+++ b/arch/alpha/kernel/sys_eb64p.c
@@ -118,7 +118,7 @@ #if defined(CONFIG_ALPHA_GENERIC) || def
 	if (inw(0x806) != 0xffff) {
 		extern struct alpha_machine_vector cabriolet_mv;
 
-		printk("Detected Cabriolet: correcting HWRPB.\n");
+		pr_info("Detected Cabriolet: correcting HWRPB.\n");
 
 		hwrpb->sys_variation |= 2L << 10;
 		hwrpb_update_checksum(hwrpb);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
