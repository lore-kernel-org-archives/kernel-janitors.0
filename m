From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 02:46:06 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - sched.h - compiler cleanups
Message-Id: <200402122146.06010.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_upDLAWLEdHeH7bK"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_upDLAWLEdHeH7bK
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates some "parameter defined but not used" warnings from 
sched.h.

Probably useless but I like clean compiles!  :)

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_upDLAWLEdHeH7bK
Content-Type: text/x-diff;
  charset="us-ascii";
  name="sched.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="sched.h.diff"

--- linux-2.6.2.orig/include/linux/sched.h	2004-02-03 22:43:10.000000000 -0500
+++ linux-2.6.2/include/linux/sched.h	2004-02-12 21:14:09.000000000 -0500
@@ -505,6 +505,8 @@
 #else
 static inline int set_cpus_allowed(task_t *p, cpumask_t new_mask)
 {
+	p = p;
+	new_mask = new_mask;
 	return 0;
 }
 #endif
@@ -576,7 +578,7 @@
 #ifdef CONFIG_SMP
  extern void FASTCALL(kick_process(struct task_struct * tsk));
 #else
- static inline void kick_process(struct task_struct *tsk) { }
+ static inline void kick_process(struct task_struct *tsk) { tsk = tsk; }
 #endif
 extern void FASTCALL(wake_up_forked_process(struct task_struct * tsk));
 extern void FASTCALL(sched_fork(task_t * p));
@@ -897,11 +899,14 @@
 
 static inline unsigned int task_cpu(struct task_struct *p)
 {
+	p = p;
 	return 0;
 }
 
 static inline void set_task_cpu(struct task_struct *p, unsigned int cpu)
 {
+	p = p;
+	cpu = cpu;
 }
 
 #endif /* CONFIG_SMP */

--Boundary-00=_upDLAWLEdHeH7bK
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_upDLAWLEdHeH7bK--
