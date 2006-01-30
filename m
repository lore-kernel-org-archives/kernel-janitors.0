From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Mon, 30 Jan 2006 21:15:54 +0000
Subject: [KJ] [Patch 6/6] BUG_ON() Conversion in kernel/signal.c
Message-Id: <1138655754.4007.16.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8539663989666253=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8539663989666253==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,  

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/kernel/timer.c.orig	2006-01-27 11:52:13.000000000 +0100
+++ linux-2.6.16-rc1-git4/kernel/timer.c	2006-01-27 11:52:33.000000000 +0100
@@ -1255,8 +1255,7 @@ static void __devinit migrate_timers(int
 	spin_lock(&new_base->t_base.lock);
 	spin_lock(&old_base->t_base.lock);
 
-	if (old_base->t_base.running_timer)
-		BUG();
+	BUG_ON(old_base->t_base.running_timer);
 	for (i = 0; i < TVR_SIZE; i++)
 		migrate_timer_list(new_base, old_base->tv1.vec + i);
 	for (i = 0; i < TVN_SIZE; i++) {
@@ -1446,8 +1445,7 @@ register_time_interpolator(struct time_i
 	unsigned long flags;
 
 	/* Sanity check */
-	if (ti->frequency == 0 || ti->mask == 0)
-		BUG();
+	BUG_ON(ti->frequency == 0 || ti->mask == 0);
 
 	ti->nsec_per_cyc = ((u64)NSEC_PER_SEC << ti->shift) / ti->frequency;
 	spin_lock(&time_interpolator_lock);



--===============8539663989666253==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8539663989666253==--
