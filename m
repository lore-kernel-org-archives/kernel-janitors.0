From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:41:11 +0000
Subject: [KJ] [PATCH] 8/34: block/swim3: replace interruptible_sleep_on()
Message-Id: <20050125224111.GI2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80325703848658814=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============80325703848658814==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The change is pretty straight-forward, as the current
sleep is conditional.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/block/swim3.c	2005-01-25 14:38:30.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/swim3.c	2005-01-24 14:02:49.000000000 -0800
@@ -28,6 +28,7 @@
 #include <linux/devfs_fs_kernel.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/dbdma.h>
 #include <asm/prom.h>
@@ -792,13 +793,11 @@ static int grab_drive(struct floppy_stat
 	cli();
 	if (fs->state != idle) {
 		++fs->wanted;
-		while (fs->state != available) {
-			if (interruptible && signal_pending(current)) {
-				--fs->wanted;
-				restore_flags(flags);
-				return -EINTR;
-			}
-			interruptible_sleep_on(&fs->wait);
+		wait_event_interruptible(fs->wait, (fs->state == available));
+		if (interruptible && signal_pending(current)) {
+			--fs->wanted;
+			restore_flags(flags);
+			return -EINTR;
 		}
 		--fs->wanted;
 	}

--===============80325703848658814==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80325703848658814==--
