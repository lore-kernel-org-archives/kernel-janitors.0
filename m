From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:45 +0000
Subject: [KJ] [PATCH] 29/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214845.15055.50694.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_jensen.c b/arch/alpha/kernel/sys_jensen.c
index 4ac2b32..7987cde 100644
--- a/arch/alpha/kernel/sys_jensen.c
+++ b/arch/alpha/kernel/sys_jensen.c
@@ -135,8 +135,10 @@ jensen_device_interrupt(unsigned long ve
 
 	switch (vector) {
 	case 0x660:
-		printk("Whee.. NMI received. Probable hardware error\n");
-		printk("61=%02x, 461=%02x\n", inb(0x61), inb(0x461));
+		printk(KERN_ERR "%s: Whee.. NMI received. Probable hardware error\n",
+			__FUNCTION__);
+		printk(KERN_ERR "%s: 61=%02x, 461=%02x\n",
+			__FUNCTION__, inb(0x61), inb(0x461));
 		return;
 
 	/* local device interrupts: */
@@ -147,7 +149,7 @@ jensen_device_interrupt(unsigned long ve
 
 	default:
 		if (vector > 0x900) {
-			printk("Unknown local interrupt %lx\n", vector);
+			printk(KERN_ERR "Unknown local interrupt %lx\n", vector);
 			return;
 		}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
