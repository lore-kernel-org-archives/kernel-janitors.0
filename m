From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:13:09 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/4] message/exec-osm: replace
Message-Id: <20040920221309.GA2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42155071100868446=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42155071100868446==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/message/i2o/exec-osm.c	2004-09-09 23:05:59.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/message/i2o/exec-osm.c	2004-09-13 14:32:08.000000000 -0700
@@ -29,6 +29,7 @@
 
 #include <linux/module.h>
 #include <linux/i2o.h>
+#include <linux/delay.h>
 
 struct i2o_driver i2o_exec_driver;
 
@@ -151,7 +152,7 @@ int i2o_msg_post_wait_mem(struct i2o_con
 		prepare_to_wait(&wq, &wait, TASK_INTERRUPTIBLE);
 
 		if (!iwait->complete)
-			schedule_timeout(timeout * HZ);
+			msleep_interruptible(timeout * 1000);
 
 		finish_wait(&wq, &wait);
 

--===============42155071100868446==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42155071100868446==--
