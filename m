From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:14 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 20/38] net/ixgb_osdep: replace
Message-Id: <20040923221314.GD13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============036366043848889529=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============036366043848889529==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected. I was told earlier that the
in_interrupt() check is not necessary. It would be nice to get some
verification of this (i.e. the driver functions the same without it).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/ixgb/ixgb_osdep.h	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/ixgb/ixgb_osdep.h	2004-09-14 17:22:09.000000000 -0700
@@ -41,13 +41,7 @@
 #include <linux/sched.h>
 
 #ifndef msec_delay
-#define msec_delay(x)	do { if(in_interrupt()) { \
-				/* Don't mdelay in interrupt context! */ \
-	                	BUG(); \
-			} else { \
-				set_current_state(TASK_UNINTERRUPTIBLE); \
-				schedule_timeout((x * HZ)/1000 + 2); \
-			} } while(0)
+#define msec_delay(x)	msleep(x)
 #endif
 
 #define PCI_COMMAND_REGISTER   PCI_COMMAND

--===============036366043848889529==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============036366043848889529==--
