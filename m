From: Andi Drebes <lists-receive@programmierforen.de>
Date: Wed, 11 Oct 2006 16:11:21 +0000
Subject: [KJ] [PATCH] include/asm-i386/a.out.h: Comment correction
Message-Id: <200610111811.21503.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The header is protected against double inclusion. The comment at the end didn't match the preprocessor definition used at the top.

Signed-off-by: Andi Drebes <webmaster@programmierforen.de>

---
diff --git a/include/asm-i386/a.out.h b/include/asm-i386/a.out.h
index ab17bb8..7055799 100644
--- a/include/asm-i386/a.out.h
+++ b/include/asm-i386/a.out.h
@@ -23,4 +23,4 @@ #define STACK_TOP     TASK_SIZE

 #endif

-#endif /* __A_OUT_GNU_H__ */
+#endif /* __I386_A_OUT_H__ */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
