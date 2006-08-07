From: tom_hisch@gmx.at
Date: Mon, 07 Aug 2006 10:50:37 +0000
Subject: [KJ] [PATCH] Use kzalloc
Message-Id: <1154947837363-git-send-email-tom_hisch@gmx.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11546380282929-git-send-email-tom_hisch@gmx.at>
In-Reply-To: <11546380282929-git-send-email-tom_hisch@gmx.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Thomas Hisch <t.hisch@gmail.com>

Replace kzalloc instead of kmalloc + memset.

Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
---
 include/asm-i386/thread_info.h |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/include/asm-i386/thread_info.h b/include/asm-i386/thread_info.h
index 54d6d7a..46d32ad 100644
--- a/include/asm-i386/thread_info.h
+++ b/include/asm-i386/thread_info.h
@@ -95,15 +95,7 @@ static inline struct thread_info *curren
 
 /* thread information allocation */
 #ifdef CONFIG_DEBUG_STACK_USAGE
-#define alloc_thread_info(tsk)					\
-	({							\
-		struct thread_info *ret;			\
-								\
-		ret = kmalloc(THREAD_SIZE, GFP_KERNEL);		\
-		if (ret)					\
-			memset(ret, 0, THREAD_SIZE);		\
-		ret;						\
-	})
+#define alloc_thread_info(tsk) kzalloc(THREAD_SIZE, GFP_KERNEL)
 #else
 #define alloc_thread_info(tsk) kmalloc(THREAD_SIZE, GFP_KERNEL)
 #endif
-- 
1.4.2.rc1.gf25b-dirty



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
