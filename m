From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 23:13:11 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 10/38] net/e1000_osdep: replace
Message-Id: <20040922231311.GJ1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99844308258574177=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99844308258574177==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/e1000/e1000_osdep.h	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/e1000/e1000_osdep.h	2004-09-14 17:15:27.000000000 -0700
@@ -42,13 +42,7 @@
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

--===============99844308258574177==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99844308258574177==--
