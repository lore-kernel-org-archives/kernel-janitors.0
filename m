From: Peter Jones <pjones@redhat.com>
Date: Tue, 07 Sep 2004 16:48:56 +0000
Subject: [Kernel-janitors] [patch 2.6.9-rc1] struct formatting, blkdev.h
Message-Id: <1094575736.7360.24.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17243008834664408=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17243008834664408==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This just makes these 2 structs more grep-friendly:

--- 1.151/include/linux/blkdev.h	Mon Aug 23 04:14:45 2004
+++ 1.152/include/linux/blkdev.h	Mon Sep  6 22:48:58 2004
@@ -229,8 +229,7 @@
  * State information carried for REQ_PM_SUSPEND and REQ_PM_RESUME
  * requests. Some step values could eventually be made generic.
  */
-struct request_pm_state
-{
+struct request_pm_state {
 	/* PM state machine step value, currently driver specific */
 	int	pm_step;
 	/* requested PM state value (S1, S2, S3, S4, ...) */
@@ -272,8 +271,7 @@
 	atomic_t refcnt;		/* map can be shared */
 };
 
-struct request_queue
-{
+struct request_queue {
 	/*
 	 * Together with queue_head for cacheline sharing
 	 */

-- 
        Peter


--===============17243008834664408==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17243008834664408==--
