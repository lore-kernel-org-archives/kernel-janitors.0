From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Date: Wed, 26 Jan 2005 03:09:16 +0000
Subject: [KJ] Re: MIPS still uses sleep_on*()
Message-Id: <20050126.120916.88699500.nemoto@toshiba-tops.co.jp>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56682116732274901=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125214701.GA2689@us.ibm.com>
In-Reply-To: <20050125214701.GA2689@us.ibm.com>
To: nacc@us.ibm.com
Cc: ralf@linux-mips.org, linux-mips@linux-mips.org, kernel-janitors@lists.osdl.org

--===============56682116732274901==
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

>>>>> On Tue, 25 Jan 2005 13:47:01 -0800, Nishanth Aravamudan <nacc@us.ibm.com> said:
nacc> The only file I'm not comfortable with changing myself (since I
nacc> am not a MIPS user/expert) is arch/mips/kernel/process.c. This
nacc> file references sleep_on(), sleep_on_timeout(),
nacc> interruptible_sleep_on() and interruptible_sleep_on_timeout().

Those references are just to implement get_wchan.  And anyway current
MIPS get_wchan is broken for a long time.

I suppose searching a caller of scheduling functions is not necessary.
Calling thread_saved_pc() will be enough for most usage.

Ralf, how about this patch?

diff -u linux-mips/arch/mips/kernel/process.c linux/arch/mips/kernel/process.c
--- linux-mips/arch/mips/kernel/process.c	2005-01-11 10:00:07.000000000 +0900
+++ linux/arch/mips/kernel/process.c	2005-01-26 10:23:21.000000000 +0900
@@ -186,11 +186,6 @@
 	int pc_offset;
 };
 static struct mips_frame_info schedule_frame;
-static struct mips_frame_info schedule_timeout_frame;
-static struct mips_frame_info sleep_on_frame;
-static struct mips_frame_info sleep_on_timeout_frame;
-static struct mips_frame_info wait_for_completion_frame;
-static int mips_frame_info_initialized;
 static int __init get_frame_info(struct mips_frame_info *info, void *func)
 {
 	int i;
@@ -242,14 +237,7 @@
 
 static int __init frame_info_init(void)
 {
-	mips_frame_info_initialized =
-		!get_frame_info(&schedule_frame, schedule) &&
-		!get_frame_info(&schedule_timeout_frame, schedule_timeout) &&
-		!get_frame_info(&sleep_on_frame, sleep_on) &&
-		!get_frame_info(&sleep_on_timeout_frame, sleep_on_timeout) &&
-		!get_frame_info(&wait_for_completion_frame, wait_for_completion);
-
-	return 0;
+	return get_frame_info(&schedule_frame, schedule);
 }
 
 arch_initcall(frame_info_init);
@@ -270,59 +258,14 @@
 	return ((unsigned long *)t->reg29)[schedule_frame.pc_offset];
 }
 
-/* get_wchan - a maintenance nightmare^W^Wpain in the ass ...  */
 unsigned long get_wchan(struct task_struct *p)
 {
-	unsigned long frame, pc;
+	unsigned long pc;
 
 	if (!p || p == current || p->state == TASK_RUNNING)
 		return 0;
 
-	if (!mips_frame_info_initialized)
-		return 0;
 	pc = thread_saved_pc(p);
-	if (!in_sched_functions(pc))
-		goto out;
-
-	if (pc >= (unsigned long) sleep_on_timeout)
-		goto schedule_timeout_caller;
-	if (pc >= (unsigned long) sleep_on)
-		goto schedule_caller;
-	if (pc >= (unsigned long) interruptible_sleep_on_timeout)
-		goto schedule_timeout_caller;
-	if (pc >= (unsigned long)interruptible_sleep_on)
-		goto schedule_caller;
-	if (pc >= (unsigned long)wait_for_completion)
-		goto schedule_caller;
-	goto schedule_timeout_caller;
-
-schedule_caller:
-	frame = ((unsigned long *)p->thread.reg30)[schedule_frame.frame_offset];
-	if (pc >= (unsigned long) sleep_on)
-		pc = ((unsigned long *)frame)[sleep_on_frame.pc_offset];
-	else
-		pc = ((unsigned long *)frame)[wait_for_completion_frame.pc_offset];
-	goto out;
-
-schedule_timeout_caller:
-	/*
-	 * The schedule_timeout frame
-	 */
-	frame = ((unsigned long *)p->thread.reg30)[schedule_frame.frame_offset];
-
-	/*
-	 * frame now points to sleep_on_timeout's frame
-	 */
-	pc    = ((unsigned long *)frame)[schedule_timeout_frame.pc_offset];
-
-	if (in_sched_functions(pc)) {
-		/* schedule_timeout called by [interruptible_]sleep_on_timeout */
-		frame = ((unsigned long *)frame)[schedule_timeout_frame.frame_offset];
-		pc    = ((unsigned long *)frame)[sleep_on_timeout_frame.pc_offset];
-	}
-
-out:
-
 #ifdef CONFIG_MIPS64
 	if (current->thread.mflags & MF_32BIT_REGS) /* Kludge for 32-bit ps  */
 		pc &= 0xffffffffUL;

--===============56682116732274901==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56682116732274901==--
