From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 02 Mar 2012 21:56:31 +0000
Subject: [PATCH] arch: x86: kernel: kprobes: functions with definition should not be declared extern
Message-Id: <1330725391-9439-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

sparse warns:
arch/x86/kernel/kprobes.c:1489:13: warning: function 'arch_unoptimize_kprobes' with external linkage has definition

This is my first patch which is why I'm sending it here first to see if I'm doing something wrong.
Any advice is greatly appreciated.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 arch/x86/kernel/kprobes.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/kprobes.c b/arch/x86/kernel/kprobes.c
index 7da647d..f55c28e 100644
--- a/arch/x86/kernel/kprobes.c
+++ b/arch/x86/kernel/kprobes.c
@@ -1486,8 +1486,8 @@ static void __kprobes setup_unoptimize_kprobe(struct text_poke_param *tprm,
  * Recover original instructions and breakpoints from relative jumps.
  * Caller must call with locking kprobe_mutex.
  */
-extern void arch_unoptimize_kprobes(struct list_head *oplist,
-				    struct list_head *done_list)
+void arch_unoptimize_kprobes(struct list_head *oplist,
+			     struct list_head *done_list)
 {
 	struct optimized_kprobe *op, *tmp;
 	int c = 0;
-- 
1.7.9.1

