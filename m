From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 21:21:55 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/33] char/cyclades: replace
Message-Id: <20040915212155.GG5778@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93342922326577327=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93342922326577327==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. 

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/char/cyclades.c	2004-09-13 17:15:49.000000000 -0700
+++ 2.6.9-rc2/drivers/char/cyclades.c	2004-09-15 14:20:23.000000000 -0700
@@ -2717,8 +2717,7 @@ cy_wait_until_sent(struct tty_struct *tt
 #ifdef CY_DEBUG_WAIT_UNTIL_SENT
 	    printk("Not clean (jiff=%lu)...", jiffies);
 #endif
-	    current->state = TASK_INTERRUPTIBLE;
-	    schedule_timeout(char_time);
+	    msleep_interruptible(msecs_to_jiffies(char_time));
 	    if (signal_pending(current))
 		break;
 	    if (timeout && time_after(jiffies, orig_jiffies + timeout))
@@ -2729,8 +2728,7 @@ cy_wait_until_sent(struct tty_struct *tt
 	// Nothing to do!
     }
     /* Run one more char cycle */
-    current->state = TASK_INTERRUPTIBLE;
-    schedule_timeout(char_time * 5);
+    msleep_interruptible(jiffies_to_msecs(char_time * 5));
 #ifdef CY_DEBUG_WAIT_UNTIL_SENT
     printk("Clean (jiff=%lu)...done\n", jiffies);
 #endif
@@ -2860,8 +2858,7 @@ cy_close(struct tty_struct *tty, struct 
     if (info->blocked_open) {
 	CY_UNLOCK(info, flags);
         if (info->close_delay) {
-            current->state = TASK_INTERRUPTIBLE;
-            schedule_timeout(info->close_delay);
+            msleep_interruptible(jiffies_to_msecs(info->close_delay));
         }
         wake_up_interruptible(&info->open_wait);
 	CY_LOCK(info, flags);

--===============93342922326577327==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93342922326577327==--
