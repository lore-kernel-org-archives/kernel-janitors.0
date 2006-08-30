From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:02 +0000
Subject: [KJ] [PATCH] 23/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214802.15055.29508.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/signal.c b/arch/alpha/kernel/signal.c
index 741da09..3c888d9 100644
--- a/arch/alpha/kernel/signal.c
+++ b/arch/alpha/kernel/signal.c
@@ -478,7 +478,7 @@ setup_frame(int sig, struct k_sigaction 
 	wrusp((unsigned long) frame);
 	
 #if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
+	printk(KERN_DEBUG "SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
 		current->comm, current->pid, frame, regs->pc, regs->r26);
 #endif
 
@@ -540,7 +540,7 @@ setup_rt_frame(int sig, struct k_sigacti
 	wrusp((unsigned long) frame);
 
 #if DEBUG_SIG
-	printk("SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
+	printk(KERN_DEBUG "SIG deliver (%s:%d): sp=%p pc=%p ra=%p\n",
 		current->comm, current->pid, frame, regs->pc, regs->r26);
 #endif
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
