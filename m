From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 Jan 2012 10:52:46 +0000
Subject: [patch] x86, dumpstack: removed unneeded check in dump_trace()
Message-Id: <20120128105246.GA25092@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Frederic Weisbecker <fweisbec@gmail.com>, Namhyung Kim <namhyung@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Clemens Ladisch <clemens@ladisch.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that we have some inconsistent NULL checking.  If
"task" were NULL then it would lead to a NULL dereference later.  We
can remove this test because earlier on in the function we have:
	if (!task)
		task = current;

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/dumpstack_64.c b/arch/x86/kernel/dumpstack_64.c
index 6d728d9..af7785f 100644
--- a/arch/x86/kernel/dumpstack_64.c
+++ b/arch/x86/kernel/dumpstack_64.c
@@ -129,7 +129,7 @@ void dump_trace(struct task_struct *task, struct pt_regs *regs,
 	if (!stack) {
 		if (regs)
 			stack = (unsigned long *)regs->sp;
-		else if (task && task != current)
+		else if (task != current)
 			stack = (unsigned long *)task->thread.sp;
 		else
 			stack = &dummy;
