From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:23:14 +0000
Subject: [Kernel-janitors] [PATCH] ixgb/ixgb_osdep: replace
Message-Id: <20040727182314.GO2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10661908713326396=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10661908713326396==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time. Redefine msec_delay(x) to directly
call msleep(x).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/ixgb/ixgb_osdep.h	2004-06-15 22:19:37.000000000 -0700
+++ linux-dev/drivers/net/ixgb/ixgb_osdep.h	2004-07-27 11:20:09.000000000 -0700
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

--===============10661908713326396==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10661908713326396==--
