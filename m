From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:24:07 +0000
Subject: [KJ] [PATCH 11/20] i2c/i2c-elektor: remove
Message-Id: <20050202192407.GN2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58540991611992776=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58540991611992776==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Please consider applying.

Description: Replace deprecated interruptible_sleep_on_timeout() with direct
wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/i2c/busses/i2c-elektor.c	2005-01-24 09:28:30.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/i2c/busses/i2c-elektor.c	2005-01-27 11:34:43.000000000 -0800
@@ -110,7 +110,7 @@ static int pcf_isa_getclock(void *data)
 }
 
 static void pcf_isa_waitforpin(void) {
-
+	DEFINE_WAIT(wait);
 	int timeout = 2;
 	long flags;
 
@@ -118,14 +118,15 @@ static void pcf_isa_waitforpin(void) {
 		spin_lock_irqsave(&lock, flags);
 		if (pcf_pending == 0) {
 			spin_unlock_irqrestore(&lock, flags);
-			if (interruptible_sleep_on_timeout(&pcf_wait,
-								timeout*HZ)) {
+			prepare_to_wait(&pcf_wait, &wait, TASK_INTERRUPTIBLE);
+			if (schedule_timeout(timeout*HZ)) {
 				spin_lock_irqsave(&lock, flags);
 				if (pcf_pending == 1) {
 					pcf_pending = 0;
 				}
 				spin_unlock_irqrestore(&lock, flags);
 			}
+			finish_wait(&pcf_wait, &wait);
 		} else {
 			pcf_pending = 0;
 			spin_unlock_irqrestore(&lock, flags);

--===============58540991611992776==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58540991611992776==--
