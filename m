From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:21:58 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 7/16] scsi/osst: replace
Message-Id: <20040927182158.GV1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30384393745037008=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30384393745037008==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/osst.c	2004-09-13 17:16:00.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/osst.c	2004-09-14 09:13:28.000000000 -0700
@@ -614,8 +614,7 @@ static int osst_wait_ready(OS_Scsi_Tape 
 #endif
 
 	if (initial_delay > 0) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(initial_delay);
+		msleep_interruptible(jiffies_to_msecs(initial_delay));
 	}
 
 	memset(cmd, 0, MAX_COMMAND_SIZE);
@@ -637,8 +636,7 @@ static int osst_wait_ready(OS_Scsi_Tape 
 		debugging = 0;
 	    }
 #endif
-	    set_current_state(TASK_INTERRUPTIBLE);
-	    schedule_timeout(HZ / 10);
+	    msleep_interruptible(100);
 
 	    memset(cmd, 0, MAX_COMMAND_SIZE);
 	    cmd[0] = TEST_UNIT_READY;
@@ -697,8 +695,7 @@ static int osst_wait_for_medium(OS_Scsi_
 		debugging = 0;
 	    }
 #endif
-	    set_current_state(TASK_INTERRUPTIBLE);
-	    schedule_timeout(HZ / 10);
+	    msleep_interruptible(100);
 
 	    memset(cmd, 0, MAX_COMMAND_SIZE);
 	    cmd[0] = TEST_UNIT_READY;
@@ -818,8 +815,7 @@ static int osst_wait_frame(OS_Scsi_Tape 
 			notyetprinted--;
 		}
 #endif
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout (HZ / OSST_POLL_PER_SEC);
+		msleep_interruptible(1000 / OSST_POLL_PER_SEC);
 	}
 #if DEBUG
 	printk (OSST_DEB_MSG "%s:D: Fail wait f fr %i (>%i): %i-%i %i: %3li.%li s\n",
@@ -1420,8 +1416,7 @@ static int osst_read_back_buffer_and_rew
 					if (SRpnt->sr_sense_buffer[2] == 2 && SRpnt->sr_sense_buffer[12] == 4 &&
 					    (SRpnt->sr_sense_buffer[13] == 1 || SRpnt->sr_sense_buffer[13] == 8)) {
 						/* in the process of becoming ready */
-						set_current_state(TASK_INTERRUPTIBLE);
-						schedule_timeout(HZ / 10);
+						msleep_interruptible(100);
 						continue;
 					}
 					if (STp->buffer->syscall_result)
@@ -1493,8 +1488,7 @@ static int osst_reposition_and_retry(OS_
 			osst_set_frame_position(STp, aSRpnt, frame + skip, 1);
 			flag = 0;
 			attempts--;
-			set_current_state(TASK_INTERRUPTIBLE);
-			schedule_timeout(HZ / 10);
+			msleep_interruptible(100);
 		}
 		if (osst_get_frame_position(STp, aSRpnt) < 0) {		/* additional write error */
 #if DEBUG
@@ -1555,7 +1549,7 @@ static int osst_reposition_and_retry(OS_
 			debugging = 0;
 		}
 #endif
-		schedule_timeout(HZ / 10);
+		msleep_interruptible(100);
 	}
 	printk(KERN_ERR "%s:E: Failed to find valid tape media\n", name);
 #if DEBUG

--===============30384393745037008==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30384393745037008==--
