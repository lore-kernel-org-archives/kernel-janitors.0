From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 21:50:02 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/17] media/cx88-tvaudio:
Message-Id: <20040920215002.GJ2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70051863420030758=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920214642.GH2270@us.ibm.com>
In-Reply-To: <20040920214642.GH2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============70051863420030758==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/media/video/cx88/cx88-tvaudio.c	2004-09-09 23:05:26.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/media/video/cx88/cx88-tvaudio.c	2004-09-13 14:26:23.000000000 -0700
@@ -49,6 +49,7 @@
 #include <linux/vmalloc.h>
 #include <linux/init.h>
 #include <linux/smp_lock.h>
+#include <linux/delay.h>
 
 #include "cx88.h"
 
@@ -785,8 +786,7 @@ int cx88_audio_thread(void *data)
 	dprintk("cx88: tvaudio thread started\n");
 
 	for (;;) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ*3);
+		msleep_interruptible(3000);
 		if (signal_pending(current))
 			break;
 		if (dev->shutdown)

--===============70051863420030758==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70051863420030758==--
