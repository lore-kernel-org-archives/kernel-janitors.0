From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 23:47:35 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/3] ide/ide-tape: replace
Message-Id: <20040916234735.GJ1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============040134771363177002=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============040134771363177002==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Uses msleep_interruptible() in place of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/ide/legacy/ide-cs.c	2004-09-13 17:16:06.000000000 -0700
+++ 2.6.9-rc2/drivers/ide/legacy/ide-cs.c	2004-09-16 16:42:03.000000000 -0700
@@ -43,6 +43,7 @@
 #include <linux/ide.h>
 #include <linux/hdreg.h>
 #include <linux/major.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 #include <asm/system.h>
 
@@ -357,8 +358,7 @@ void ide_config(dev_link_t *link)
 		break;
 	    }
 	}
-	__set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
     }
 
     if (hd < 0) {

--===============040134771363177002==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============040134771363177002==--
