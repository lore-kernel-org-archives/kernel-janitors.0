From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 22:53:58 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 8/33] char/ftape-io: replace
Message-Id: <20040915225358.GO5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92651013061661669=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92651013061661669==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected. In this case, this allowed for
the removal of the entire do-while.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/ftape/lowlevel/ftape-io.c	2004-09-13 17:15:47.000000000 -0700
+++ 2.6.9-rc2/drivers/char/ftape/lowlevel/ftape-io.c	2004-09-14 11:27:06.000000000 -0700
@@ -96,19 +96,12 @@ void ftape_sleep(unsigned int time)
 		timeout = ticks;
 		save_flags(flags);
 		sti();
-		set_current_state(TASK_INTERRUPTIBLE);
-		do {
-			/*  Mmm. Isn't current->blocked == 0xffffffff ?
-			 */
-			if (signal_pending(current)) {
-				TRACE(ft_t_err,
-				      "awoken by non-blocked signal :-(");
-				break;	/* exit on signal */
-			}
-			while (current->state != TASK_RUNNING) {
-				timeout = schedule_timeout(timeout);
-			}
-		} while (timeout);
+		msleep_interruptible(jiffies_to_msecs(timeout));
+		/*  Mmm. Isn't current->blocked == 0xffffffff ?
+		 */
+		if (signal_pending(current)) {
+			TRACE(ft_t_err, "awoken by non-blocked signal :-(");
+		}
 		restore_flags(flags);
 	}
 	TRACE_EXIT;

--===============92651013061661669==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92651013061661669==--
