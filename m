From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 20 Sep 2004 22:12:17 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/4] message/device: replace
Message-Id: <20040920221217.GZ2270@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30863424777404846=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30863424777404846==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use ssleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/message/i2o/device.c	2004-09-13 17:16:08.000000000 -0700
+++ 2.6.9-rc2/drivers/message/i2o/device.c	2004-09-20 15:10:14.000000000 -0700
@@ -15,6 +15,7 @@
 
 #include <linux/module.h>
 #include <linux/i2o.h>
+#include <linux/delay.h>
 
 /* Exec OSM functions */
 extern struct bus_type i2o_bus_type;
@@ -106,8 +107,7 @@ int i2o_device_claim_release(struct i2o_
 		if (!rc)
 			break;
 
-		set_current_state(TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ);
+		ssleep(1);
 	}
 
 	if (!rc)

--===============30863424777404846==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30863424777404846==--
