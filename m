From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 22:03:44 +0000
Subject: [KJ] [PATCH 15/20] sound/seq_oss_writeq: remove
Message-Id: <20050202220344.GU2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============090495420896140377=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============090495420896140377==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Remove deprecated interruptible_sleep_on_timeout() function call
and replace with direct wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/sound/core/seq/oss/seq_oss_writeq.c	2005-01-24 09:28:58.000000000 -0800
+++ 2.6.11-rc2-kj/sound/core/seq/oss/seq_oss_writeq.c	2005-02-01 16:15:50.000000000 -0800
@@ -26,6 +26,7 @@
 #include <sound/seq_oss_legacy.h>
 #include "../seq_lock.h"
 #include "../seq_clientmgr.h"
+#include <linux/wait.h>
 
 
 /*
@@ -89,6 +90,7 @@ snd_seq_oss_writeq_clear(seq_oss_writeq_
 int
 snd_seq_oss_writeq_sync(seq_oss_writeq_t *q)
 {
+	DEFINE_WAIT(wait);
 	seq_oss_devinfo_t *dp = q->dp;
 	abstime_t time;
 	unsigned long flags;
@@ -123,7 +125,9 @@ snd_seq_oss_writeq_sync(seq_oss_writeq_t
 		
 	/* wait for echo event */
 	spin_unlock(&q->sync_lock);
-	interruptible_sleep_on_timeout(&q->sync_sleep, HZ);
+	prepare_to_wait(&q->sync_sleep, &wait, TASK_INTERRUPTIBLE);
+	schedule_timeout(HZ);
+	finish_wait(&q->sync_sleep, &wait);
 	spin_lock(&q->sync_lock);
 	if (signal_pending(current)) {
 		/* interrupted - return 0 to finish sync */

--===============090495420896140377==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============090495420896140377==--
