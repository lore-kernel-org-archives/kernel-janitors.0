From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:18:30 +0000
Subject: [KJ] [PATCH] 14/34: cdrom/mcdx: replace interruptible_sleep_on()
Message-Id: <20050125231830.GD12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============079573074133032051=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============079573074133032051==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of interruptible_sleep_on(). First,
signals are not dealt with, so *interruptible* seems unnecessary. Second, the
xtrace lines will now only be displayed once, instead of once per loop
iteration. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/cdrom/mcdx.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/cdrom/mcdx.c	2005-01-24 14:09:11.000000000 -0800
@@ -68,6 +68,7 @@ static const char *mcdx_c_version
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/current.h>
 #include <asm/uaccess.h>
@@ -910,11 +911,9 @@ static int mcdx_talk(struct s_drive_stuf
 	if ((discard = (buffer == NULL)))
 		buffer = &c;
 
-	while (stuffp->lock) {
-		xtrace(SLEEP, "*** talk: lockq\n");
-		interruptible_sleep_on(&stuffp->lockq);
-		xtrace(SLEEP, "talk: awoken\n");
-	}
+	xtrace(SLEEP, "*** talk: lockq\n");
+	wait_event(stuffp->lockq, !stuffp->lock);
+	xtrace(SLEEP, "talk: awoken\n");
 
 	stuffp->lock = 1;
 
@@ -1341,9 +1340,7 @@ static int mcdx_xfer(struct s_drive_stuf
 		return -1;
 	}
 
-	while (stuffp->lock) {
-		interruptible_sleep_on(&stuffp->lockq);
-	}
+	wait_event(stuffp->lockq, !stuffp->lock);
 
 	if (stuffp->valid && (sector >= stuffp->pending)
 	    && (sector < stuffp->low_border)) {

--===============079573074133032051==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============079573074133032051==--
