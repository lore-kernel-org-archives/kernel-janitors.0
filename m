From: rodrigosiqueira <rodrigosiqueiramelo@gmail.com>
Date: Fri, 15 Dec 2017 13:15:33 +0000
Subject: [PATCH] x86: Remove unused parameter of prepare_switch_to
Message-Id: <20171215131533.hp6kqebw45o7uvsb@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Commit e37e43a497d5 ("x86/mm/64: Enable vmapped stacks
(CONFIG_HAVE_ARCH_VMAP_STACK=y)") added prepare_switch_to with one extra
parameter which is not used by the function, remove it.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 arch/x86/include/asm/switch_to.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/switch_to.h b/arch/x86/include/asm/switch_to.h
index 8c6bd6863db9..1008d4622709 100644
--- a/arch/x86/include/asm/switch_to.h
+++ b/arch/x86/include/asm/switch_to.h
@@ -16,8 +16,7 @@ void __switch_to_xtra(struct task_struct *prev_p, struct task_struct *next_p,
 		      struct tss_struct *tss);
 
 /* This runs runs on the previous thread's stack. */
-static inline void prepare_switch_to(struct task_struct *prev,
-				     struct task_struct *next)
+static inline void prepare_switch_to(struct task_struct *next)
 {
 #ifdef CONFIG_VMAP_STACK
 	/*
@@ -70,7 +69,7 @@ struct fork_frame {
 
 #define switch_to(prev, next, last)					\
 do {									\
-	prepare_switch_to(prev, next);					\
+	prepare_switch_to(next);					\
 									\
 	((last) = __switch_to_asm((prev), (next)));			\
 } while (0)
-- 
2.15.1

