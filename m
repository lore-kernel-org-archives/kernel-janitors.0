From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:47:32 +0000
Subject: [Kernel-janitors] [PATCH] scsi/osst: replace schedule_timeout()
Message-Id: <20040727224732.GC4537@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28219035941429116=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28219035941429116==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the task
delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/osst.c	2004-06-15 22:19:22.000000000 -0700
+++ linux-dev/drivers/scsi/osst.c	2004-07-27 15:45:31.000000000 -0700
@@ -613,10 +613,8 @@ static int osst_wait_ready(OS_Scsi_Tape 
 	printk(OSST_DEB_MSG "%s:D: Reached onstream wait ready\n", name);
 #endif
 
-	if (initial_delay > 0) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(initial_delay);
-	}
+	if (initial_delay > 0)
+		msleep(jiffies_to_msecs(initial_delay));
 
 	memset(cmd, 0, MAX_COMMAND_SIZE);
 	cmd[0] = TEST_UNIT_READY;
@@ -637,8 +635,7 @@ static int osst_wait_ready(OS_Scsi_Tape 
 		debugging = 0;
 	    }
 #endif
-	    set_current_state(TASK_INTERRUPTIBLE);
-	    schedule_timeout(HZ / 10);
+	    msleep(100);
 
 	    memset(cmd, 0, MAX_COMMAND_SIZE);
 	    cmd[0] = TEST_UNIT_READY;
@@ -697,8 +694,7 @@ static int osst_wait_for_medium(OS_Scsi_
 		debugging = 0;
 	    }
 #endif
-	    set_current_state(TASK_INTERRUPTIBLE);
-	    schedule_timeout(HZ / 10);
+	    msleep(100);
 
 	    memset(cmd, 0, MAX_COMMAND_SIZE);
 	    cmd[0] = TEST_UNIT_READY;
@@ -818,8 +814,7 @@ static int osst_wait_frame(OS_Scsi_Tape 
 			notyetprinted--;
 		}
 #endif
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout (HZ / OSST_POLL_PER_SEC);
+		msleep(1000 / OSST_POLL_PER_SEC);
 	}
 #if DEBUG
 	printk (OSST_DEB_MSG "%s:D: Fail wait f fr %i (>%i): %i-%i %i: %3li.%li s\n",
@@ -1420,8 +1415,7 @@ static int osst_read_back_buffer_and_rew
 					if (SRpnt->sr_sense_buffer[2] == 2 && SRpnt->sr_sense_buffer[12] == 4 &&
 					    (SRpnt->sr_sense_buffer[13] == 1 || SRpnt->sr_sense_buffer[13] == 8)) {
 						/* in the process of becoming ready */
-						set_current_state(TASK_INTERRUPTIBLE);
-						schedule_timeout(HZ / 10);
+						msleep(100);
 						continue;
 					}
 					if (STp->buffer->syscall_result)

--===============28219035941429116==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28219035941429116==--
