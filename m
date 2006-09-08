From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 02:03:21 +0000
Subject: [KJ] [PATCH 62/72] arm: add KERN_ constants to
Message-Id: <20060908020321.10114.88889.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/nwfpe/fpa11.c b/arch/arm/nwfpe/fpa11.c
index cc60acd..4fbb4ee 100644
--- a/arch/arm/nwfpe/fpa11.c
+++ b/arch/arm/nwfpe/fpa11.c
@@ -87,7 +87,7 @@ void nwfpe_init_fpa(union fp_state *fp)
 {
 	FPA11 *fpa11 = (FPA11 *)fp;
 #ifdef NWFPE_DEBUG
-	printk("NWFPE: setting up state.\n");
+	pr_info("NWFPE: setting up state.\n");
 #endif
  	memset(fpa11, 0, sizeof(FPA11));
 	resetFPA11();
@@ -100,7 +100,7 @@ unsigned int EmulateAll(unsigned int opc
 	unsigned int code;
 
 #ifdef NWFPE_DEBUG
-	printk("NWFPE: emulating opcode %08x\n", opcode);
+	pr_info("NWFPE: emulating opcode %08x\n", opcode);
 #endif
 	code = opcode & 0x00000f00;
 	if (code = 0x00000100 || code = 0x00000200) {
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
