From: "Cong WANG" <xiyou.wangcong@gmail.com>
Date: Sat, 31 Mar 2007 11:38:30 +0000
Subject: [KJ] [-mm3 Patch]Warning fix: may be used uninitialized
Message-Id: <2375c9f90703310438m4c1c6922ic1fcef910140dd79@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These values are used to be written first, so we can just initialize
them to NULL or 0.

Signed-off-by: Cong WANG <xiyou.wangcong@gmail.com>

---

--- kernel/ptrace.c.orig	2007-03-30 21:58:47.000000000 +0800
+++ kernel/ptrace.c	2007-03-30 22:00:55.000000000 +0800
@@ -875,9 +875,9 @@ ptrace_common(long request, struct task_

 asmlinkage long sys_ptrace(long request, long pid, long addr, long data)
 {
-	struct task_struct *child;
-	struct utrace_attached_engine *engine;
-	struct ptrace_state *state;
+	struct task_struct *child = NULL;
+	struct utrace_attached_engine *engine = NULL;
+	struct ptrace_state *state = NULL;
 	long ret, val;

 	pr_debug("%d sys_ptrace(%ld, %ld, %lx, %lx)\n",
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
