From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sat, 27 Mar 2004 05:12:54 +0000
Subject: [Kernel-janitors] [PATCH 0/5] remove concatenation with
Message-Id: <20040327051254.GE3445@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


--------------------------------------------------------------------------------
diff -X dontdiff -purN 2.6.4.clean/include/linux/jbd.h 2.6.4.kj_func/include/linux/jbd.h
--- 2.6.4.clean/include/linux/jbd.h	2004-01-16 21:07:50.000000000 +1100
+++ 2.6.4.kj_func/include/linux/jbd.h	2004-03-26 14:46:34.000000000 +1100
@@ -56,7 +56,7 @@ extern int journal_enable_debug;
 		if ((n) <= journal_enable_debug) {			\
 			printk (KERN_DEBUG "(%s, %d): %s: ",		\
 				__FILE__, __LINE__, __FUNCTION__);	\
-		  	printk (f, ## a);				\
+		  	printk (f , ## a);				\
 		}							\
 	} while (0)
 #else
@@ -279,9 +279,9 @@ void buffer_assertion_failure(struct buf
 			printk(KERN_ERR why);				     \
 		}							     \
 	} while (0)
-#define J_EXPECT(expr, why...)		__journal_expect(expr, ## why)
-#define J_EXPECT_BH(bh, expr, why...)	__journal_expect(expr, ## why)
-#define J_EXPECT_JH(jh, expr, why...)	__journal_expect(expr, ## why)
+#define J_EXPECT(expr, why...)		__journal_expect(expr , ## why)
+#define J_EXPECT_BH(bh, expr, why...)	__journal_expect(expr , ## why)
+#define J_EXPECT_JH(jh, expr, why...)	__journal_expect(expr , ## why)
 #endif
 
 enum jbd_state_bits {
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
--------------------------------------------------------------------------------
Yours Tony

        linux.conf.au       http://lca2005.linux.org.au/
	Apr 18-23 2005      The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
