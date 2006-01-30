From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 30 Jan 2006 21:15:51 +0000
Subject: [KJ] [Patch 5/6] BUG_ON() Conversion in kernel/signal.c
Message-Id: <1138655751.4007.14.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40255435218339963=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40255435218339963==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/kernel/signal.c.orig	2006-01-30 22:14:15.000000000 +0100
+++ linux-2.6.16-rc1-git4/kernel/signal.c	2006-01-30 22:14:54.000000000 +0100
@@ -355,10 +355,8 @@ void __exit_signal(struct task_struct *t
 	struct signal_struct * sig = tsk->signal;
 	struct sighand_struct * sighand;
 
-	if (!sig)
-		BUG();
-	if (!atomic_read(&sig->count))
-		BUG();
+	BUG_ON(!sig);
+	BUG_ON(!atomic_read(&sig->count));
 	rcu_read_lock();
 	sighand = rcu_dereference(tsk->sighand);
 	spin_lock(&sighand->siglock);
@@ -875,8 +873,7 @@ specific_send_sig_info(int sig, struct s
 {
 	int ret = 0;
 
-	if (!irqs_disabled())
-		BUG();
+	BUG_ON(!irqs_disabled());
 	assert_spin_locked(&t->sighand->siglock);
 
 	/* Short-circuit ignored signals.  */
@@ -1464,8 +1461,7 @@ retry:
 		 * If an SI_TIMER entry is already queue just increment
 		 * the overrun count.
 		 */
-		if (q->info.si_code != SI_TIMER)
-			BUG();
+		BUG_ON(q->info.si_code != SI_TIMER);
 		q->info.si_overrun++;
 		goto out;
 	}
@@ -1513,8 +1509,7 @@ send_group_sigqueue(int sig, struct sigq
 		 * the overrun count.  Other uses should not try to
 		 * send the signal multiple times.
 		 */
-		if (q->info.si_code != SI_TIMER)
-			BUG();
+		BUG_ON(q->info.si_code != SI_TIMER);
 		q->info.si_overrun++;
 		goto out;
 	} 



--===============40255435218339963==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40255435218339963==--
