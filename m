From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:55:06 +0000
Subject: [Kernel-janitors] [PATCH] wireless/airport: replace
Message-Id: <20040727205506.GG3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90931133202496861=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============90931133202496861==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/wireless/airport.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/net/wireless/airport.c	2004-07-03 02:00:04.000000000 +0000
@@ -91,8 +91,7 @@ airport_resume(struct macio_dev *mdev)
 	printk(KERN_DEBUG "%s: Airport waking up\n", dev->name);
 
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(mdev), 0, 1);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/5);
+	msleep(200);
 
 	enable_irq(dev->irq);
 
@@ -144,8 +143,7 @@ airport_detach(struct macio_dev *mdev)
 	macio_release_resource(mdev, 0);
 
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(mdev), 0, 0);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 
 	macio_set_drvdata(mdev, NULL);
 	free_netdev(dev);
@@ -171,11 +169,9 @@ static int airport_hard_reset(struct ori
 	disable_irq(dev->irq);
 
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(card->mdev), 0, 0);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(card->mdev), 0, 1);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 
 	enable_irq(dev->irq);
 	schedule_timeout(HZ);
@@ -237,8 +233,7 @@ airport_attach(struct macio_dev *mdev, c
 		
 	/* Power up card */
 	pmac_call_feature(PMAC_FTR_AIRPORT_ENABLE, macio_get_of_node(mdev), 0, 1);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 
 	/* Reset it before we get the interrupt */
 	hermes_init(hw);

--===============90931133202496861==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90931133202496861==--
