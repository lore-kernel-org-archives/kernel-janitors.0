From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 18 Apr 2006 17:04:19 +0000
Subject: [KJ] [Patch] use dynamic spinlock initialisation in
Message-Id: <1145379859.11834.5.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54057906328556271=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54057906328556271==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

according to http://lwn.net/Articles/2.6-kernel-api/ spin locks should be
initialized during runtime instead of compile time.

"Run-time initialization of spinlocks is being converted away from the
 assignment form (using SPIN_LOCK_UNLOCKED) to explicit spin_lock_init()
 calls. No noises have yet been made about removing SPIN_LOCK_INIT,
 but the writing should be considered to be on the wall. If and when
 the real-time preemption patches are merged, the assignment form
 may no longer be possible."

So here is a patch to convert drivers/char/random.c to spin_lock_init()
its boot tested, i was able to generate a gpg key and work some days
without noticing anything strange.

I did not move the init into init_std_data() because it also gets called,
when the entropy pool gets cleared, so it should match the original behaviour.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc1-git5/drivers/char/random.c.orig	2006-04-12 16:02:02.000000000 +0200
+++ linux-2.6.17-rc1-git5/drivers/char/random.c	2006-04-12 16:02:41.000000000 +0200
@@ -417,7 +417,6 @@ static struct entropy_store input_pool =
 	.poolinfo = &poolinfo_table[0],
 	.name = "input",
 	.limit = 1,
-	.lock = SPIN_LOCK_UNLOCKED,
 	.pool = input_pool_data
 };
 
@@ -426,7 +425,6 @@ static struct entropy_store blocking_poo
 	.name = "blocking",
 	.limit = 1,
 	.pull = &input_pool,
-	.lock = SPIN_LOCK_UNLOCKED,
 	.pool = blocking_pool_data
 };
 
@@ -434,7 +432,6 @@ static struct entropy_store nonblocking_
 	.poolinfo = &poolinfo_table[1],
 	.name = "nonblocking",
 	.pull = &input_pool,
-	.lock = SPIN_LOCK_UNLOCKED,
 	.pool = nonblocking_pool_data
 };
 
@@ -894,6 +891,9 @@ static void init_std_data(struct entropy
 
 static int __init rand_initialize(void)
 {
+	spin_lock_init(&input_pool.lock);
+	spin_lock_init(&blocking_pool.lock);
+	spin_lock_init(&nonblocking_pool.lock);
 	init_std_data(&input_pool);
 	init_std_data(&blocking_pool);
 	init_std_data(&nonblocking_pool);



--===============54057906328556271==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54057906328556271==--
