From: Domen Puncer <domen@coderock.org>
Date: Thu, 18 Nov 2004 13:54:21 +0000
Subject: [KJ] [patch] kernel/sched.c: fix subtle TASK_RUNNING compare
Message-Id: <20041118135420.GB5645@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3062864718163727=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3062864718163727==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

This test was depending on TASK_RUNNING being defined as 0.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/kernel/sched.c	2004-11-15 13:42:20.000000000 +0100
+++ a/kernel/sched.c	2004-11-18 14:47:23.000000000 +0100
@@ -2576,7 +2576,8 @@ need_resched_nonpreemptible:
 	 * to picking the next task.
 	 */
 	switch_count = &prev->nivcsw;
-	if (prev->state && !(preempt_count() & PREEMPT_ACTIVE)) {
+	if (prev->state != TASK_RUNNING &&
+			!(preempt_count() & PREEMPT_ACTIVE)) {
 		switch_count = &prev->nvcsw;
 		if (unlikely((prev->state & TASK_INTERRUPTIBLE) &&
 				unlikely(signal_pending(prev))))

--===============3062864718163727==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3062864718163727==--
