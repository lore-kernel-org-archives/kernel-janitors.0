From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:28:54 +0000
Subject: [Kernel-janitors] [PATCH] ide-cs: replace schedule_timeout() with
Message-Id: <20040722222854.GT2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92050258358144466=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92050258358144466==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee the
desired delay.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/ide/legacy/ide-cs.c	2004-06-16 05:19:42.000000000 +0000
+++ linux-dev/drivers/ide/legacy/ide-cs.c	2004-07-15 23:12:04.000000000 +0000
@@ -43,6 +43,7 @@
 #include <linux/ide.h>
 #include <linux/hdreg.h>
 #include <linux/major.h>
+#include <linux/delay.h>
 #include <asm/io.h>
 #include <asm/system.h>
 
@@ -351,8 +352,7 @@ void ide_config(dev_link_t *link)
 		break;
 	    }
 	}
-	__set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
     }
     
     if (hd < 0) {

--===============92050258358144466==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92050258358144466==--
