From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 21 Sep 2004 22:00:08 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/40] net/airo: replace
Message-Id: <20040921220008.GG1946@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38668926709928408=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38668926709928408==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep()/msleep_interruptible() [as appropriate]
instead of schedule_timeout() to guarantee the task delays as
expected. Also uses set_current_state() instead of direct assignment of
current->state in one place.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wireless/airo.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wireless/airo.c	2004-09-15 09:51:48.000000000 -0700
@@ -1699,9 +1699,8 @@ static int readBSSListRid(struct airo_in
 			issuecommand(ai, &cmd, &rsp);
 			up(&ai->sem);
 			/* Let the command take effect */
-			set_current_state (TASK_INTERRUPTIBLE);
 			ai->task = current;
-			schedule_timeout (3*HZ);
+			msleep_interruptible(3*1000);
 			ai->task = NULL;
 		}
 	rc = PC4500_readrid(ai, first ? RID_BSSLISTFIRST : RID_BSSLISTNEXT,
@@ -2671,11 +2670,9 @@ int reset_card( struct net_device *dev ,
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
@@ -2934,7 +2931,7 @@ static int airo_thread(void *data) {
 				}
 				break;
 			}
-			current->state = TASK_RUNNING;
+			set_current_state(TASK_RUNNING);
 			remove_wait_queue(&ai->thr_wait, &wait);
 			locked = 1;
 		}
@@ -5526,12 +5523,12 @@ static int airo_pci_resume(struct pci_de
 	} else {
 		OUT4500(ai, EVACK, EV_AWAKEN);
 		OUT4500(ai, EVACK, EV_AWAKEN);
-		schedule_timeout(HZ/10);
+		msleep_interruptible(100);
 	}
 
 	set_bit (FLAG_COMMIT, &ai->flags);
 	disable_MAC(ai, 0);
-        schedule_timeout (HZ/5);
+        msleep_interruptible(200);
 	if (ai->SSID) {
 		writeSsidRid(ai, ai->SSID, 0);
 		kfree(ai->SSID);
@@ -7437,8 +7434,7 @@ int cmdreset(struct airo_info *ai) {
 
 	OUT4500(ai,COMMAND,CMD_SOFTRESET);
 
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ);          /* WAS 600 12/7/00 */
+	ssleep(1);			/* WAS 600 12/7/00 */
 
 	if(!waitbusy (ai)){
 		printk(KERN_INFO "Waitbusy hang AFTER RESET\n");
@@ -7465,8 +7461,7 @@ int setflashmode (struct airo_info *ai) 
 		OUT4500(ai, SWS3, FLASH_COMMAND);
 		OUT4500(ai, COMMAND,0);
 	}
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ/2); /* 500ms delay */
+	msleep(500);		/* 500ms delay */
 
 	if(!waitbusy(ai)) {
 		clear_bit (FLAG_FLASHING, &ai->flags);
@@ -7576,8 +7571,7 @@ int flashputbuf(struct airo_info *ai){
 int flashrestart(struct airo_info *ai,struct net_device *dev){
 	int    i,status;
 
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ);          /* Added 12/7/00 */
+	ssleep(1);			/* Added 12/7/00 */
 	clear_bit (FLAG_FLASHING, &ai->flags);
 	if (test_bit(FLAG_MPI, &ai->flags)) {
 		status = mpi_init_descriptors(ai);
@@ -7592,8 +7586,7 @@ int flashrestart(struct airo_info *ai,st
 				( ai, 2312, i >= MAX_FIDS / 2 );
 		}
 
-	set_current_state (TASK_UNINTERRUPTIBLE);
-	schedule_timeout (HZ);          /* Added 12/7/00 */
+	ssleep(1);			/* Added 12/7/00 */
 	return status;
 }
 #endif /* CISCO_EXT */

--===============38668926709928408==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38668926709928408==--
