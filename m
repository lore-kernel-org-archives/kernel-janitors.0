From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sun, 04 Apr 2004 03:16:00 +0000
Subject: [Kernel-janitors] [PATCH 3/5] remove concatenation with
Message-Id: <1081048590.1820@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

diff -X dontdiff -purN 2.6.5-rc3.clean/include/linux/jbd.h 2.6.5-rc3.kj_func/include/linux/jbd.h
--- 2.6.5-rc3.clean/include/linux/jbd.h	2004-01-16 21:07:50.000000000 +1100
+++ 2.6.5-rc3.kj_func/include/linux/jbd.h	2004-04-04 12:36:11.000000000 +1000
@@ -1001,10 +1001,10 @@ extern int	cleanup_journal_tail(journal_
 /* Debugging code only: */
 
 #define jbd_ENOSYS() \
-do {								      \
-	printk (KERN_ERR "JBD unimplemented function " __FUNCTION__); \
-	current->state = TASK_UNINTERRUPTIBLE;			      \
-	schedule();						      \
+do {								           \
+	printk (KERN_ERR "JBD unimplemented function %s\n", __FUNCTION__); \
+	current->state = TASK_UNINTERRUPTIBLE;			           \
+	schedule();						           \
 } while (1)
 
 /*

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
