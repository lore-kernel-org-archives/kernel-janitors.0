From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 15 Sep 2004 18:01:57 +0000
Subject: [Kernel-janitors] [PATCH 1/5] atm/ambassador: replace
Message-Id: <20040915180157.GA4363@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17018131377621071=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17018131377621071==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: msleep() is used instead of schedule_timeout() to guarantee
the task delays as expected. Two set_current_state()s were also
inserted, as schedule_timeout() will return immediately unless the state
is set.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/atm/ambassador.c	2004-09-13 17:16:06.000000000 -0700
+++ 2.6.9-rc2/drivers/atm/ambassador.c	2004-09-15 10:57:00.000000000 -0700
@@ -604,18 +604,13 @@ static int command_do (amb_dev * dev, co
     
     // prepare to wait for cq->pending milliseconds
     // effectively one centisecond on i386
-    timeout = (cq->pending*HZ+999)/1000;
+    timeout = cq->pending;
     
     if (cq->pending > cq->high)
       cq->high = cq->pending;
     spin_unlock (&cq->lock);
     
-    while (timeout) {
-      // go to sleep
-      // PRINTD (DBG_CMD, "wait: sleeping %lu for command", timeout);
-      set_current_state(TASK_UNINTERRUPTIBLE);
-      timeout = schedule_timeout (timeout);
-    }
+    msleep (timeout);
     
     // wait for my slot to be reached (all waiters are here or above, until...)
     while (ptrs->out != my_slot) {
@@ -1847,6 +1842,7 @@ static int __init do_loader_command (vol
     timeout = HZ/10;
     while (rd_plain (dev, offsetof(amb_mem, doorbell)))
       if (timeout) {
+	set_current_state(TASK_UNINTERRUPTIBLE);
 	timeout = schedule_timeout (timeout);
       } else {
 	PRINTD (DBG_LOAD|DBG_ERR, "start command did not clear doorbell, res=%08x",
@@ -1962,11 +1958,7 @@ static int amb_reset (amb_dev * dev, int
   if (diags) { 
     unsigned long timeout;
     // 4.2 second wait
-    timeout = HZ*42/10;
-    while (timeout) {
-      set_current_state(TASK_UNINTERRUPTIBLE);
-      timeout = schedule_timeout (timeout);
-    }
+    msleep (4200);
     // half second time-out
     timeout = HZ/2;
     while (!rd_plain (dev, offsetof(amb_mem, mb.loader.ready)))
@@ -2086,13 +2078,12 @@ static int __init amb_talk (amb_dev * de
   wr_mem (dev, offsetof(amb_mem, doorbell), virt_to_bus (&a));
   
   // 2.2 second wait (must not touch doorbell during 2 second DMA test)
-  timeout = HZ*22/10;
-  while (timeout)
-    timeout = schedule_timeout (timeout);
+  msleep (2200);
   // give the adapter another half second?
   timeout = HZ/2;
   while (rd_plain (dev, offsetof(amb_mem, doorbell)))
     if (timeout) {
+      set_current_state(TASK_UNINTERRUPTIBLE);
       timeout = schedule_timeout (timeout);
     } else {
       PRINTD (DBG_INIT|DBG_ERR, "adapter init timed out");

--===============17018131377621071==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17018131377621071==--
