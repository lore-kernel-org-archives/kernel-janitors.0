From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 00:00:01 +0000
Subject: [Kernel-janitors] [PATCH] net/e1000_osdep: replace
Message-Id: <20040727000001.GK1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8408608943774214=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8408608943774214==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.


--- linux-vanilla/drivers/net/e1000/e1000_osdep.h	2004-06-16 05:19:01.000000000 +0000
+++ linux-dev/drivers/net/e1000/e1000_osdep.h	2004-07-03 01:18:46.000000000 +0000
@@ -46,8 +46,7 @@
 				/* Don't mdelay in interrupt context! */ \
 	                	BUG(); \
 			} else { \
-				set_current_state(TASK_UNINTERRUPTIBLE); \
-				schedule_timeout((x * HZ)/1000 + 2); \
+				msleep(x); \
 			} } while(0)
 #endif
 

--===============8408608943774214==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8408608943774214==--
