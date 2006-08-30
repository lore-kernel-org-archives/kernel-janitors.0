From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:47:42 +0000
Subject: [KJ] [PATCH] 20/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214742.15055.94539.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index 0cd0605..48c3bb1 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -239,7 +239,7 @@ ptrace_cancel_bpt(struct task_struct * c
 	task_thread_info(child)->bpt_nsaved = 0;
 
 	if (nsaved > 2) {
-		printk("ptrace_cancel_bpt: bogus nsaved: %d!\n", nsaved);
+		printk(KERN_ERR "ptrace_cancel_bpt: bogus nsaved: %d!\n", nsaved);
 		nsaved = 2;
 	}
 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
