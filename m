From: "chas williams (contractor)" <chas@cmf.nrl.navy.mil>
Date: Tue, 21 Sep 2004 20:29:19 +0000
Subject: [Kernel-janitors] [PATCH][ATM]: [drivers] use msleep() instead of
Message-Id: <200409212029.i8LKTINv010576@ginger.cmf.nrl.navy.mil>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41118984204002951=="
List-Id: <kernel-janitors.vger.kernel.org>
To: netdev@oss.sgi.com
Cc: davem@redhat.com, Nishanth Aravamudan <nacc@us.ibm.com>, kernel-janitors@lists.osdl.org

--===============41118984204002951==

dave,

this patch (from nacc@us.ibm.com) replaces assorted schedule_timeout()'s
with msleep()'s.  please apply to 2.6.

thanks!

# This is a BitKeeper generated diff -Nru style patch.
#
# ChangeSet
#   2004/09/17 20:30:30-04:00 chas@relax.cmf.nrl.navy.mil 
#   [ATM]: [drivers] use msleep() instead of schedule_timeout() (from Nishanth Aravamudan <nacc@us.ibm.com>)
# 
diff -Nru a/drivers/atm/firestream.c b/drivers/atm/firestream.c
--- a/drivers/atm/firestream.c	2004-09-21 12:48:17 -04:00
+++ b/drivers/atm/firestream.c	2004-09-21 12:48:17 -04:00
@@ -1704,8 +1704,7 @@
 		}
 
 		/* Try again after 10ms. */
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout ((HZ+99)/100);
+		msleep(10);
 	}
 
 	if (!to) {
diff -Nru a/drivers/atm/he.c b/drivers/atm/he.c
--- a/drivers/atm/he.c	2004-09-21 12:48:17 -04:00
+++ b/drivers/atm/he.c	2004-09-21 12:48:17 -04:00
@@ -2596,9 +2596,8 @@
 
 		while (((tx_inuse = atomic_read(&vcc->sk->sk_wmem_alloc)) > 0) &&
 		       (retry < MAX_RETRY)) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			(void) schedule_timeout(sleep);
-			if (sleep < HZ)
+			msleep(sleep);
+			if (sleep < 250)
 				sleep = sleep * 2;
 
 			++retry;
diff -Nru a/drivers/atm/idt77252.c b/drivers/atm/idt77252.c
--- a/drivers/atm/idt77252.c	2004-09-21 12:48:17 -04:00
+++ b/drivers/atm/idt77252.c	2004-09-21 12:48:17 -04:00
@@ -2516,7 +2516,7 @@
 	struct vc_map *vc = vcc->dev_data;
 	unsigned long flags;
 	unsigned long addr;
-	int timeout;
+	unsigned long timeout;
 
 	down(&card->mutex);
 
@@ -2566,9 +2566,9 @@
 		}
 		spin_unlock_irqrestore(&vc->lock, flags);
 
-		timeout = 5 * HZ;
+		timeout = 5 * 1000;
 		while (atomic_read(&vc->scq->used) > 0) {
-			timeout = schedule_timeout(timeout);
+			timeout = msleep_interruptible(timeout);
 			if (!timeout)
 				break;
 		}
diff -Nru a/drivers/atm/lanai.c b/drivers/atm/lanai.c
--- a/drivers/atm/lanai.c	2004-09-21 12:48:17 -04:00
+++ b/drivers/atm/lanai.c	2004-09-21 12:48:17 -04:00
@@ -813,7 +813,7 @@
 			DPRINTK("read, write = %d, %d\n", read, write);
 			break;
 		}
-		schedule_timeout(HZ / 25);
+		msleep(4);
 	}
 	/* 15.2.2 - clear out all tx registers */
 	cardvcc_write(lvcc, 0, vcc_txreadptr);

--===============41118984204002951==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41118984204002951==--
