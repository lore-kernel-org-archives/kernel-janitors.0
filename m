From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 02 Feb 2005 19:04:04 +0000
Subject: [KJ] [PATCH 7/20] usb/rio500: remove
Message-Id: <20050202190404.GI2546@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52763299261670937=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============52763299261670937==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Replace deprecated interruptible_sleep_on_timeout() with direct
wait-queue usage. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/usb/misc/rio500.c	2005-01-24 09:28:33.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/usb/misc/rio500.c	2005-02-01 13:56:59.000000000 -0800
@@ -40,6 +40,7 @@
 #include <linux/spinlock.h>
 #include <linux/usb.h>
 #include <linux/smp_lock.h>
+#include <linux/wait.h>
 
 #include "rio500_usb.h"
 
@@ -264,6 +265,7 @@ static ssize_t
 write_rio(struct file *file, const char __user *buffer,
 	  size_t count, loff_t * ppos)
 {
+	DEFINE_WAIT(wait);
 	struct rio_usb_data *rio = &rio_instance;
 
 	unsigned long copy_size;
@@ -319,7 +321,9 @@ write_rio(struct file *file, const char 
 					errn = -ETIME;
 					goto error;
 				}
-				interruptible_sleep_on_timeout(&rio-> wait_q, NAK_TIMEOUT);
+				prepare_to_wait(&rio->wait_q, &wait, TASK_INTERRUPTIBLE);
+				schedule_timeout(NAK_TIMEOUT);
+				finish_wait(&rio->wait_q, &wait);
 				continue;
 			} else if (!result && partial) {
 				obuf += partial;
@@ -349,6 +353,7 @@ error:
 static ssize_t
 read_rio(struct file *file, char __user *buffer, size_t count, loff_t * ppos)
 {
+	DEFINE_WAIT(wait);
 	struct rio_usb_data *rio = &rio_instance;
 	ssize_t read_count;
 	unsigned int partial;
@@ -399,8 +404,9 @@ read_rio(struct file *file, char __user 
 				err("read_rio: maxretry timeout");
 				return -ETIME;
 			}
-			interruptible_sleep_on_timeout(&rio->wait_q,
-						       NAK_TIMEOUT);
+			prepare_to_wait(&rio->wait_q, &wait, TASK_INTERRUPTIBLE);
+			schedule_timeout(NAK_TIMEOUT);
+			finish_wait(&rio->wait_q, &wait);
 			continue;
 		} else if (result != -EREMOTEIO) {
 			up(&(rio->lock));

--===============52763299261670937==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52763299261670937==--
