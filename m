From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Mon, 08 May 2006 05:48:58 +0000
Subject: [KJ] [PATCH] linux-2.6.17-rc3-git13 fs/proc/array.c
Message-Id: <445EDBCA.9080702@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

do_task_stat() was using too much stack
from make checkstack:
0x080eae08 do_task_stat:                                1752

So I took almost all the variables used in the function and made a new 
structure do_task_stat_vars, and dynamically allocated it in the function.
This is supposed to be a quick hack, and hopefully the authors will 
really do something about it.

Signed off by: Anne Thrax <foobarfoobarfoobar@gmail.com>

--- linux-2.6.17-rc3-git13/fs/proc/array.c      2006-05-07 
23:01:50.000000000 -0400
+++ linux-uml/fs/proc/array.c   2006-05-08 01:31:12.000000000 -0400
@@ -316,7 +316,7 @@

  static int do_task_stat(struct task_struct *task, char * buffer, int 
whole)
  {
-       unsigned long vsize, eip, esp, wchan = ~0UL;
+       /* unsigned long vsize, eip, esp, wchan = ~0UL;
         long priority, nice;
         int tty_pgrp = -1, tty_nr = 0;
         sigset_t sigign, sigcatch;
@@ -332,35 +332,49 @@
         unsigned long rsslim = 0;
         struct task_struct *t;
         char tcomm[sizeof(task->comm)];
+       */
+       struct do_task_stat_vars *vars;
+       vars = kmalloc(sizeof(struct do_task_stat_vars), GFP_KERNEL);
+       vars->vsize = vars->eip = vars->esp = vars->wchan = ~0UL;
+       vars->tty_pgrp = -1;
+       vars->tty_nr = 0;
+       vars->pgid = -1;
+       vars->sid = -1;
+       vars->num_threads = 0;
+       vars->cmin_flt = vars->cmaj_flt = vars->min_flt = vars->maj_flt 
= vars->rsslim = 0;
+       struct mm_struct *mm;
+       struct task_struct *t;
+       char tcomm[sizeof(task->comm)];
+       char state;

         state = *get_task_state(task);
-       vsize = eip = esp = 0;
+       vars->vsize = vars->eip = vars->esp = 0;
         mm = get_task_mm(task);
         if (mm) {
-               vsize = task_vsize(mm);
-               eip = KSTK_EIP(task);
-               esp = KSTK_ESP(task);
+               vars->vsize = task_vsize(mm);
+               vars->eip = KSTK_EIP(task);
+               vars->esp = KSTK_ESP(task);
         }

         get_task_comm(tcomm, task);

-       sigemptyset(&sigign);
-       sigemptyset(&sigcatch);
-       cutime = cstime = utime = stime = cputime_zero;
+       sigemptyset(&vars->sigign);
+       sigemptyset(&vars->sigcatch);
+       vars->cutime = vars->cstime = vars->utime = vars->stime = 
cputime_zero;
         read_lock(&tasklist_lock);
         if (task->sighand) {
                 spin_lock_irq(&task->sighand->siglock);
-               num_threads = atomic_read(&task->signal->count);
-               collect_sigign_sigcatch(task, &sigign, &sigcatch);
+               vars->num_threads = atomic_read(&task->signal->count);
+               collect_sigign_sigcatch(task, &vars->sigign, 
&vars->sigcatch);

                 /* add up live thread stats at the group level */
                 if (whole) {
                         t = task;
                         do {
-                               min_flt += t->min_flt;
-                               maj_flt += t->maj_flt;
-                               utime = cputime_add(utime, t->utime);
-                               stime = cputime_add(stime, t->stime);
+                               vars->min_flt += t->min_flt;
+                               vars->maj_flt += t->maj_flt;
+                               vars->utime = cputime_add(vars->utime, 
t->utime);
+                               vars->stime = cputime_add(vars->stime, 
t->stime);
                                 t = next_thread(t);
                         } while (t != task);
                 }
@@ -369,88 +383,88 @@
         }
         if (task->signal) {
                 if (task->signal->tty) {
-                       tty_pgrp = task->signal->tty->pgrp;
-                       tty_nr = 
new_encode_dev(tty_devnum(task->signal->tty));
+                       vars->tty_pgrp = task->signal->tty->pgrp;
+                       vars->tty_nr = 
new_encode_dev(tty_devnum(task->signal->tty));
                 }
-               pgid = process_group(task);
-               sid = task->signal->session;
-               cmin_flt = task->signal->cmin_flt;
-               cmaj_flt = task->signal->cmaj_flt;
-               cutime = task->signal->cutime;
-               cstime = task->signal->cstime;
-               rsslim = task->signal->rlim[RLIMIT_RSS].rlim_cur;
+               vars->pgid = process_group(task);
+               vars->sid = task->signal->session;
+               vars->cmin_flt = task->signal->cmin_flt;
+               vars->cmaj_flt = task->signal->cmaj_flt;
+               vars->cutime = task->signal->cutime;
+               vars->cstime = task->signal->cstime;
+               vars->rsslim = task->signal->rlim[RLIMIT_RSS].rlim_cur;
                 if (whole) {
-                       min_flt += task->signal->min_flt;
-                       maj_flt += task->signal->maj_flt;
-                       utime = cputime_add(utime, task->signal->utime);
-                       stime = cputime_add(stime, task->signal->stime);
+                       vars->min_flt += task->signal->min_flt;
+                       vars->maj_flt += task->signal->maj_flt;
+                       vars->utime = cputime_add(vars->utime, 
task->signal->utime);
+                       vars->stime = cputime_add(vars->stime, 
task->signal->stime);
                 }
         }
-       ppid = pid_alive(task) ? task->group_leader->real_parent->tgid : 0;
+       vars->ppid = pid_alive(task) ? 
task->group_leader->real_parent->tgid : 0;
         read_unlock(&tasklist_lock);

-       if (!whole || num_threads<2)
-               wchan = get_wchan(task);
+       if (!whole || vars->num_threads<2)
+               vars->wchan = get_wchan(task);
         if (!whole) {
-               min_flt = task->min_flt;
-               maj_flt = task->maj_flt;
-               utime = task->utime;
-               stime = task->stime;
+               vars->min_flt = task->min_flt;
+               vars->maj_flt = task->maj_flt;
+               vars->utime = task->utime;
+               vars->stime = task->stime;
         }

         /* scale priority and nice values from timeslices to -20..20 */
         /* to make it look like a "normal" Unix priority/nice value  */
-       priority = task_prio(task);
-       nice = task_nice(task);
+       vars->priority = task_prio(task);
+       vars->nice = task_nice(task);

         /* Temporary variable needed for gcc-2.96 */
         /* convert timespec -> nsec*/
-       start_time = (unsigned long long)task->start_time.tv_sec * 
NSEC_PER_SEC
+       vars->start_time = (unsigned long long)task->start_time.tv_sec * 
NSEC_PER_SEC
                                 + task->start_time.tv_nsec;
         /* convert nsec -> ticks */
-       start_time = nsec_to_clock_t(start_time);
+       vars->start_time = nsec_to_clock_t(vars->start_time);

-       res = sprintf(buffer,"%d (%s) %c %d %d %d %d %d %lu %lu \
+       vars->res = sprintf(buffer,"%d (%s) %c %d %d %d %d %d %lu %lu \
  %lu %lu %lu %lu %lu %ld %ld %ld %ld %d 0 %llu %lu %ld %lu %lu %lu %lu 
%lu \
  %lu %lu %lu %lu %lu %lu %lu %lu %d %d %lu %lu\n",
                 task->pid,
                 tcomm,
                 state,
-               ppid,
-               pgid,
-               sid,
-               tty_nr,
-               tty_pgrp,
+               vars->ppid,
+               vars->pgid,
+               vars->sid,
+               vars->tty_nr,
+               vars->tty_pgrp,
                 task->flags,
-               min_flt,
-               cmin_flt,
-               maj_flt,
-               cmaj_flt,
-               cputime_to_clock_t(utime),
-               cputime_to_clock_t(stime),
-               cputime_to_clock_t(cutime),
-               cputime_to_clock_t(cstime),
-               priority,
-               nice,
-               num_threads,
-               start_time,
-               vsize,
+               vars->min_flt,
+               vars->cmin_flt,
+               vars->maj_flt,
+               vars->cmaj_flt,
+               cputime_to_clock_t(vars->utime),
+               cputime_to_clock_t(vars->stime),
+               cputime_to_clock_t(vars->cutime),
+               cputime_to_clock_t(vars->cstime),
+               vars->priority,
+               vars->nice,
+               vars->num_threads,
+               vars->start_time,
+               vars->vsize,
                 mm ? get_mm_rss(mm) : 0,
-               rsslim,
+               vars->rsslim,
                 mm ? mm->start_code : 0,
                 mm ? mm->end_code : 0,
                 mm ? mm->start_stack : 0,
-               esp,
-               eip,
+               vars->esp,
+               vars->eip,
                 /* The signal information here is obsolete.
                  * It must be decimal for Linux 2.0 compatibility.
                  * Use /proc/#/status for real-time signals.
                  */
                 task->pending.signal.sig[0] & 0x7fffffffUL,
                 task->blocked.sig[0] & 0x7fffffffUL,
-               sigign      .sig[0] & 0x7fffffffUL,
-               sigcatch    .sig[0] & 0x7fffffffUL,
-               wchan,
+               vars->sigign      .sig[0] & 0x7fffffffUL,
+               vars->sigcatch    .sig[0] & 0x7fffffffUL,
+               vars->wchan,
                 0UL,
                 0UL,
                 task->exit_signal,
@@ -459,6 +473,9 @@
                 task->policy);
         if(mm)
                 mmput(mm);
+
+       int res = vars->res;
+       kfree(vars);
         return res;
  }

--- linux-2.6.17-rc3-git13/include/linux/proc_fs.h      2006-05-07 
23:01:54.000000000 -0400
+++ linux-uml/include/linux/proc_fs.h   2006-05-08 01:26:54.000000000 -0400
@@ -83,6 +83,25 @@
         loff_t offset;
  };

+/* do_task_stat() from fs/proc/array.c uses *WAY* too much stack
+ * I'll just make a struct containing all the variables in there
+ * and dynamicaly allocate it
+ * this is a quick hack, and someone should probably really do
+ * something about it
+ */
+
+struct do_task_stat_vars {
+       unsigned long vsize, eip, esp, wchan, cmin_flt, cmaj_flt,
+       min_flt, maj_flt, rsslim;
+       unsigned long long start_time;
+       long priority, nice;
+       int tty_pgrp, tty_nr, res, num_threads;
+       pid_t ppid, pgid, sid;
+       sigset_t sigign, sigcatch;
+       cputime_t cutime, cstime, utime, stime;
+};
+
+
  #ifdef CONFIG_PROC_FS

  extern struct proc_dir_entry proc_root;
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
