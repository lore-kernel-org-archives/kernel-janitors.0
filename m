From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:07:33 +0000
Subject: [KJ] [PATCH 9/40] fs/transport: replace schedule_timeout() with
Message-Id: <20050120190733.GJ5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8929092980735065=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8929092980735065==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not check
for signals, so I believe the change to msleep() is acceptable.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/cifs/transport.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/cifs/transport.c	2005-01-18 10:52:15.000000000 -0800
@@ -26,6 +26,7 @@
 #include <asm/uaccess.h>
 #include <asm/processor.h>
 #include <linux/mempool.h>
+#include <linux/delay.h>
 #include "cifspdu.h"
 #include "cifsglob.h"
 #include "cifsproto.h"
@@ -156,8 +157,7 @@ smb_send(struct socket *ssocket, struct 
 				rc = -EAGAIN;
 				break;
 			}
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ/2);
+			msleep(500);
 			continue;
 		}
 		if (rc < 0) 

--===============8929092980735065==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8929092980735065==--
