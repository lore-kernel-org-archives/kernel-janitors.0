From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 20:54:07 +0000
Subject: [Kernel-janitors] [PATCH] wireless/airo: replace schedule_timeout()
Message-Id: <20040727205407.GF3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70243685126748412=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70243685126748412==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/wireless/airo.c	2004-06-15 22:18:58.000000000 -0700
+++ linux-dev/drivers/net/wireless/airo.c	2004-07-27 13:52:48.000000000 -0700
@@ -2668,11 +2668,9 @@ int reset_card( struct net_device *dev ,
 		return -1;
 	waitbusy (ai);
 	OUT4500(ai,COMMAND,CMD_SOFTRESET);
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ/5);
+	msleep(200);
 	waitbusy (ai);
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ/5);
+	msleep(200);
 	if (lock)
 		up(&ai->sem);
 	return 0;
@@ -7420,8 +7418,7 @@ int cmdreset(struct airo_info *ai) {
 
 	OUT4500(ai,COMMAND,CMD_SOFTRESET);
 
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ);          /* WAS 600 12/7/00 */
+	msleep(1000);			/* WAS 600 12/7/00 */
 
 	if(!waitbusy (ai)){
 		printk(KERN_INFO "Waitbusy hang AFTER RESET\n");
@@ -7448,8 +7445,7 @@ int setflashmode (struct airo_info *ai) 
 		OUT4500(ai, SWS3, FLASH_COMMAND);
 		OUT4500(ai, COMMAND,0);
 	}
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ/2); /* 500ms delay */
+	msleep(500);
 
 	if(!waitbusy(ai)) {
 		clear_bit (FLAG_FLASHING, &ai->flags);
@@ -7559,8 +7555,7 @@ int flashputbuf(struct airo_info *ai){
 int flashrestart(struct airo_info *ai,struct net_device *dev){
 	int    i,status;
 
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ);          /* Added 12/7/00 */
+	msleep(1000);			/* Added 12/7/00 */
 	clear_bit (FLAG_FLASHING, &ai->flags);
 	status = setup_card(ai, dev->dev_addr, 1);
 
@@ -7570,8 +7565,7 @@ int flashrestart(struct airo_info *ai,st
 				( ai, 2312, i >= MAX_FIDS / 2 );
 		}
 
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ);          /* Added 12/7/00 */
+	msleep(1000);			/* Added 12/7/00 */
 	return status;
 }
 #endif /* CISCO_EXT */

--===============70243685126748412==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70243685126748412==--
