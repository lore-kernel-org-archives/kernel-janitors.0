From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:45:08 +0000
Subject: [KJ] [PATCH] 9/34: block/swim_iop: replace interruptible_sleep_on()
Message-Id: <20050125224508.GJ2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20135685039044171=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20135685039044171==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The change is pretty straight-forward, as the current
sleep is conditional.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/block/swim_iop.c	2005-01-25 14:42:49.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/swim_iop.c	2005-01-25 14:43:37.000000000 -0800
@@ -32,6 +32,7 @@
 #include <linux/fd.h>
 #include <linux/ioctl.h>
 #include <linux/blkdev.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/uaccess.h>
 #include <asm/mac_iop.h>
@@ -431,13 +432,11 @@ static int grab_drive(struct floppy_stat
 	local_irq_save(flags);
 	if (fs->state != idle) {
 		++fs->wanted;
-		while (fs->state != available) {
-			if (interruptible && signal_pending(current)) {
-				--fs->wanted;
-				local_irq_restore(flags);
-				return -EINTR;
-			}
-			interruptible_sleep_on(&fs->wait);
+		wait_event_interruptible(fs->wait, (fs->state == available));
+		if (interruptible && signal_pending(current)) {
+			--fs->wanted;
+			local_irq_restore(flags);
+			return -EINTR;
 		}
 		--fs->wanted;
 	}

--===============20135685039044171==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20135685039044171==--
