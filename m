From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 21 Sep 2004 22:14:36 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/38] net/airport: replace
Message-Id: <20040921221436.GH1946@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36934084571673953=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36934084571673953==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. Two patches have been removed from my
set, so the total has been reduced to 38.

Description: Use ssleep()/msleep() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as
expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wireless/airport.c	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wireless/airport.c	2004-09-21 15:04:59.000000000 -0700
@@ -28,6 +28,7 @@
 #include <linux/if_arp.h>
 #include <linux/etherdevice.h>
 #include <linux/wireless.h>
+#include <linux/delay.h>
 
 #include <asm/io.h>
 #include <asm/system.h>
@@ -94,8 +95,7 @@ airport_resume(struct macio_dev *mdev)
 	printk(KERN_DEBUG "%s: Airport waking up\n", dev->name);
 
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(mdev), 0, 1);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/5);
+	msleep(200);
 
 	enable_irq(dev->irq);
 
@@ -147,8 +147,7 @@ airport_detach(struct macio_dev *mdev)
 	macio_release_resource(mdev, 0);
 
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(mdev), 0, 0);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	ssleep(1);
 
 	macio_set_drvdata(mdev, NULL);
 	free_netdev(dev);
@@ -174,14 +173,12 @@ static int airport_hard_reset(struct ori
 	disable_irq(dev->irq);
 
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(card->mdev), 0, 0);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	ssleep(1);
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(card->mdev), 0, 1);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	ssleep(1);
 
 	enable_irq(dev->irq);
-	schedule_timeout(HZ);
+	ssleep(1);
 #endif
 
 	return 0;
@@ -240,8 +237,7 @@ airport_attach(struct macio_dev *mdev, c
 		
 	/* Power up card */
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(mdev), 0, 1);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	ssleep(1);
 
 	/* Reset it before we get the interrupt */
 	hermes_init(hw);

--===============36934084571673953==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36934084571673953==--
