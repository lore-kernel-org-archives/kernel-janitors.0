From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 22:02:19 +0000
Subject: [KJ] [PATCH 14/20] sound/seq_oss*: remove snd_seq_oss_readq_wait()
Message-Id: <20050202220219.GT2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90517423841456501=="
List-Id: <kernel-janitors.vger.kernel.org>
To: perex@suse.cz
Cc: alsa-devel@alsa-project.org, kernel-janitors@lists.osdl.org

--===============90517423841456501==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Remove snd_seq_oss_readq_wait() which is called only once and is
simply a wrapper for a deprecated function. Remove snd_seq_oss_readq_wait()'s
prototype from the header file. Replace the one caller with direct wait-queue
usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/sound/core/seq/oss/seq_oss_readq.h	2005-01-24 09:28:58.000000000 -0800
+++ 2.6.11-rc2-kj/sound/core/seq/oss/seq_oss_readq.h	2005-02-02 11:51:30.000000000 -0800
@@ -47,7 +47,6 @@ int snd_seq_oss_readq_puts(seq_oss_readq
 int snd_seq_oss_readq_put_event(seq_oss_readq_t *readq, evrec_t *ev);
 int snd_seq_oss_readq_put_timestamp(seq_oss_readq_t *readq, unsigned long curt, int seq_mode);
 int snd_seq_oss_readq_pick(seq_oss_readq_t *q, evrec_t *rec);
-void snd_seq_oss_readq_wait(seq_oss_readq_t *q);
 void snd_seq_oss_readq_free(seq_oss_readq_t *q);
 
 #define snd_seq_oss_readq_lock(q, flags) spin_lock_irqsave(&(q)->lock, flags)
--- 2.6.11-rc2-kj-v/sound/core/seq/oss/seq_oss_readq.c	2005-01-24 09:34:23.000000000 -0800
+++ 2.6.11-rc2-kj/sound/core/seq/oss/seq_oss_readq.c	2005-02-01 16:13:55.000000000 -0800
@@ -160,15 +160,6 @@ snd_seq_oss_readq_pick(seq_oss_readq_t *
 }
 
 /*
- * sleep until ready
- */
-void
-snd_seq_oss_readq_wait(seq_oss_readq_t *q)
-{
-	interruptible_sleep_on_timeout(&q->midi_sleep, q->pre_event_timeout);
-}
-
-/*
  * drain one record
  * caller must hold lock
  */
--- 2.6.11-rc2-kj-v/sound/core/seq/oss/seq_oss_rw.c	2005-01-24 09:28:58.000000000 -0800
+++ 2.6.11-rc2-kj/sound/core/seq/oss/seq_oss_rw.c	2005-02-01 16:13:40.000000000 -0800
@@ -28,6 +28,7 @@
 #include "seq_oss_event.h"
 #include "seq_oss_timer.h"
 #include "../seq_clientmgr.h"
+#include <linux/wait.h>
 
 
 /*
@@ -43,6 +44,7 @@ static int insert_queue(seq_oss_devinfo_
 int
 snd_seq_oss_read(seq_oss_devinfo_t *dp, char __user *buf, int count)
 {
+	DEFINE_WAIT(wait);
 	seq_oss_readq_t *readq = dp->readq;
 	int result = 0, err = 0;
 	int ev_len;
@@ -58,7 +60,9 @@ snd_seq_oss_read(seq_oss_devinfo_t *dp, 
 		if (err == -EAGAIN &&
 		    !is_nonblock_mode(dp->file_mode) && result == 0) {
 			snd_seq_oss_readq_unlock(readq, flags);
-			snd_seq_oss_readq_wait(readq);
+			prepare_to_wait(&readq->midi_sleep, &wait, TASK_INTERRUPTIBLE);
+			schedule_timeout(readq->pre_event_timeout);
+			finish_wait(&readq->midi_sleep, &wait);
 			snd_seq_oss_readq_lock(readq, flags);
 			if (signal_pending(current))
 				err = -ERESTARTSYS;

--===============90517423841456501==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90517423841456501==--
